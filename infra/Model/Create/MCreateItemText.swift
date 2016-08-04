import UIKit

class MCreateItemText:MCreateItem
{
    private let kCellHeight:CGFloat = 250
    
    init()
    {
        let reusableIdentifier:String = VCreateCellText.reusableIdentifier()
        super.init(reusableIdentifier:reusableIdentifier, cellHeight:kCellHeight)
    }
}