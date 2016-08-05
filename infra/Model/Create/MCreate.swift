import Foundation

class MCreate
{
    let items:[MCreateItem]
    
    init()
    {
        let itemTitle:MCreateItem = MCreateItem.Title()
        let itemText:MCreateItem = MCreateItem.Text()
        let itemPublish:MCreateItem = MCreateItem.Publish()
        
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
}