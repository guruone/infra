import UIKit

class CRootList:CMainController
{
    let model:MRootPoemsList
    
    required init(model:MRootPoemsList)
    {
        self.model = model
        
        super.init(nibName:nil, bundle:nil)
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
}