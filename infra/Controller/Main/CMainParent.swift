import UIKit

class CMainParent:UIViewController
{
    weak var bar:VMainBar!
    weak var current:UIViewController?
    private var controllerRect:CGRect!
    private var statusBarStyle:UIStatusBarStyle = UIStatusBarStyle.LightContent
    private let kBarHeight:CGFloat = 64
    private let kAnimationDuration:NSTimeInterval = 0.3
    
    enum CMainParentScroll
    {
        case Left
        case Right
        case None
    }
    
    private lazy var leftRect:CGRect =
    {
        let rect:CGRect = CGRectMake(-self.controllerRect.maxX, self.controllerRect.minY, self.controllerRect.maxX, self.controllerRect.maxY)
        
        return rect
    }()
    
    private lazy var rightRect:CGRect =
    {
        let rect:CGRect = CGRectMake(self.controllerRect.maxX, self.controllerRect.minY, self.controllerRect.maxX, self.controllerRect.maxY)
        
        return rect
    }()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        controllerRect = CGRectMake(0, kBarHeight, view.bounds.maxX, view.bounds.maxY - kBarHeight)
        
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
    
    private func loadBar()
    {
        let bar:VMainBar = VMainBar(controller:self)
        bar.frame = CGRectMake(0, 0, view.bounds.maxX, kBarHeight)
        self.bar = bar
        
        view.addSubview(bar)
    }
    
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
    
    func pushController(controller:UIViewController, scroll:CMainParentScroll)
    {
        if bar == nil
        {
            loadBar()
        }
        
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
                leavingRect = controllerRect
                
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