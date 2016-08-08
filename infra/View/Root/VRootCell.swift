import UIKit

class VRootCell:UICollectionViewCell
{
    weak var title:UILabel!
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        clipsToBounds = true
        backgroundColor = UIColor.clearColor()
        
        let title:UILabel = UILabel()
        title.userInteractionEnabled = false
        title.backgroundColor = UIColor.clearColor()
        title.font = UIFont.bold(14)
        title.textColor = UIColor.main()
        title.translatesAutoresizingMaskIntoConstraints = false
        self.title = title
        
        addSubview(title)
        
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
    }
}