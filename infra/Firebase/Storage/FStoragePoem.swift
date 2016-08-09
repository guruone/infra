import Foundation
import Firebase

class FStoragePoem
{
    private let kReferenceRoot:String = "poems"
    
    init()
    {
    }
    
    //MARK: public
    
    func save(poemId:String, poem:NSData, storage:FIRStorageReference, completionHandler:((error:String?) -> ())?)
    {
        let rootReference:FIRStorageReference = storage.child(kReferenceRoot)
        let poemReference:FIRStorageReference = rootReference.child(poemId)
        poemReference.putData(poem, metadata:nil)
        { (metadata, error) in
            
            let errorString:String?
            
            if error == nil
            {
                errorString = nil
            }
            else
            {
                print(error!)
                
                errorString = NSLocalizedString("FStoragePoem_errorSaving", comment:"")
            }
            
            completionHandler?(error:errorString)
        }
    }
    
    func delete(poemId:String, storage:FIRStorageReference, completionHandler:((error:String?) -> ())?)
    {
        let rootReference:FIRStorageReference = storage.child(kReferenceRoot)
        let poemReference:FIRStorageReference = rootReference.child(poemId)
        poemReference.deleteWithCompletion
        { (error) in
            
            let errorString:String? = error?.localizedDescription
            completionHandler?(error:errorString)
        }
    }
}