import UIKit

class CRootListReview:CRootList
{
    weak var viewReview:VRootListReview!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let count:Int
        
        if model.items.count
    }
    
    override func loadView()
    {
        let viewReview:VRootListReview = VRootListReview(controller:self)
        self.viewReview = viewReview
        view = viewReview
    }
}