import UIKit

class CMainParent:UIViewController
{
    weak var bar:VMainBar?
    weak var current:UIViewController?
    private var statusBarStyle:UIStatusBarStyle = UIStatusBarStyle.LightContent
    private let kBarHeight:CGFloat = 64
    
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
        let bar:VMainBar = VMainBar(controller:self)
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
            
            transitionFromViewController(
                current!,
                toViewController:controller,
                duration:transition.animationDuration,
                options:UIViewAnimationOptions.CurveEaseOut,
                animations:
                {
                    transition.after(self, current:self.current, next:controller)
                })
            { (done) in
                
                self.current!.removeFromParentViewController()
                controller.didMoveToParentViewController(self)
                self.current = controller
            }
        }
    }
}