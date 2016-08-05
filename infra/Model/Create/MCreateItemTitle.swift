import UIKit

class MCreateItemTitle:MCreateItem, UITextFieldDelegate
{
    weak var controller:CCreate!
    weak var cellTitle:VCreateCellTitle!
    weak var indexPath:NSIndexPath!
    private(set) var title:String
    private let kCellHeight:CGFloat = 74
    
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