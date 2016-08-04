import UIKit

class MCreateItemPicture:MCreateItem
{
    private let kCellHeight:CGFloat = 200
    
    init()
    {
        let reusableIdentifier:String = VCreateCellPicture.reusableIdentifier()
        super.init(reusableIdentifier:reusableIdentifier, cellHeight:kCellHeight)
    }
}