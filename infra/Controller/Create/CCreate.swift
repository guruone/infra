import UIKit

class CCreate:CMainController, FStoragePoemDelegate
{
    weak var viewCreate:VCreate!
    weak var publishItem:MCreateItemPublish?
    let model:MCreate
    private var poemId:String?
    private var fPoem:FDatabaseModelPoem?
    
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
    
    private func publishFailed(error:String)
    {
        publishItem?.publishFailed()
        VMainAlert.Message(error)
    }
    
    private func createPoem(poem:NSURL)
    {
        let poemTitle:String = model.itemTitle.title
        fPoem = FDatabaseModelPoem(title:poemTitle)
        poemId = FMain.sharedInstance.database.newPoem(fPoem!)
        FMain.sharedInstance.storage.savePoem(poemId!, poem:poem, delegate:self)
    }
    
    private func poemSaved()
    {
        let message:String = NSLocalizedString("CCreate_poemSaved", comment:"")
        VMainAlert.Message(message)
        
        dispatch_async(dispatch_get_main_queue())
        { [weak self] in
            
            self?.model.clean()
        }
    }
    
    //MARK: public
    
    func publish(publishItem:MCreateItemPublish)
    {
        self.publishItem = publishItem
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0))
        { [weak self] in
            
            let error:String? = self?.model.validate()
            
            if error == nil
            {
                let poemUrl:NSURL? = self?.model.poemFile()
                
                if poemUrl == nil
                {
                    let errorSaving:String = NSLocalizedString("CCreate_errorSaveFile", comment:"")
                    self?.publishFailed(errorSaving)
                }
                else
                {
                    self?.createPoem(poemUrl!)
                }
            }
            else
            {
                self?.publishFailed(error!)
            }
        }
    }
    
    //MARK: storage poem
    
    func fStoragePoemSaved()
    {
        DManager.sharedInstance.managerInfra.createManagedObject(DInfraPoem.self)
        { [weak self] (model) in
            
            if self?.poemId != nil && self?.fPoem != nil
            {
                model.justSaved(self!.poemId!)
                
                let property:[String:AnyObject] = self!.fPoem!.propertyStatus(model.status)
                FMain.sharedInstance.database.updatePoem(self!.poemId!, property:property)
                
                self?.poemSaved()
            }
            else
            {
                let errorSaving:String = NSLocalizedString("CCreate_errorSaveFile", comment:"")
                self?.publishFailed(errorSaving)
            }
        }
    }
    
    func fStoragePoemError(error:String)
    {
        publishFailed(error)
    }
}