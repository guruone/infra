import UIKit

class VMainBar:UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    weak var controller:CMainParent!
    private let kButtonWidth:CGFloat = 55
    
    convenience init(controller:CMainParent)
    {
        self.init()
        backgroundColor = UIColor.main()
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
        self.controller = controller
        
        let buttonHome:VMainBarButtonHome = VMainBarButtonHome()
        self.buttonHome = buttonHome
        
        addSubview(buttonHome)
        
        let views:[String:AnyObject] = [
            "buttonHome":buttonHome]
        
        let metrics:[String:AnyObject] = [
            "buttonWidth":kButtonWidth,
            "buttonHeight":kButtonHeight]
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:[buttonHome(buttonWidth)]",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-0-[buttonHome(buttonHeight)]",
            options:[],
            metrics:metrics,
            views:views))
    }
    
    //MARK: col del
    
    func numberOfSectionsInCollectionView(collectionView:UICollectionView) -> Int
    {
        return 1
    }
}