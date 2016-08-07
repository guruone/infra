import UIKit

class MCreateItemText:MCreateItem, UITextViewDelegate
{
    weak var controller:CCreate!
    weak var cellText:VCreateCellText!
    weak var indexPath:NSIndexPath!
    private(set) var text:String
    private let kCellHeight:CGFloat = 180
    private let kMinTextLength:Int = 1
    private let kMaxTextLength:Int = 2048
    
    init()
    {
        let reusableIdentifier:String = VCreateCellText.reusableIdentifier()
        text = ""
        super.init(reusableIdentifier:reusableIdentifier, cellHeight:kCellHeight)
    }
    
    override func config(cell:VCreateCell, controller:CCreate, indexPath:NSIndexPath)
    {
        self.controller = controller
        self.indexPath = indexPath
        cellText = cell as! VCreateCellText
        cellText.textView.delegate = self
    }
    
    override func validate() -> String?
    {
        var error:String?
        let countCharacters:Int = text.characters.count
        
        if countCharacters < kMinTextLength
        {
            error = NSLocalizedString("MCreateItemText_minCharacters", comment:"")
        }
        else if countCharacters > kMaxTextLength
        {
            let maximumCharacters:Int = kMaxTextLength - 1
            let maxCharsString:String = "\(maximumCharacters)"
            let compositeError:String = String(format:NSLocalizedString("MCreateItemText_maxCharacters", comment:""), maxCharsString)
            error = compositeError
        }
        
        return error
    }
    
    override func clean()
    {
        text = ""
        cellText.textView.text = ""
    }
    
    //MARK: textView delegate
    
    func textViewDidBeginEditing(textView:UITextView)
    {
        controller.viewCreate.collection.scrollToItemAtIndexPath(indexPath, atScrollPosition:UICollectionViewScrollPosition.Top, animated:true)
    }
    
    func textViewDidEndEditing(textView:UITextView)
    {
        text = textView.text
    }
}