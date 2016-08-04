import Foundation

class MCreate
{
    let items:[MCreateItem]
    
    init()
    {
        let itemTitle:MCreateItem = MCreateItem.Title()
        let itemText:MCreateItem = MCreateItem.Text()
        let itemPicture:MCreateItem = MCreateItem.Picture()
        let itemAck:MCreateItem = MCreateItem.Ack()
        let itemPublish:MCreateItem = MCreateItem.Publish()
        
        items = [
            itemTitle,
            itemText,
            itemPicture,
            itemAck,
            itemPublish
        ]
    }
}