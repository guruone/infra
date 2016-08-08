import Foundation

class MRootPoemsState
{
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
}