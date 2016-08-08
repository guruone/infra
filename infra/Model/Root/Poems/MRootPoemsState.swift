import Foundation

class MRootPoemsState
{
    let state:DInfraPoem.DInfraPoemStatus
    private let comparator:Int
    
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
        comparator = Int(state.rawValue)
    }
    
    //MARK: public
    
    func equalsState(rawState:Int) -> Bool
    {
        let isEqual:Bool
        
        if rawState == comparator
        {
            isEqual = true
        }
        else
        {
            isEqual = false
        }
        
        return isEqual
    }
}