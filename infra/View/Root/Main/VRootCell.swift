import UIKit

class VRootCell:UICollectionViewCell
{
    weak var title:UILabel!
    weak var amount:UILabel!
    weak var circle:UIImageView!
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        clipsToBounds = true
        
        let title:UILabel = UILabel()
        title.userInteractionEnabled = false
        title.backgroundColor = UIColor.clearColor()
        title.font = UIFont.bold(15)
        title.translatesAutoresizingMaskIntoConstraints = false
        self.title = title
        
        let amount:UILabel = UILabel()
        amount.userInteractionEnabled = false
        amount.backgroundColor = UIColor.clearColor()
        amount.font = UIFont.numeric(12)
        amount.translatesAutoresizingMaskIntoConstraints = false
        amount.textAlignment = NSTextAlignment.Center
        self.amount = amount
        
        let circle:UIImageView = UIImageView()
        circle.userInteractionEnabled = false
        circle.clipsToBounds = true
        circle.translatesAutoresizingMaskIntoConstraints = false
        circle.image = UIImage(named:"genericCircle")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
        circle.contentMode = UIViewContentMode.Center
        circle.tintColor = UIColor.complement()
        self.circle = circle
        
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
    
    override var selected:Bool
    {
        didSet
        {
            hover()
        }
    }
    
    override var highlighted:Bool
    {
        didSet
        {
            hover()
        }
    }
    
    //MARK: private
    
    private func hover()
    {
        if selected || highlighted
        {
            alpha = 0.1
        }
        else
        {
            alpha = 1
        }
    }
    
    //MARK: public
    
    func config(list:MRootPoemsList)
    {
        title.text = list.state.title
        let intAmount:Int = list.items.count
        let stringAmount:String = "\(intAmount)"
        
        if intAmount == 0
        {
            title.textColor = UIColor(white:0.7, alpha:1)
            amount.textColor = UIColor(white:0.7, alpha:1)
            backgroundColor = UIColor.clearColor()
            circle.hidden = true
        }
        else
        {
            title.textColor = UIColor.main()
            amount.textColor = UIColor.main()
            backgroundColor = UIColor.whiteColor()
            circle.hidden = false
        }
        
        amount.text = stringAmount
        hover()
    }
}