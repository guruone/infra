import Foundation
import Firebase

class CFirebaseStorage
{
    private let storage:FIRStorage
    private let storageReference:FIRStorageReference
    private var storageNews:CFirebaseStorageNews?
    
    init()
    {
        storage = FIRStorage.storage()
        storageReference = storage.reference()
    }
    
    //MARK: public
    
    func loadNews(delegate:CFirebaseStorageNewsDelegate?)
    {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0))
        { [weak delegate] in
            
            self.storageNews = CFirebaseStorageNews(storage:self.storageReference, delegate:delegate)
        }
    }
}