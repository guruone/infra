import Foundation

class MRootPoemsListItemStatus
{
    class func None() -> MRootPoemsListItemStatusNone
    {
        let status:MRootPoemsListItemStatusNone = MRootPoemsListItemStatusNone()
        
        return status
    }
    
    class func Downloading() -> MRootPoemsListItemStatusDownloading
    {
        let status:MRootPoemsListItemStatusDownloading = MRootPoemsListItemStatusDownloading()
        
        return status
    }
    
    class func Error() -> MRootPoemsListItemStatusError
    {
        let status:MRootPoemsListItemStatusError = MRootPoemsListItemStatusError()
        
        return status
    }
    
    class func Ready() -> MRootPoemsListItemStatusReady
    {
        let status:MRootPoemsListItemStatusReady = MRootPoemsListItemStatusReady()
        
        return status
    }
    
    //MARK: public
    
    func pull(completion:((error:String?) -> ()))
    {
    }
}