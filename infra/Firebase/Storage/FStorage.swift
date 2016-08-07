import Foundation
import Firebase

class FStorage
{
    private let storage:FIRStorage
    private let storageReference:FIRStorageReference
    weak private var storageNews:FStorageNews?
    
    init()
    {
        storage = FIRStorage.storage()
        storageReference = storage.reference()
    }
    
    //MARK: public
    
    func loadNews(delegate:FStorageNewsDelegate?)
    {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0))
        { [weak delegate] in
            
            self.storageNews = FStorageNews(storage:self.storageReference, delegate:delegate)
        }
    }
    
    func savePoem(poemId:String, poem:NSURL, delegate:FStoragePoemDelegate?)
    {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0))
        { [weak delegate] in
            
            let fPoem:FStoragePoem = FStoragePoem()
            fPoem.save(poemId, poem:poem, storage:self.storageReference, delegate:delegate)
        }
    }
}