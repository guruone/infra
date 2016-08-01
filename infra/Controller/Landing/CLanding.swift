import UIKit

class CLanding:CMainController
{
    weak var viewLanding:VLanding!

    deinit
    {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    override func viewDidAppear(animated:Bool)
    {
        super.viewDidAppear(animated)
        
        NSNotification.observeConfigurated(self, sel:#selector(self.notifiedConfigurated(sender:))
    }
    
    override func loadView()
    {
        let viewLanding:VLanding = VLanding(controller:self)
        self.viewLanding = viewLanding
        view = viewLanding
    }
    
    //MARK: notified
    
    func notifiedConfigurated(sender notification:NSNotification)
    {
        dispatch_async(dispatch_get_main_queue())
        { [weak self] in
            
            let controller:CHome = CHome()
            self?.parent.pushController(controller, scroll:CMainParent.CMainParentScroll.None)
        }
    }
}