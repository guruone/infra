import UIKit

class VAccessBanned:UIView
{
    weak var controller:CAccessBanned!
    
    convenience init(controller:CAccessBanned)
    {
        self.init()
        clipsToBounds = true
        backgroundColor = UIColor.blueColor()
        userInteractionEnabled = false
        self.controller = controller
    }
}