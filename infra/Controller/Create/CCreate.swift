import UIKit

class CCreate:CMainController, FStoragePoemDelegate
{
    weak var viewCreate:VCreate!
    let model:MCreate
    
    init()
    {
        model = MCreate()
        super.init(nibName:nil, bundle:nil)
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
    
    override func loadView()
    {
        let viewCreate:VCreate = VCreate(controller:self)
        self.viewCreate = viewCreate
        view = viewCreate
    }
    
    //MARK: private
    
    private func publishFailed(publishItem:MCreateItemPublish, error:String)
    {
        publishItem.publishFailed()
        VMainAlert.Message(error)
    }
    
    private func createPoem(poem:NSURL)
    {
        let poemTitle:String = model.itemTitle.title
        let fPoem:FDatabaseModelPoem = FDatabaseModelPoem(title:poemTitle)
        let newPoemId:String = FMain.sharedInstance.database.newPoem(fPoem)
        FMain.sharedInstance.storage.savePoem(newPoemId, poem:poem, delegate:self)
        /*
        DManager.sharedInstance.managerInfra.createManagedObject(DInfraPoem.self)
        { (model) in
            
            
        }*/
    }
    
    //MARK: public
    
    func publish(publishItem:MCreateItemPublish)
    {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0))
        { [weak self] in
            
            let error:String? = self?.model.validate()
            
            if error == nil
            {
                let poemUrl:NSURL? = self?.model.poemFile()
                
                if poemUrl == nil
                {
                    let errorSaving:String = NSLocalizedString("CCreate_errorSaveFile", comment:"")
                    self?.publishFailed(publishItem, error:errorSaving)
                }
                else
                {
                    self?.createPoem(poemUrl!)
                }
            }
            else
            {
                self?.publishFailed(publishItem, error:error!)
            }
        }
    }
    
    //MARK: storage poem
    
    func fStoragePoemSaved()
    {
    }
    
    func fStoragePoemError(error:String)
    {
    }
}