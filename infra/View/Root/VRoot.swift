import UIKit

class VRoot:UIView
{
    weak var controller:CRoot!
    
    convenience init(controller:CRoot)
    {
        self.init()
        clipsToBounds = true
        backgroundColor = UIColor.whiteColor()
        translatesAutoresizingMaskIntoConstraints = false
        self.controller = controller
    }
}