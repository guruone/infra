import UIKit

class VHome:UIView
{
    weak var controller:CHome!
    
    convenience init(controller:CHome)
    {
        self.init()
        self.controller = controller
    }
}