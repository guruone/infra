import Foundation

class MRootPoemsState
{
    let state:DInfraPoem.DInfraPoemStatus
    
    class func Uploading() -> MRootPoemsStateUploading
    {
        let state:MRootPoemsStateUploading = MRootPoemsStateUploading()
        
        return state
    }
    
    class func Review() -> MRootPoemsStateReview
    {
        let state:MRootPoemsStateReview = MRootPoemsStateReview()
        
        return state
    }
    
    class func NeedsRevision() -> MRootPoemsStateNeedsRevision
    {
        let state:MRootPoemsStateNeedsRevision = MRootPoemsStateNeedsRevision()
        
        return state
    }
    
    class func Rejected() -> MRootPoemsStateRejected
    {
        let state:MRootPoemsStateRejected = MRootPoemsStateRejected()
        
        return state
    }
    
    class func Ready() -> MRootPoemsStateReady
    {
        let state:MRootPoemsStateReady = MRootPoemsStateReady()
        
        return state
    }
    
    init(state:DInfraPoem.DInfraPoemStatus)
    {
        self.state = state
    }
}