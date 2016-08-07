import Foundation

class MCreate
{
    let items:[MCreateItem]
    weak var itemTitle:MCreateItemTitle!
    weak var itemText:MCreateItemText!
    private let kPoemFileName:String = "new.poem"
    
    init()
    {
        let itemTitle:MCreateItemTitle = MCreateItem.Title()
        let itemText:MCreateItemText = MCreateItem.Text()
        let itemPublish:MCreateItemPublish = MCreateItem.Publish()
        self.itemTitle = itemTitle
        self.itemText = itemText
        
        items = [
            itemTitle,
            itemText,
            itemPublish
        ]
    }
    
    //MARK: public
    
    func validate() -> String?
    {
        var error:String?
        
        for item:MCreateItem in items
        {
            error = item.validate()
            
            if error != nil
            {
                break
            }
        }
        
        return error
    }
    
    func poemFile() -> NSURL?
    {
        let poemText:String = itemText.text
        var poemUrl:NSURL? = NSURL(fileURLWithPath:NSTemporaryDirectory()).URLByAppendingPathComponent(kPoemFileName)
        
        do
        {
            try poemText.writeToURL(poemUrl!, atomically:true, encoding:NSUTF8StringEncoding)
        }
        catch
        {
            poemUrl = nil
        }
        
        return poemUrl
    }
}