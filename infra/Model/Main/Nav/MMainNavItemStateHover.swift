import UIKit

class MMainNavItemStateHover:MMainNavItemState
{
    private let kSelectable:Bool = false
    private let kHighlightable:Bool = false
    
    init()
    {
        let color:UIColor = UIColor(white:1, alpha:0.1)
        
        super.init(color:color, selectable:kSelectable, highlightable:kHighlightable)
    }
}