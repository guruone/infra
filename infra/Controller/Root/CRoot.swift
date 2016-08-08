import UIKit

class CRoot:CMainController
{
    weak var viewRoot:VRoot!
    private(set) var model:MRootPoems!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        model = MRootPoems()
    }
    
    override func loadView()
    {
        let viewRoot:VRoot = VRoot(controller:self)
        self.viewRoot = viewRoot
        view = viewRoot
    }
}