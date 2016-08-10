import UIKit

class VRootListReviewFooter:UICollectionReusableView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    let actions:[MRootPoemsListItemAction]
    weak var collection:UICollectionView!
    weak var model:MRootPoemsListItem?
    private let kCellWidth:CGFloat = 80
    
    override init(frame:CGRect)
    {
        let actionRevision:MRootPoemsListItemActionRevision = MRootPoemsListItemAction.Revision()
        let actionReject:MRootPoemsListItemActionReject = MRootPoemsListItemAction.Reject()
        let actionAccept:MRootPoemsListItemActionAccept = MRootPoemsListItemAction.Accept()
        
        actions = [
            actionRevision,
            actionReject,
            actionAccept
        ]
        
        super.init(frame:frame)
        clipsToBounds = true
        backgroundColor = UIColor.clearColor()
        userInteractionEnabled = false
        
        let collectionWidth:CGFloat = kCellWidth * CGFloat(actions.count)
        let flow:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        flow.headerReferenceSize = CGSizeZero
        flow.footerReferenceSize = CGSizeZero
        flow.minimumLineSpacing = 0
        flow.minimumInteritemSpacing = 0
        flow.scrollDirection = UICollectionViewScrollDirection.Horizontal
        flow.sectionInset = UIEdgeInsetsZero
        
        let collection:UICollectionView = UICollectionView(frame:CGRectZero, collectionViewLayout:flow)
        collection.clipsToBounds = true
        collection.backgroundColor = UIColor.clearColor()
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.scrollEnabled = false
        collection.bounces = false
        collection.showsVerticalScrollIndicator = false
        collection.showsHorizontalScrollIndicator = false
        collection.delegate = self
        collection.dataSource = self
        collection.registerClass(
            VRootListReviewFooterOption.self,
            forCellWithReuseIdentifier:
            VRootListReviewFooterOption.reusableIdentifier())
        
        addSubview(collection)
        
        let views:[String:AnyObject] = [
            "collection":collection]
        
        let metrics:[String:AnyObject] = [
            "collectionWidth":collectionWidth]
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-0-[collection(collectionWidth)]",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-0-[collection]-0-|",
            options:[],
            metrics:metrics,
            views:views))
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
    
    //MARK: private
    
    private func modelAtIndex(index:NSIndexPath) -> MRootPoemsListItemAction
    {
        let item:MRootPoemsListItemAction = actions[index.item]
        
        return item
    }
    
    //MARK: public
    
    func config(model:MRootPoemsListItem)
    {
        self.model = model
    }
    
    //MARK: col del
    
    func numberOfSectionsInCollectionView(collectionView:UICollectionView) -> Int
    {
        return 1
    }
    
    func collectionView(collectionView:UICollectionView, numberOfItemsInSection section:Int) -> Int
    {
        let count:Int = actions.count
        
        return count
    }
    
    func collectionView(collectionView:UICollectionView, cellForItemAtIndexPath indexPath:NSIndexPath) -> UICollectionViewCell
    {
        let item:MRootPoemsListItemAction = modelAtIndex(indexPath)
        let cell:VRootListReviewFooterOption = collectionView.dequeueReusableCellWithReuseIdentifier(
            VRootListReviewFooterOption.reusableIdentifier(),
            forIndexPath:
            indexPath) as! VRootListReviewFooterOption
        cell.config(item)
        
        return cell
    }
}