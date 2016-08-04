import UIKit

class MCreateItemTitle:MCreateItem
{
    private let kCellHeight:CGFloat = 80
    
    init()
    {
        let reusableIdentifier:String = VCreateCellTitle.reusableIdentifier()
        super.init(reusableIdentifier:reusableIdentifier, cellHeight:kCellHeight)
    }
}