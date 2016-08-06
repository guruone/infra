import UIKit

class COnboarding:UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate
{
    let model:MOnboarding
    weak var pageControl:UIPageControl!
    private let kPageControlBottom:Int = 50
    
    init()
    {
        model = MOnboarding()
        super.init(transitionStyle:UIPageViewControllerTransitionStyle.Scroll, navigationOrientation: UIPageViewControllerNavigationOrientation.Horizontal, options:nil)
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        edgesForExtendedLayout = UIRectEdge.None
        extendedLayoutIncludesOpaqueBars = false
        automaticallyAdjustsScrollViewInsets = false
        dataSource = self
        delegate = self
        
        parent.statusBarDefault()
        
        let pageControl:UIPageControl = UIPageControl()
        pageControl.numberOfPages = model.items.count
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.backgroundColor = UIColor.clearColor()
        pageControl.currentPageIndicatorTintColor = UIColor.complement()
        pageControl.pageIndicatorTintColor = UIColor.main()
        pageControl.addTarget(self, action:#selector(self.actionPageSelected(sender:)), forControlEvents:UIControlEvents.ValueChanged)
        self.pageControl = pageControl
        
        view.addSubview(pageControl)
        
        let views:[String:AnyObject] = [
            "pageControl":pageControl]
        
        let metrics:[String:AnyObject] = [
            "pageControlBottom":kPageControlBottom]
        
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-0-[pageControl]-0-|",
            options:[],
            metrics:metrics,
            views:views))
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:[pageControl(pageControlBottom)]-0-|",
            options:[],
            metrics:metrics,
            views:views))
        
        pageAtIndex(0, animated:false, direction:UIPageViewControllerNavigationDirection.Forward)
    }
    
    //MARK: actions
    
    func actionPageSelected(sender pageControl:UIPageControl)
    {
        let current:Int = currentIndex()
        let selected:Int = pageControl.currentPage
        let direction:UIPageViewControllerNavigationDirection
        
        if current > selected
        {
            direction = UIPageViewControllerNavigationDirection.Reverse
        }
        else
        {
            direction = UIPageViewControllerNavigationDirection.Forward
        }
        
        pageAtIndex(selected, animated:true, direction:direction)
    }
    
    //MARK: private
    
    private func pageAtIndex(index:Int, animated:Bool, direction:UIPageViewControllerNavigationDirection)
    {
        let item:MOnboardingItem = model.items[index]
        pageControl.currentPage = index
        let controller:UIViewController = item.controller(self)
        setViewControllers([controller], direction:direction, animated:animated, completion:nil)
    }
    
    private func currentIndex() -> Int
    {
        let onboardingItem:COnboardingItem = viewControllers!.last! as! COnboardingItem
        let index:Int = onboardingItem.pageModel.index
        
        return index
    }
    
    //MARK: pagecontrol del
    
    func presentationCountForPageViewController(pageViewController:UIPageViewController) -> Int
    {
        return 1
    }
    
    func pageViewController(pageViewController:UIPageViewController, didFinishAnimating finished:Bool, previousViewControllers: [UIViewController], transitionCompleted completed:Bool)
    {
        let current:Int = currentIndex()
        pageControl.currentPage = current
    }
    
    func pageViewController(pageViewController:UIPageViewController, viewControllerBeforeViewController viewController:UIViewController) -> UIViewController?
    {
        let onboardingItem:COnboardingItem = viewController as! COnboardingItem
        let previousController:COnboardingItem? = onboardingItem.pageModel.previousItem?.controller(self)
        
        return previousController
    }
    
    func pageViewController(pageViewController:UIPageViewController, viewControllerAfterViewController viewController:UIViewController) -> UIViewController?
    {
        let onboardingItem:COnboardingItem = viewController as! COnboardingItem
        let nextController:COnboardingItem? = onboardingItem.pageModel.nextItem?.controller(self)
        
        return nextController
    }
}