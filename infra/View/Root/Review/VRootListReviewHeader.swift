import UIKit

class VRootListReviewHeader:UICollectionReusableView
{
    weak var label:UILabel!
    private let attrTitle:[String:AnyObject]
    private let attrUser:[String:AnyObject]
    
    override init(frame:CGRect)
    {
        attrTitle = [NSFontAttributeName:UIFont.regular(17), NSForegroundColorAttributeName:UIColor.blackColor()]
        attrUser = [NSFontAttributeName:UIFont.regular(15), NSForegroundColorAttributeName:UIColor(white:0.5, alpha:1)]
        
        super.init(frame:frame)
        clipsToBounds = true
        backgroundColor = UIColor.clearColor()
        userInteractionEnabled = false
        
        let label:UILabel = UILabel()
        label.userInteractionEnabled = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        self.label = label
        
        addSubview(label)
        
        let views:[String:AnyObject] = [
            "label":label]
        
        let metrics:[String:AnyObject] = [:]
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-10-[label]-10-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-0-[label]-0-|",
            options:[],
            metrics:metrics,
            views:views))
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
    
    //MARK: public
    
    func config(model:MRootPoemsListItem)
    {
        let mutableString:NSMutableAttributedString = NSMutableAttributedString()
        let rawTitle:String = "\(model.title)"
        let rawUser:String
        
        if model.userName == nil
        {
            rawUser = ""
        }
        else
        {
            rawUser = String(format:NSLocalizedString("VRootListReviewHeader_labelUser", comment:""), model.userName!)
        }
        
        let stringTitle:NSAttributedString = NSAttributedString(string:rawTitle, attributes:attrTitle)
        let stringUser:NSAttributedString = NSAttributedString(string:rawUser, attributes:attrUser)
        mutableString.appendAttributedString(stringTitle)
        mutableString.appendAttributedString(stringUser)
        
        label.attributedText = mutableString
    }
}