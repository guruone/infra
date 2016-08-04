import UIKit

class VCreate:UIView
{
    weak var controller:CCreate!
    
    convenience init(controller:CCreate)
    {
        self.init()
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor(white:0.98, alpha:1)
        self.controller = controller
    }
}