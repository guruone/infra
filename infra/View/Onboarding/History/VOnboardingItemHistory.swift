import UIKit

class VOnboardingItemHistory:UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    weak var controller:COnboardingItemHistory!
    weak var collection:UICollectionView!
    weak var layoutCollectionTop:NSLayoutConstraint!
    weak var layoutCollectionLeft:NSLayoutConstraint!
    private let kCollectionWidth:CGFloat = 320
    private let kCollectionHeight:CGFloat = 259
    
    convenience init(controller:COnboardingItemHistory)
    {
        self.init()
        clipsToBounds = true
        backgroundColor = UIColor.whiteColor()
        self.controller = controller
        
        let flow:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        flow.headerReferenceSize = CGSizeZero
        flow.footerReferenceSize = CGSizeZero
        flow.minimumLineSpacing = 0
        flow.minimumInteritemSpacing = 0
        flow.scrollDirection = UICollectionViewScrollDirection.Horizontal
        flow.sectionInset = UIEdgeInsetsZero
        
        let collection:UICollectionView = UICollectionView(frame:CGRectZero, collectionViewLayout:flow)
        collection.clipsToBounds = true
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = UIColor.clearColor()
        collection.scrollEnabled = false
        collection.bounces = false
        collection.showsVerticalScrollIndicator = false
        collection.showsHorizontalScrollIndicator = false
        collection.delegate = self
        collection.dataSource = self
        collection.registerClass(
            VOnboardingItemHistoryImage.self,
            forCellWithReuseIdentifier:
            VOnboardingItemHistoryImage.reusableIdentifier())
        collection.registerClass(
            VOnboardingItemHistoryDescr.self,
            forCellWithReuseIdentifier:
            VOnboardingItemHistoryDescr.reusableIdentifier())
        self.collection = collection
        
        addSubview(collection)
        
        let views:[String:AnyObject] = [
            "collection":collection]
        
        let metrics:[String:AnyObject] = [
            "collectionWidth":kCollectionWidth,
            "collectionHeight":kCollectionHeight]
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:[collection(collectionWidth)]",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:[collection(collectionHeight)]",
            options:[],
            metrics:metrics,
            views:views))
        
        layoutCollectionTop = NSLayoutConstraint(
            item:collection,
            attribute:NSLayoutAttribute.Top,
            relatedBy:NSLayoutRelation.Equal,
            toItem:self,
            attribute:NSLayoutAttribute.Top,
            multiplier:1,
            constant:0)
        layoutCollectionLeft = NSLayoutConstraint(
            item:collection,
            attribute:NSLayoutAttribute.Left,
            relatedBy:NSLayoutRelation.Equal,
            toItem:self,
            attribute:NSLayoutAttribute.Left,
            multiplier:1,
            constant:0)
        
        addConstraint(layoutCollectionTop)
        addConstraint(layoutCollectionLeft)
    }
    
    override func layoutSubviews()
    {
        let width:CGFloat = bounds.maxX
        let height:CGFloat = bounds.maxY
        let remainX:CGFloat = width - kCollectionWidth
        let remainY:CGFloat = height - kCollectionHeight
        let marginX:CGFloat = remainX / 2.0
        let marginY:CGFloat = remainY / 2.0
        layoutCollectionTop.constant = marginY
        layoutCollectionLeft.constant = marginX
        collection.collectionViewLayout.invalidateLayout()
        
        super.layoutSubviews()
    }
    
    //MARK: private
    
    private func modelAtIndex(index:NSIndexPath) -> MOnboardingItemHistoryModelItem
    {
        let item:MOnboardingItemHistoryModelItem = controller.model.items[index.item]
        
        return item
    }
    
    //MARK: col del
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize
    {
        let item:MOnboardingItemHistoryModelItem = modelAtIndex(indexPath)
        let cellHeight:CGFloat = collectionView.bounds.maxY
        let size:CGSize = CGSizeMake(item.cellWidth, cellHeight)
        
        return size
    }
    
    func numberOfSectionsInCollectionView(collectionView:UICollectionView) -> Int
    {
        return 1
    }
    
    func collectionView(collectionView:UICollectionView, numberOfItemsInSection section:Int) -> Int
    {
        let count:Int = controller.model.items.count
        
        return count
    }
    
    func collectionView(collectionView:UICollectionView, cellForItemAtIndexPath indexPath:NSIndexPath) -> UICollectionViewCell
    {
        let item:MOnboardingItemHistoryModelItem = modelAtIndex(indexPath)
        let cell:UICollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier(item.reusableIdentifier, forIndexPath:indexPath)
        
        return cell
    }
    
    func collectionView(collectionView:UICollectionView, shouldDeselectItemAtIndexPath indexPath:NSIndexPath) -> Bool
    {
        return false
    }
    
    func collectionView(collectionView:UICollectionView, shouldSelectItemAtIndexPath indexPath:NSIndexPath) -> Bool
    {
        return false
    }
}