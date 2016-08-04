import UIKit

class CCreate:CMainController
{
    weak var viewCreate:VCreate!
    
    override func loadView()
    {
        let viewCreate:VCreate = VCreate(controller:self)
        self.viewCreate = viewCreate
        view = viewCreate
    }
}