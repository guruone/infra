import UIKit

class MCreateItemPublish:MCreateItem
{
    weak var controller:CCreate!
    weak var cellPublish:VCreateCellPublish!
    private let kCellHeight:CGFloat = 65
    
    init()
    {
        let reusableIdentifier:String = VCreateCellPublish.reusableIdentifier()
        super.init(reusableIdentifier:reusableIdentifier, cellHeight:kCellHeight)
    }
    
    override func config(cell:VCreateCell, controller:CCreate, indexPath:NSIndexPath)
    {
        self.controller = controller
        cellPublish = cell as! VCreateCellPublish
        cellPublish.button.addTarget(self, action:#selector(self.actionPublish(sender:)), forControlEvents:UIControlEvents.TouchUpInside)
    }
    
    //MARK: actions
    
    func actionPublish(sender button:UIButton)
    {
        UIApplication.sharedApplication().keyWindow?.endEditing(true)
        cellPublish.showLoading()
        controller.publish()
    }
}