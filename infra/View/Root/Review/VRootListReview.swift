import UIKit

class VRootListReview:UIView
{
    weak var controller:CRootListReview!
    
    convenience init(controller:CRootListReview)
    {
        self.init()
        clipsToBounds = true
        backgroundColor = UIColor.whiteColor()
        translatesAutoresizingMaskIntoConstraints = false
        self.controller = controller
    }
}