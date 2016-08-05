import UIKit

class MCreateItemTitle:MCreateItem, UITextFieldDelegate
{
    private(set) var title:String
    private let kCellHeight:CGFloat = 65
    
    init()
    {
        let reusableIdentifier:String = VCreateCellTitle.reusableIdentifier()
        title = ""
        super.init(reusableIdentifier:reusableIdentifier, cellHeight:kCellHeight)
    }
    
    override func config(cell:VCreateCell)
    {
        let cellTitle:VCreateCellTitle = cell as! VCreateCellTitle
        cellTitle.field.delegate = self
    }
    
    //MARK: field delegate
    
    func textFieldShouldReturn(textField:UITextField) -> Bool
    {
        textField.resignFirstResponder()
        
        return true
    }
}