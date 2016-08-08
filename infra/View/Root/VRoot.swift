import UIKit

class VRoot:UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    weak var controller:CRoot!
    weak var spinner:VMainLoader?
    private var sections:Int
    
    init(controller:CRoot)
    {
        sections = 0
        
        super.init(frame:CGRectZero)
        clipsToBounds = true
        backgroundColor = UIColor.whiteColor()
        translatesAutoresizingMaskIntoConstraints = false
        self.controller = controller
        
        let spinner:VMainLoader = VMainLoader()
        self.spinner = spinner
        
        addSubview(spinner)
        
        let views:[String:AnyObject] = [
            "spinner":spinner]
        
        let metrics:[String:AnyObject] = [:]
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-0-[spinner]-0-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-0-[spinner]-0-|",
            options:[],
            metrics:metrics,
            views:views))
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
    
    //MARK: public
    
    func listLoaded()
    {
        sections = 1
        
        dispatch_async(dispatch_get_main_queue())
        { [weak self] in
            
        }
    }
    
    //MARK: col del
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int
    {
        return sections
    }
    
    func collectionView(collectionView:UICollectionView, numberOfItemsInSection section:Int) -> Int
    {
        let count:Int = controller.model.lists.count
        
        return count
    }
    
    func collectionView(collectionView:UICollectionView, cellForItemAtIndexPath indexPath:NSIndexPath) -> UICollectionViewCell
    {
        
    }
}