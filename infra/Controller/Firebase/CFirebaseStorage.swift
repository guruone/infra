import Foundation
import Firebase

class CFirebaseStorage
{
    private let storage:FIRStorage
    private let storageReference:FIRStorageReference
    
    init()
    {
        storage = FIRStorage.storage()
        storageReference = storage.reference()
    }
    
    //MARK: public
    
    func loadNews(delegate:CFirebaseStorageNews?)
    {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0))
        { [weak delegate] in
            
            
        }
    }
    
    func news() -> FIRStorageReference
    {
        let reference:FIRStorageReference = storageReference.child(kStorageReference_News)
        
        return reference
    }
}