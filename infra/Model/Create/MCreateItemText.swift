import UIKit

class MCreateItemText:MCreateItem, UITextViewDelegate
{
    weak var controller:CCreate!
    weak var cellText:VCreateCellText!
    weak var indexPath:NSIndexPath!
    private(set) var text:String
    private let kCellHeight:CGFloat = 180
    
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