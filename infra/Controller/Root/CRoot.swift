import UIKit

class CRoot:CMainController
{
    weak var viewRoot:VRoot!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    override func loadView()
    {
        let viewRoot:VRoot = VRoot(controller:self)
        self.viewRoot = viewRoot
        view = viewRoot
    }
}