import UIKit

class CRootListReview:CRootList
{
    weak var viewReview:VRootListReview!
    
    override func loadView()
    {
        let viewReview:VRootListReview = VRootListReview(controller:self)
        self.viewReview = viewReview
        view = viewReview
    }
}