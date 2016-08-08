import UIKit

class VRootCell:UICollectionViewCell
{
    weak var title:UILabel!
    weak var amount:UILabel!
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        clipsToBounds = true
        
        let title:UILabel = UILabel()
        title.userInteractionEnabled = false
        title.backgroundColor = UIColor.clearColor()
        title.font = UIFont.bold(13)
        title.textColor = UIColor.main()
        title.translatesAutoresizingMaskIntoConstraints = false
        self.title = title
        
        let amount:UILabel = UILabel()
        amount.userInteractionEnabled = false
        amount.backgroundColor = UIColor.clearColor()
        amount.font = UIFont.numeric(18)
        amount.translatesAutoresizingMaskIntoConstraints = false
        amount.textAlignment = NSTextAlignment.Center
        amount.textColor = UIColor.blackColor()
        
        self.amount = amount
        
        addSubview(title)
        addSubview(amount)
        
        let views:[String:AnyObject] = [
            "title":title]
        
        let metrics:[String:AnyObject] = [:]
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-10-[title(150)]",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-0-[title]-0-|",
            options:[],
            metrics:metrics,
            views:views))
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
    
    //MARK: public
    
    func config(list:MRootPoemsList)
    {
        title.text = list.state.title
        
        if list.items.isEmpty
        {
            backgroundColor = UIColor.clearColor()
        }
        else
        {
            backgroundColor = UIColor.whiteColor()
        }
        
        
    }
}