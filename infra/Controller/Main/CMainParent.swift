import UIKit

class CMainParent:UIViewController
{
    weak var bar:VMainBar?
    weak var current:UIViewController?
    private var statusBarStyle:UIStatusBarStyle = UIStatusBarStyle.LightContent
    private let kBarHeight:CGFloat = 64
    private let kAnimationDuration:NSTimeInterval = 0.3
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let landing:CLanding = CLanding()
        rootController(landing)
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle
    {
        return statusBarStyle
    }
    
    override func prefersStatusBarHidden() -> Bool
    {
        return false
    }
    
    //MARK: private
    
    private func rootController(controller:UIViewController)
    {
        current?.view.removeFromSuperview()
        current?.removeFromParentViewController()
        current = controller
        
        addChildViewController(controller)
        controller.view.frame = view.bounds
        view.addSubview(controller.view)
        controller.didMoveToParentViewController(self)
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
    
    func pushController(controller:UIViewController, scroll:CMainParentScroll)
    {
        let enteringRect:CGRect
        let leavingRect:CGRect
        
        switch scroll
        {
            case CMainParentScroll.Left:
                
                enteringRect = rightRect
                leavingRect = leftRect
                
                break
                
            case CMainParentScroll.Right:
                
                enteringRect = leftRect
                leavingRect = rightRect
                
                break
            
            case CMainParentScroll.None:
                
                enteringRect = controllerRect
                leavingRect = view.bounds
                
                break
        }
        
        controller.view.frame = enteringRect
        current!.willMoveToParentViewController(nil)
        addChildViewController(controller)
        
        transitionFromViewController(
            current!,
            toViewController:controller,
            duration:kAnimationDuration,
            options:UIViewAnimationOptions.CurveEaseOut,
            animations:
            {
                controller.view.frame = self.controllerRect
                self.current!.view.frame = leavingRect
            })
        { (done) in
            
            self.current!.removeFromParentViewController()
            controller.didMoveToParentViewController(self)
            self.current = controller
        }
    }
}