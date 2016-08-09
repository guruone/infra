import UIKit

class VRootListReviewCell:UICollectionViewCell
{
    weak var label:UILabel!
    weak var layoutLabelLeft:NSLayoutConstraint!
    weak var layoutLabelRight:NSLayoutConstraint!
    weak var layoutLabelTop:NSLayoutConstraint!
    weak var layoutLabelBottom:NSLayoutConstraint!
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        clipsToBounds = true
        backgroundColor = UIColor.clearColor()
        userInteractionEnabled = false
        
        let label:UILabel = UILabel()
        label.userInteractionEnabled = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.regular(14)
        label.textColor = UIColor.main()
        self.label = label
        
        addSubview(label)
        
        layoutLabelTop = NSLayoutConstraint(
            item:label,
            attribute:NSLayoutAttribute.Top,
            relatedBy:NSLayoutRelation.Equal,
            toItem:self,
            attribute:NSLayoutAttribute.Top,
            multiplier:1,
            constant:0)
        layoutLabelBottom = NSLayoutConstraint(
            item:label,
            attribute:NSLayoutAttribute.Top,
            relatedBy:NSLayoutRelation.Equal,
            toItem:self,
            attribute:NSLayoutAttribute.Top,
            multiplier:1,
            constant:0)
        layoutLabelLeft = NSLayoutConstraint(
            item:label,
            attribute:NSLayoutAttribute.Top,
            relatedBy:NSLayoutRelation.Equal,
            toItem:self,
            attribute:NSLayoutAttribute.Top,
            multiplier:1,
            constant:0)
        layoutLabelRight = NSLayoutConstraint(
            item:label,
            attribute:NSLayoutAttribute.Top,
            relatedBy:NSLayoutRelation.Equal,
            toItem:self,
            attribute:NSLayoutAttribute.Top,
            multiplier:1,
            constant:0)
        
        addConstraint(layoutLabelTop)
        addConstraint(layoutLabelBottom)
        addConstraint(layoutLabelLeft)
        addConstraint(layoutLabelRight)
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
    
    //MARK: public
    
    func config(model:MRootPoemsListItem)
    {
        
    }
}