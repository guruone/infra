import UIKit

class VCreateCellPicture:VCreateCell
{
    private let kMarginPictureHorizontal:CGFloat = 100
    private let kMarginPictureVertical:CGFloat = 30
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        layoutBaseTop.constant = kMarginPictureVertical
        layoutBaseBottom.constant = -kMarginPictureVertical
        layoutBaseRight.constant = -kMarginPictureHorizontal
        layoutBaseLeft.constant = kMarginPictureHorizontal
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
}