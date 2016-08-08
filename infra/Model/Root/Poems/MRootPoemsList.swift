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
    
    //MARK: public
    
    func controller() -> CRootList
    {
        let list:CRootList = state.controllerType.init(model:self)
        
        return list
    }
}