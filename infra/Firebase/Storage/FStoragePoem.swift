import Foundation
import Firebase

class FStoragePoem
{
    private let kReferenceRoot:String = "poems"
    
    init()
    {
    }
    
    //MARK: public
    
    func save(poemId:String, poem:NSURL, storage:FIRStorageReference, completionHandler:((String?)->())?)
    {
        let rootReference:FIRStorageReference = storage.child(kReferenceRoot)
        let poemReference:FIRStorageReference = rootReference.child(poemId)
        poemReference.putFile(poem, metadata:nil)
        { (metadata, error) in
            
            let errorString:String?
            
            if error == nil
            {
                errorString = nil
            }
            else
            {
                errorString = NSLocalizedString("FStoragePoem_errorSaving", comment:"")
            }
            
            completionHandler?(errorString)
        }
    }
    
    func delete(poemId:String, storage:FIRStorageReference, completionHandler:((String?)->())?)
    {
        let rootReference:FIRStorageReference = storage.child(kReferenceRoot)
        let poemReference:FIRStorageReference = rootReference.child(poemId)
        poemReference.deleteWithCompletion
        { (error) in
            
            let errorString:String? = error!.localizedDescription
            completionHandler?(errorString)
        }
    }
}