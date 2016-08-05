import UIKit

class VCreateCellText:VCreateCell
{
    private let kMarginTextHorizontal:CGFloat = 10
    private let kMarginTextVertical:CGFloat = 5
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        layoutBaseTop.constant = kMarginTextVertical
        layoutBaseBottom.constant = -kMarginTextVertical
        layoutBaseRight.constant = -kMarginTextHorizontal
        layoutBaseLeft.constant = kMarginTextHorizontal
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
}