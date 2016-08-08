import Foundation
import FirebaseDatabase

class MRootPoems
{
    weak var controller:CRoot!
    
    init(controller:CRoot)
    {
        self.controller = controller
        FMain.sharedInstance.database.listenPoems(snapBlock)
    }
    
    //MARK: private
    
    private func snapBlock(snapshot:FIRDataSnapshot)
    {
        
    }
}