import Foundation

class MRootPoemsListItemAction
{
    class func Accept() -> MRootPoemsListItemActionAccept
    {
        let action:MRootPoemsListItemActionAccept = MRootPoemsListItemActionAccept()
        
        return action
    }
    
    class func Reject() -> MRootPoemsListItemActionReject
    {
        let action:MRootPoemsListItemActionReject = MRootPoemsListItemActionReject()
        
        return action
    }
    
    class func Revision() -> MRootPoemsListItemActionRevision
    {
        let action:MRootPoemsListItemActionRevision = MRootPoemsListItemActionRevision()
        
        return action
    }
}