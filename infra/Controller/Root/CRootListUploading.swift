import UIKit

class CRootListUploading:CRootList
{
    weak var viewUploading:VRootListUploading!
    
    override func loadView()
    {
        let viewUploading:VRootListUploading = VRootListUploading(controller:self)
        self.viewUploading = viewUploading
        view = viewUploading
    }
    
    //MARK: private
    
    private func removeCompleted()
    {
        parent.backController()
    }
    
    //MARK: public
    
    func removeAll()
    {
        for item:MRootPoemsListItem in model.items
        {
            let poemId:String = item.poemId
            FMain.sharedInstance.storage.deletePoem(poemId)
            { (error) in
                
                FMain.sharedInstance.database.deletePoem(poemId)
            }
        }
        
        let message:String = NSLocalizedString("CRootListUploading_done", comment:"")
        VMainAlert.Message(message)
        model.items = []
        
        dispatch_async(dispatch_get_main_queue())
        { [weak self] in
            
            self?.removeCompleted()
        }
    }
}