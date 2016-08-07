import UIKit

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
        DManager.sharedInstance.managerInfra.fetchManagedObjects(
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
        DManager.sharedInstance.managerInfra.createManagedObject(
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
        DManager.sharedInstance.managerInfra.saver.save(false)
        
        dispatch_async(dispatch_get_main_queue())
        {
            let parent:CMainParent = UIApplication.sharedApplication().keyWindow?.rootViewController as! CMainParent
            
            if self.user!.access == DInfraUser.DInfraUserAccess.Banned
            {
                self.user!.stopSyncing()
                let banned:CAccessBanned = CAccessBanned()
                let transition:MMainTransition = MMainTransition.Replace()
                parent.pushController(banned, transition:transition)
            }
            else
            {
                let landing:CLanding? = parent.current as? CLanding
                
                if landing != nil
                {
                    landing!.loadFinished()
                }
            }
        }
    }
}