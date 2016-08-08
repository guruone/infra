import Foundation
import FirebaseDatabase

class MRootPoems
{
    init()
    {
        FMain.sharedInstance.database.listenPoems(snapBlock)
    }
    
    //MARK: private
    
    private func snapBlock(snapshot:FIRDataSnapshot)
    {
        
    }
}