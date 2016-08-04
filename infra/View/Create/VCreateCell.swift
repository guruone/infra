import UIKit

class VCreateCell:UICollectionViewCell
{
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        backgroundColor = UIColor.clearColor()
        clipsToBounds = true
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
}