import UIKit

class CRootListReview:CRootList
{
    weak var viewReview:VRootListReview!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()   
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
            item.itemStatus.pull()
            { (error) in
                
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