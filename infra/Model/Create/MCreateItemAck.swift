import UIKit

class MCreateItemAck:MCreateItem
{
    private let kCellHeight:CGFloat = 60
    
    init()
    {
        let reusableIdentifier:String = VCreateCellAck.reusableIdentifier()
        super.init(reusableIdentifier:reusableIdentifier, cellHeight:kCellHeight)
    }
}