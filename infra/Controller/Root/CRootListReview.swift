import UIKit

class CRootListReview:CRootList
{
    weak var viewReview:VRootListReview!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0))
        { [weak self] in
            
            self?.backgroundPull(0)
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
        
        if index < max
        {
            let item:MRootPoemsListItem = model.items[index]
            
            if !viewReview.model.contains(
            { anItem in
                
                return anItem === item
            })
            {
                item.itemStatus?.pull()
                { [weak self] (error) in
                    
                    if error == nil
                    {
                        item.completed()
                        self?.insertItem(item)
                    }
                    else
                    {
                        item.errored(error!)
                    }
                }
            }
        }
    }
    
    private func insertItem(item:MRootPoemsListItem)
    {
        let currentLastItem:Int = viewReview.model.count
        let indexSet:NSIndexSet = NSIndexSet(index:currentLastItem)
        
        dispatch_async(dispatch_get_main_queue())
        { [weak self] in
            
            self?.viewReview.model.append(item)
            self?.viewReview.collection.insertSections(indexSet)
        }
    }
    
    //MARK: public
    
    func pullItems(lastPulled:NSIndexPath)
    {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0))
        { [weak self] in
            
            let index:Int = lastPulled.section + 1
            self?.backgroundPull(index)
        }
    }
}