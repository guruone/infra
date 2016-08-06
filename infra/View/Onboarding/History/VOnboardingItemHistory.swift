import UIKit

class VOnboardingItemHistory:UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    weak var controller:COnboardingItemHistory!
    weak var collection:UICollectionView!
    weak var layoutImageLeft:NSLayoutConstraint!
    private let kCollectionWidth:CGFloat = 320
    
    convenience init(controller:COnboardingItemHistory)
    {
        self.init()
        clipsToBounds = true
        backgroundColor = UIColor.whiteColor()
        self.controller = controller
        
        let image:UIImageView = UIImageView()
        image.userInteractionEnabled = false
        image.clipsToBounds = true
        image.contentMode = UIViewContentMode.ScaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named:"onboardingHistory")
        image.layer.cornerRadius = 4
        image.layer.borderWidth = 1
        image.layer.borderColor = UIColor.blackColor().CGColor
        
        addSubview(collection)
        addSubview(image)
        
        let views:[String:AnyObject] = [
            "collection":collection]
        
        let metrics:[String:AnyObject] = [
            "imageTop":kImageTop,
            "imageWidth":kImageWidth,
            "imageHeight":kImageHeight,
            "collectionWidth":kCollectionWidth]
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:[image(imageWidth)]",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-(imageTop)-[image(imageHeight)]",
            options:[],
            metrics:metrics,
            views:views))
        
        layoutImageLeft = NSLayoutConstraint(
            item:image,
            attribute:NSLayoutAttribute.Left,
            relatedBy:NSLayoutRelation.Equal,
            toItem:self,
            attribute:NSLayoutAttribute.Left,
            multiplier:1,
            constant:0)
        
        addConstraint(layoutImageLeft)
    }
    
    override func layoutSubviews()
    {
        let width:CGFloat = bounds.maxX
        let remain:CGFloat = width - kCollectionWidth
        let margin:CGFloat = remain / 2.0
        layoutImageLeft.constant = margin
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
        let count:CGFloat = CGFloat(controller.model.items.count)
        let cellHeight:CGFloat = collectionView.bounds.maxY
        let cellWidth:CGFloat = kCollectionWidth / count
        let size:CGSize = CGSizeMake(cellWidth, cellHeight)
        
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
}