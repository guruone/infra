import UIKit

class VCreateCellTitle:VCreateCell, UITextFieldDelegate
{
    private let kMarginTitleHorizontal:CGFloat = 10
    private let kMarginTitleVertical:CGFloat = 5
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        layoutBaseTop.constant = kMarginTitleVertical
        layoutBaseBottom.constant = -kMarginTitleVertical
        layoutBaseRight.constant = -kMarginTitleHorizontal
        layoutBaseLeft.constant = kMarginTitleHorizontal
        
        let textColor:UIColor = UIColor(white:0.2, alpha:1)
        
        let title:UILabel = UILabel()
        title.font = UIFont.regular(15)
        title.textColor = UIColor(white:0.4, alpha:1)
        title.userInteractionEnabled = false
        title.translatesAutoresizingMaskIntoConstraints = false
        title.backgroundColor = UIColor.clearColor()
        title.text = NSLocalizedString("VCreateCellTitle_label", comment:"")
        
        let field:UITextField = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.clipsToBounds = true
        field.backgroundColor = UIColor.clearColor()
        field.borderStyle = UITextBorderStyle.None
        field.font = UIFont.regular(17)
        field.textColor = textColor
        field.tintColor = textColor
        field.delegate = self
        field.returnKeyType = UIReturnKeyType.Done
        field.keyboardAppearance = UIKeyboardAppearance.Light
        field.autocorrectionType = UITextAutocorrectionType.No
        field.spellCheckingType = UITextSpellCheckingType.No
        field.autocapitalizationType = UITextAutocapitalizationType.Words
        field.clearButtonMode = UITextFieldViewMode.Never
        field.placeholder = NSLocalizedString("VCreateCellTitle_fieldPlaceholder", comment:"")
        
        addSubview(title)
        addSubview(field)
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
}