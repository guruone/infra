import UIKit

class CRootListReview:CRootList
{
    weak var viewReview:VRootListReview!
    private let queue:dispatch_queue_t
    
    required init(model:MRootPoemsList)
    {
        queue = dispatch_queue_create("queue_items", DISPATCH_QUEUE_SERIAL)
        dispatch_set_target_queue(queue, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0))
        
        super.init(model:model)
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        if !model.items.isEmpty
        {
            let indexPath:NSIndexPath = NSIndexPath(forItem:0, inSection:0)
            pullItems(indexPath)
        }
    }
    
    override func loadView()
    {
        let viewReview:VRootListReview = VRootListReview(controller:self)
        self.viewReview = viewReview
        view = viewReview
    }
    
    private func backgroundPull(index:Int)
    {
        let max:Int = model.items.count
        let nextItem:Int = index + 1
        
        if nextItem < max
        {
            let item:MRootPoemsListItem = model.items[nextItem]
            item.itemStatus?.pull()
            { [weak self] (error) in
                
                if error == nil
                {
                    self?.insertItem(item)
                }
                else
                {
                    item.errored(error!)
                }
            }
        }
    }
    
    private func insertItem(item:MRootPoemsListItem)
    {
        let currentLastItem:Int = viewReview.model.count
        let indexSet:NSIndexSet = NSIndexSet(index:currentLastItem)
        
        dispatch_async(queue)
        { [weak self] in
            
            self?.viewReview.model.append(item)
            
            dispatch_async(dispatch_get_main_queue())
            { [weak self] in
                
                self?.viewReview.collection.performBatchUpdates(
                { [weak self] in
                    
                    self?.viewReview.collection.insertSections(indexSet)
                    
                }, completion:nil)
            }
        }
    }
    
    //MARK: public
    
    func pullItems(lastPulled:NSIndexPath)
    {
        let index:Int = lastPulled.section
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0))
        { [weak self] in
            
            self?.backgroundPull(index)
        }
    }
}