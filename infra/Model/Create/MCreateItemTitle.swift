import UIKit

class MCreateItemTitle:MCreateItem, UITextFieldDelegate
{
    weak var controller:CCreate!
    weak var cellTitle:VCreateCellTitle!
    weak var indexPath:NSIndexPath!
    private(set) var title:String
    private let kCellHeight:CGFloat = 74
    private let kMinTitleLength:Int = 1
    private let kMaxTitleLength:Int = 64
    
    init()
    {
        let reusableIdentifier:String = VCreateCellTitle.reusableIdentifier()
        title = ""
        super.init(reusableIdentifier:reusableIdentifier, cellHeight:kCellHeight)
    }
    
    override func config(cell:VCreateCell, controller:CCreate, indexPath:NSIndexPath)
    {
        self.controller = controller
        self.indexPath = indexPath
        cellTitle = cell as! VCreateCellTitle
        cellTitle.field.delegate = self
    }
    
    override func validate() -> String?
    {
        var error:String?
        let countCharacters:Int = title.characters.count
        
        if countCharacters < kMinTitleLength
        {
            error = NSLocalizedString("MCreateItemTitle_minCharacters", comment:"")
        }
        else if countCharacters > kMaxTitleLength
        {
            let maximumCharacters:Int = kMaxTitleLength - 1
            let maxCharsString:String = "\(maximumCharacters)"
            let compositeError:String = String(format:NSLocalizedString("MCreateItemTitle_maxCharacters", comment:""), maxCharsString)
            error = compositeError
        }
        
        return error
    }
    
    //MARK: field delegate
    
    func textFieldDidBeginEditing(textField:UITextField)
    {
        controller.viewCreate.collection.scrollToItemAtIndexPath(indexPath, atScrollPosition:UICollectionViewScrollPosition.Top, animated:true)
    }
    
    func textFieldDidEndEditing(textField:UITextField)
    {
        title = textField.text!
    }
    
    func textFieldShouldReturn(textField:UITextField) -> Bool
    {
        textField.resignFirstResponder()
        
        return true
    }
}