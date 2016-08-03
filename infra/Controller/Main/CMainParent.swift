import UIKit

class CMainParent:UIViewController
{
    let kBarHeight:CGFloat = 64
    weak var bar:VMainBar?
    weak var current:UIViewController?
    weak var layoutLeft:NSLayoutConstraint?
    weak var layoutRight:NSLayoutConstraint?
    weak var layoutTop:NSLayoutConstraint?
    weak var layoutBottom:NSLayoutConstraint?
    weak var layoutLeftTemporal:NSLayoutConstraint?
    weak var layoutRightTemporal:NSLayoutConstraint?
    weak var layoutTopTemporal:NSLayoutConstraint?
    weak var layoutBottomTemporal:NSLayoutConstraint?
    private var statusBarStyle:UIStatusBarStyle = UIStatusBarStyle.LightContent
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let landing:CLanding = CLanding()
        pushController(landing, transition:MMainTransition.Replace())
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle
    {
        return statusBarStyle
    }
    
    override func prefersStatusBarHidden() -> Bool
    {
        return false
    }
    
    //MARK: public
    
    func statusBarLight()
    {
        statusBarStyle = UIStatusBarStyle.LightContent
        parent.setNeedsStatusBarAppearanceUpdate()
    }
    
    func statusBarDefault()
    {
        statusBarStyle = UIStatusBarStyle.Default
        parent.setNeedsStatusBarAppearanceUpdate()
    }
    
    func loadBar()
    {
        let bar:VMainBar = VMainBar(controllerParent:self)
        self.bar = bar
        
        view.addSubview(bar)
        
        let views:[String:AnyObject] = [
            "bar":bar]
        
        let metrics:[String:AnyObject] = [
            "barHeight":kBarHeight]
        
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-0-[bar]-0-|",
            options:[],
            metrics:metrics,
            views:views))
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-0-[bar(barHeight)]",
            options:[],
            metrics:metrics,
            views:views))
    }
    
    func pushController(controller:UIViewController, transition:MMainTransition)
    {
        addChildViewController(controller)
        view.addSubview(controller.view)
        transition.before(self, current:current, next:controller)
        
        if current == nil
        {
            transition.after(self, current:current, next:controller)
            
            view.addSubview(controller.view)
            controller.didMoveToParentViewController(self)
            current = controller
        }
        else
        {
            current!.willMoveToParentViewController(nil)
            
            UIView.animateWithDuration(transition.animationDuration, animations:
            {
                transition.after(self, current:self.current, next:controller)
            }, completion:
            { (done) in
                
                self.current!.view.removeFromSuperview()
                self.current!.removeFromParentViewController()
                controller.didMoveToParentViewController(self)
                self.current = controller
            })
        }
    }
}