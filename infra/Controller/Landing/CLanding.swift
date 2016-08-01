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
        NSNotification.observeUserSynced(self, sel:#selector(self.notifiedUserSynced(sender:)))
        
        MConfiguration.sharedInstance.load()
    }
    
    override func loadView()
    {
        let viewLanding:VLanding = VLanding(controller:self)
        self.viewLanding = viewLanding
        view = viewLanding
    }
    
    //MARK: notified
    
    func notifiedUserSynced(sender notification:NSNotification)
    {
        dispatch_async(dispatch_get_main_queue())
        { [weak self] in
            
            let home:CHome = CHome()
            self?.parent.pushController(home, transition:MMainTransition.Fade())
        }
    }
}