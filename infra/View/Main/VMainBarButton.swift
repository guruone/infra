import UIKit

class VMainBarButton:UIButton
{
    weak var label:UILabel?
    private(set) var active:Bool
    
    init(image:String, title:String?)
    {
        active = false
        super.init(frame:CGRectZero)
        translatesAutoresizingMaskIntoConstraints = false
        clipsToBounds = true
        setImage(UIImage(named:image)?.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate), forState:UIControlState.Normal)
        imageView?.contentMode = UIViewContentMode.Center
        imageView?.clipsToBounds = true
        
        if title == nil
        {
            imageEdgeInsets = UIEdgeInsetsMake(20, 0, 0, 0)
        }
        else
        {
            imageEdgeInsets = UIEdgeInsetsMake(18, 0, 12, 0)
            
            let label:UILabel = UILabel()
            label.userInteractionEnabled = false
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = title!
            label.textAlignment = NSTextAlignment.Center
            label.font = UIFont.regular(11)
            self.label = label
            
            addSubview(label)
            
            let views:[String:AnyObject] = [
                "label":label]
            
            let metrics:[String:AnyObject] = [:]
            
            addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
                "H:|-0-[label]-0-|",
                options:[],
                metrics:metrics,
                views:views))
            addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
                "V:[label(13)]-5-|",
                options:[],
                metrics:metrics,
                views:views))
        }
        
        hover()
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
        let color:UIColor
        
        if active
        {
            color = UIColor.whiteColor()
        }
        else if selected || highlighted
        {
            color = UIColor(white:1, alpha:0.2)
        }
        else
        {
            color = UIColor.blackColor()
        }
        
        imageView?.tintColor = color
        label?.textColor = color
    }
    
    //MARK: public
    
    func activate()
    {
        hidden = false
        userInteractionEnabled = false
        active = true
        hover()
    }
    
    func deactivate()
    {
        hidden = false
        userInteractionEnabled = true
        active = false
        hover()
    }
    
    func hide()
    {
        hidden = true
    }
}