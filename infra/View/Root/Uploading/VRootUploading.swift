import UIKit

class VRootUploading:UIView
{
    weak var controller:CRootListUploading!
    
    convenience init(controller:CRootListUploading)
    {
        self.init()
        clipsToBounds = true
        backgroundColor = UIColor.whiteColor()
        translatesAutoresizingMaskIntoConstraints = false
        self.controller = controller
    }
}
