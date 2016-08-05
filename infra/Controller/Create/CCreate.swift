import UIKit

class CCreate:CMainController
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
                    
                }
            }
            else
            {
                self?.publishFailed(publishItem, error:error!)
            }
        }
    }
}