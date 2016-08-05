import UIKit

class CLanding:CMainController
{
    weak var viewLanding:VLanding!
    private(set) var firstTime:Bool?
    
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
    
    func loadFinished(firstTime:Bool)
    {
        self.firstTime = firstTime
        viewLanding.animateLanding()
    }
    
    func animationFinished()
    {
        if firstTime!
        {
            parent.loadOnboarding()
        }
        else
        {
            parent.loadHome()
        }
    }
}