import UIKit

class VRootListReview:UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    weak var controller:CRootListReview!
    weak var collection:UICollectionView!
    private let kHeaderHeight:CGFloat = 100
    private let kFooterHeight:CGFloat = 80
    private let kCollectionBottom:CGFloat = 30
    
    convenience init(controller:CRootListReview)
    {
        self.init()
        clipsToBounds = true
        backgroundColor = UIColor.whiteColor()
        translatesAutoresizingMaskIntoConstraints = false
        self.controller = controller
        
        let flow:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        flow.headerReferenceSize = CGSizeMake(0, kHeaderHeight)
        flow.footerReferenceSize = CGSizeMake(0, kFooterHeight)
        flow.minimumLineSpacing = 0
        flow.minimumInteritemSpacing = 0
        flow.scrollDirection = UICollectionViewScrollDirection.Vertical
        flow.sectionInset = UIEdgeInsetsMake(0, 0, kCollectionBottom, 0)
        
        let collection:UICollectionView = UICollectionView(frame:CGRectZero, collectionViewLayout:flow)
        collection.backgroundColor = UIColor.clearColor()
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.showsVerticalScrollIndicator = false
        collection.showsHorizontalScrollIndicator = false
        collection.clipsToBounds = true
        collection.alwaysBounceVertical = true
        collection.dataSource = self
        collection.delegate = self
        collection.registerClass(
            VRootListReviewCell.self,
            forCellWithReuseIdentifier:
            VRootListReviewCell.reusableIdentifier())
        collection.registerClass(
            VRootListReviewHeader.self,
            forSupplementaryViewOfKind:
            UICollectionElementKindSectionHeader,
            withReuseIdentifier:
            VRootListReviewHeader.reusableIdentifier())
        collection.registerClass(
            VRootListReviewFooter.self,
            forSupplementaryViewOfKind:
            UICollectionElementKindSectionFooter,
            withReuseIdentifier:
            VRootListReviewFooter.reusableIdentifier())
        self.collection = collection
        
        addSubview(collection)
    }
    
    //MARK: col del
    
    func numberOfSectionsInCollectionView(collectionView:UICollectionView) -> Int
    {
        let count:Int = controller.model.items.count
        
        return count
    }
    
    func collectionView(collectionView:UICollectionView, numberOfItemsInSection section:Int) -> Int
    {
        return 1
    }
    
    func collectionView(collectionView:UICollectionView, cellForItemAtIndexPath indexPath:NSIndexPath) -> UICollectionViewCell
    {
        let cell
    }
}