import UIKit

class VRoot:UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    weak var controller:CRoot!
    weak var spinner:VMainLoader?
    weak var collection:UICollectionView!
    private var sections:Int
    private let kCollectionBottom:CGFloat = 40
    private let kCellHeight:CGFloat = 50
    private let kInterLine:CGFloat = 1
    
    init(controller:CRoot)
    {
        sections = 0
        
        super.init(frame:CGRectZero)
        clipsToBounds = true
        backgroundColor = UIColor(white:0.95, alpha:1)
        translatesAutoresizingMaskIntoConstraints = false
        self.controller = controller
        
        let spinner:VMainLoader = VMainLoader()
        self.spinner = spinner
        
        let flow:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        flow.headerReferenceSize = CGSizeZero
        flow.footerReferenceSize = CGSizeZero
        flow.minimumLineSpacing = kInterLine
        flow.minimumInteritemSpacing = 0
        flow.scrollDirection = UICollectionViewScrollDirection.Vertical
        flow.sectionInset = UIEdgeInsetsMake(0, 0, kCollectionBottom, 0)
        
        let collection:UICollectionView = UICollectionView(frame:CGRectZero, collectionViewLayout:flow)
        collection.clipsToBounds = true
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = UIColor.clearColor()
        collection.showsHorizontalScrollIndicator = false
        collection.showsVerticalScrollIndicator = false
        collection.alwaysBounceVertical = true
        collection.dataSource = self
        collection.delegate = self
        collection.registerClass(
            VRootCell.self,
            forCellWithReuseIdentifier:
            VRootCell.reusableIdentifier())
        self.collection = collection
        
        addSubview(collection)
        addSubview(spinner)
        
        let views:[String:AnyObject] = [
            "spinner":spinner,
            "collection":collection]
        
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
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-0-[collection]-0-|",
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
    
    override func layoutSubviews()
    {
        collection.collectionViewLayout.invalidateLayout()
        super.layoutSubviews()
    }
    
    //MARK: private
    
    private func modelAtIndex(index:NSIndexPath) -> MRootPoemsList
    {
        let item:MRootPoemsList = controller.model.lists[index.item]
        
        return item
    }
    
    //MARK: public
    
    func listLoaded()
    {
        sections = 1
        
        dispatch_async(dispatch_get_main_queue())
        { [weak self] in
          
            self?.spinner?.stopAnimating()
            self?.spinner?.removeFromSuperview()
            self?.collection.reloadData()
        }
    }
    
    //MARK: col del
    
    func collectionView(collectionView:UICollectionView, layout collectionViewLayout:UICollectionViewLayout, sizeForItemAtIndexPath indexPath:NSIndexPath) -> CGSize
    {
        let width:CGFloat = collectionView.bounds.maxX
        let size:CGSize = CGSizeMake(width, kCellHeight)
        
        return size
    }
    
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
        let item:MRootPoemsList = modelAtIndex(indexPath)
        let cell:VRootCell = collectionView.dequeueReusableCellWithReuseIdentifier(
            VRootCell.reusableIdentifier(),
            forIndexPath:
            indexPath) as! VRootCell
        cell.config(item)
        
        return cell
    }
    
    func collectionView(collectionView:UICollectionView, shouldHighlightItemAtIndexPath indexPath:NSIndexPath) -> Bool
    {
        let item:MRootPoemsList = modelAtIndex(indexPath)
        let highlightable:Bool
        
        if item.items.isEmpty
        {
            highlightable = false
        }
        else
        {
            highlightable = true
        }
        
        return highlightable
    }
    
    func collectionView(collectionView:UICollectionView, shouldSelectItemAtIndexPath indexPath:NSIndexPath) -> Bool
    {
        let item:MRootPoemsList = modelAtIndex(indexPath)
        let selectable:Bool
        
        if item.items.isEmpty
        {
            selectable = false
        }
        else
        {
            selectable = true
        }
        
        return selectable
    }
    
    func collectionView(collectionView:UICollectionView, didSelectItemAtIndexPath indexPath:NSIndexPath)
    {
        
    }
}