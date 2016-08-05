import UIKit

class MCreateItemPicture:MCreateItem
{
    private let kCellHeight:CGFloat = 250
    
    init()
    {
        let reusableIdentifier:String = VCreateCellPicture.reusableIdentifier()
        super.init(reusableIdentifier:reusableIdentifier, cellHeight:kCellHeight)
    }
}