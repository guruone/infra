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
        title.font = UIFont.bold(15)
        title.textColor = UIColor.main()
        title.translatesAutoresizingMaskIntoConstraints = false
        self.title = title
        
        let amount:UILabel = UILabel()
        amount.userInteractionEnabled = false
        amount.backgroundColor = UIColor.clearColor()
        amount.font = UIFont.numeric(16)
        amount.translatesAutoresizingMaskIntoConstraints = false
        amount.textAlignment = NSTextAlignment.Center
        amount.textColor = UIColor.complement()
        self.amount = amount
        
        let circle:UIImageView = UIImageView()
        circle.userInteractionEnabled = false
        circle.clipsToBounds = true
        circle.translatesAutoresizingMaskIntoConstraints = false
        circle.image = UIImage(named:"genericCircle")
        circle.contentMode = UIViewContentMode.Center
        
        addSubview(title)
        addSubview(circle)
        addSubview(amount)
        
        let views:[String:AnyObject] = [
            "title":title,
            "amount":amount,
            "circle":circle]
        
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
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:[circle(60)]-0-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-0-[circle]-0-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:[amount(60)]-0-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-0-[amount]-0-|",
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
        let intAmount:Int = list.items.count
        let stringAmount:String = "\(intAmount)"
        
        if intAmount == 0
        {
            backgroundColor = UIColor.clearColor()
        }
        else
        {
            backgroundColor = UIColor.whiteColor()
        }
        
        amount.text = stringAmount
    }
}