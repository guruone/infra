import UIKit

class VOnboardingItemUser:UIView
{
    weak var controller:COnboardingItemUser!
    weak var layoutElementsTop:NSLayoutConstraint!
    weak var layoutFieldLeft:NSLayoutConstraint!
    weak var layoutButtonLeft:NSLayoutConstraint!
    weak var field:UITextField!
    private let kLabelHeight:CGFloat = 40
    private let kFieldHeight:CGFloat = 50
    private let kButtonHeight:CGFloat = 38
    private let kFieldWidth:CGFloat = 160
    private let kButtonWidth:CGFloat = 140
    private let kFieldButtonSpace:CGFloat = 30
    private let kButtonBottom:CGFloat = 50
    
    convenience init(controller:COnboardingItemUser)
    {
        self.init()
        clipsToBounds = true
        backgroundColor = UIColor.clearColor()
        self.controller = controller
        
        let textColor:UIColor = UIColor.blackColor()
        
        let label:UILabel = UILabel()
        label.backgroundColor = UIColor.clearColor()
        label.font = UIFont.bold(20)
        label.textColor = UIColor.main()
        label.numberOfLines = 0
        label.userInteractionEnabled = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = NSTextAlignment.Center
        label.text = NSLocalizedString("VOnboardingItemUser_label", comment:"")
        
        let fieldBase:UIView = UIView()
        fieldBase.clipsToBounds = true
        fieldBase.translatesAutoresizingMaskIntoConstraints = false
        fieldBase.backgroundColor = UIColor.clearColor()
        fieldBase.layer.borderWidth = 1
        fieldBase.layer.borderColor = UIColor(white:0, alpha:0.1).CGColor
        fieldBase.layer.cornerRadius = 4
        
        let field:UITextField = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.clipsToBounds = true
        field.backgroundColor = UIColor.clearColor()
        field.borderStyle = UITextBorderStyle.None
        field.font = UIFont.regular(16)
        field.textColor = textColor
        field.tintColor = textColor
        field.returnKeyType = UIReturnKeyType.Done
        field.keyboardAppearance = UIKeyboardAppearance.Light
        field.autocorrectionType = UITextAutocorrectionType.No
        field.spellCheckingType = UITextSpellCheckingType.No
        field.autocapitalizationType = UITextAutocapitalizationType.Words
        field.clearButtonMode = UITextFieldViewMode.Never
        field.placeholder = NSLocalizedString("VOnboardingItemUser_placeholder", comment:"")
        self.field = field
        
        let button:UIButton = UIButton()
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.main()
        button.layer.cornerRadius = 4
        button.titleLabel?.font = UIFont.bold(14)
        button.setTitleColor(UIColor.whiteColor(), forState:UIControlState.Normal)
        button.setTitleColor(UIColor(white:1, alpha:0.2), forState:UIControlState.Highlighted)
        button.setTitle(NSLocalizedString("VOnboardingItemUser_button", comment:""), forState:UIControlState.Normal)
        
        fieldBase.addSubview(field)
        addSubview(label)
        addSubview(fieldBase)
        addSubview(button)
        
        let views:[String:AnyObject] = [
            "label":label,
            "field":field,
            "fieldBase":fieldBase,
            "button":button]
        
        let metrics:[String:AnyObject] = [
            "labelHeight":kLabelHeight,
            "fieldHeight":kFieldHeight,
            "fieldWidth":kFieldWidth,
            "buttonWidth":kButtonWidth,
            "buttonHeight":kButtonHeight,
            "fieldButtonSpace":kFieldButtonSpace]
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:[fieldBase(fieldWidth)]",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-10-[field]-0-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-0-[label]-0-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:[button(buttonWidth)]",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-0-[field]-0-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:[label(labelHeight)]-0-[fieldBase(fieldHeight)]-(fieldButtonSpace)-[button(buttonHeight)]",
            options:[],
            metrics:metrics,
            views:views))
        
        layoutElementsTop = NSLayoutConstraint(
            item:label,
            attribute:NSLayoutAttribute.Top,
            relatedBy:NSLayoutRelation.Equal,
            toItem:self,
            attribute:NSLayoutAttribute.Top,
            multiplier:1,
            constant:0)
        
        layoutFieldLeft = NSLayoutConstraint(
            item:fieldBase,
            attribute:NSLayoutAttribute.Left,
            relatedBy:NSLayoutRelation.Equal,
            toItem:self,
            attribute:NSLayoutAttribute.Left,
            multiplier:1,
            constant:0)
        
        layoutButtonLeft = NSLayoutConstraint(
            item:button,
            attribute:NSLayoutAttribute.Left,
            relatedBy:NSLayoutRelation.Equal,
            toItem:self,
            attribute:NSLayoutAttribute.Left,
            multiplier:1,
            constant:0)
        
        addConstraint(layoutElementsTop)
        addConstraint(layoutFieldLeft)
        addConstraint(layoutButtonLeft)
    }
    
    override func layoutSubviews()
    {
        let width:CGFloat = bounds.maxX
        let height:CGFloat = bounds.maxY
        let remainField:CGFloat = width - kFieldWidth
        let marginField:CGFloat = remainField / 2.0
        let remainLabel:CGFloat = height - (kLabelHeight + kFieldHeight + kButtonHeight + kFieldButtonSpace + kButtonBottom)
        let marginLabel:CGFloat = remainLabel / 2.0
        let remainButton:CGFloat = width - kButtonWidth
        let marginButton:CGFloat = remainButton / 2.0
        
        layoutElementsTop.constant = marginLabel
        layoutFieldLeft.constant = marginField
        layoutButtonLeft.constant = marginButton
        
        super.layoutSubviews()
    }
}