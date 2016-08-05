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
    
    //MARK: public
    
    func publish()
    {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0))
        { [weak self] in
            
            let title
        }
    }
}