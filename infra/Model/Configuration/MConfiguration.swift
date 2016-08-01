import Foundation

class MConfiguration
{
    static let sharedInstance = MConfiguration()
    let font:MConfigurationFont
    private(set) var user:DInfraUser?
    
    private init()
    {
        font = MConfigurationFont()
    }
    
    //MARK: private
    
    private func loadUser()
    {
        DManager.sharedInstance.managerUbik.fetchManagedObjects(
            DInfraUser.self,
            limit:1)
        { (models) in
            
            if models.isEmpty
            {
                self.createUser()
            }
            else
            {
                self.user = models.first
                self.userLoaded()
            }
        }
    }
    
    private func createUser()
    {
        DManager.sharedInstance.managerUbik.createManagedObject(
            DInfraUser.self)
        { (model) in
            
            self.user = model
            self.userLoaded()
        }
    }
    
    private func userLoaded()
    {
        user?.syncUser()
    }
    
    //MARK: public
    
    func load()
    {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0))
        {
            self.font.loadFonts()
            self.loadUser()
        }
    }
    
    func userSynced()
    {
        DManager.sharedInstance.managerUbik.saver.save(false)
    }
}