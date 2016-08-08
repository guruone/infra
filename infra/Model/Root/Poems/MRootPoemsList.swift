import Foundation

class MRootPoemsList
{
    let state:MRootPoemsState
    var items:[MRootPoemsListItem]
    
    init(state:MRootPoemsState)
    {
        self.state = state
        items = []
    }
}