import UIKit

class CLanding:CMainController
{
    weak var viewLanding:VLanding!
    
    override func viewDidAppear(animated:Bool)
    {
        super.viewDidAppear(animated)
        
        MConfiguration.sharedInstance.load()
    }
    
    override func loadView()
    {
        let viewLanding:VLanding = VLanding(controller:self)
        self.viewLanding = viewLanding
        view = viewLanding
    }
    
    //MARK: public
    
    func loadFinished()
    {
        viewLanding.animateLanding()
    }
    
    func animationFinished()
    {
        if MConfiguration.sharedInstance.user!.onboarded
        {
            parent.loadHome()
        }
        else
        {
            parent.loadOnboarding()
        }
    }
}