import UIKit

class VHome:UIView
{
    weak var controller:CHome!
    weak var spinner:VMainLoader!
    
    convenience init(controller:CHome)
    {
        self.init()
        self.controller = controller
        
        let spinner:VMainLoader = VMainLoader()
        
        addSubview(spinner)
    }
}