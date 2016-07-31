import UIKit

class CLanding:CMainController
{
    weak var viewLanding:VLanding!
    
    override func viewDidAppear(animated:Bool)
    {
        super.viewDidAppear(animated)
        
        let controller:CHome = CHome()
        
        parent.pushController(controller, scroll: CMainParent.CMainParentScroll.None)
    }
    
    override func loadView()
    {
        let viewLanding:VLanding = VLanding(controller:self)
        self.viewLanding = viewLanding
        view = viewLanding
    }
}