import Foundation
import FirebaseDatabase

class MRootPoems
{
    weak var controller:CRoot!
    let lists:[MRootPoemsList]
    
    init(controller:CRoot)
    {
        self.controller = controller
        
        let stateUploading:MRootPoemsStateUploading = MRootPoemsState.Uploading()
        let stateReview:MRootPoemsStateReview = MRootPoemsState.Review()
        let stateNeedsRevision:MRootPoemsStateNeedsRevision = MRootPoemsState.NeedsRevision()
        let stateRejected:MRootPoemsStateRejected = MRootPoemsState.Rejected()
        let stateReady:MRootPoemsStateReady = MRootPoemsState.Ready()
        
        let listUploading:MRootPoemsList = MRootPoemsList(state:stateUploading)
        let listReview:MRootPoemsList = MRootPoemsList(state:stateReview)
        let listNeedsRevision:MRootPoemsList = MRootPoemsList(state:stateNeedsRevision)
        let listRejected:MRootPoemsList = MRootPoemsList(state:stateRejected)
        let listReady:MRootPoemsList = MRootPoemsList(state:stateReady)
        
        lists = [
            listUploading,
            listReview,
            listNeedsRevision,
            listRejected,
            listReady
        ]
        
        FMain.sharedInstance.database.listenPoems(snapBlock)
    }
    
    //MARK: private
    
    private func snapBlock(snapshot:FIRDataSnapshot)
    {
        let json:[String:AnyObject]? = snapshot.value as? [String:AnyObject]
        
        print(json)
    }
}