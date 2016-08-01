import UIKit

class VLanding:UIView
{
    weak var controller:CLanding!
    weak var layoutLogoTop:NSLayoutConstraint!
    weak var layoutLogoBottom:NSLayoutConstraint!
    private let kAnimationDuration:NSTimeInterval = 0.3
    private let kBottomTreshold:CGFloat = 50
    
    convenience init(controller:CLanding)
    {
        self.init()
        userInteractionEnabled = false
        clipsToBounds = true
        backgroundColor = UIColor.blackColor()
        translatesAutoresizingMaskIntoConstraints = false
        self.controller = controller
        
        let logo:UIImageView = UIImageView()
        logo.userInteractionEnabled = false
        logo.clipsToBounds = true
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.contentMode = UIViewContentMode.Center
        logo.image = UIImage(named:"genericLogo")
        
        addSubview(logo)
        
        let views:[String:AnyObject] = [
            "logo":logo]
        
        let metrics:[String:AnyObject] = [:]
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-0-[logo]-0-|",
            options:[],
            metrics:metrics,
            views:views))
        
        layoutLogoTop = NSLayoutConstraint(
            item:logo,
            attribute:NSLayoutAttribute.Top,
            relatedBy:NSLayoutRelation.Equal,
            toItem:self,
            attribute:NSLayoutAttribute.Top,
            multiplier:1,
            constant:0)
        layoutLogoBottom = NSLayoutConstraint(
            item:logo,
            attribute:NSLayoutAttribute.Bottom,
            relatedBy:NSLayoutRelation.Equal,
            toItem:self,
            attribute:NSLayoutAttribute.Bottom,
            multiplier:1,
            constant:0)
        addConstraint(layoutLogoTop)
        addConstraint(layoutLogoBottom)
    }
    
    //MARK: public
    
    func animateLanding()
    {
        let viewHeight:CGFloat = bounds.maxY
        layoutLogoTop.constant = kBottomTreshold
        layoutLogoBottom.constant = kBottomTreshold
        
        UIView.animateWithDuration(kAnimationDuration, animations:
        { [weak self] in
            
            self?.layoutIfNeeded()
        })
        { [weak self] (done) in
            
            if self != nil
            {
                self!.layoutLogoTop.constant = -viewHeight
                self!.layoutLogoBottom.constant = -viewHeight
                
                UIView.animateWithDuration(self!.kAnimationDuration, animations:
                { [weak self] in
                    
                    self?.layoutIfNeeded()
                })
                { [weak self] (done) in
                    
                    self?.controller.animationFinished()
                }
            }
        }
    }
}