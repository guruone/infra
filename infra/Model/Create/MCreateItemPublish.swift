import UIKit

class MCreateItemPublish:MCreateItem
{
    private let kCellHeight:CGFloat = 70
    
    init()
    {
        let reusableIdentifier:String = VCreateCellPublish.reusableIdentifier()
        super.init(reusableIdentifier:reusableIdentifier, cellHeight:kCellHeight)
    }
}