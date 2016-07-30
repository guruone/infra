import Foundation
import Firebase

class CFirebaseStorage
{
    private let storage:FIRStorage
    private let storageReference:FIRStorageReference
    private let kStorageReference_News:String = "news"
    
    init()
    {
        storage = FIRStorage.storage()
        storageReference = storage.reference()
    }
    
    //MARK: public
    
    func loadNews
    
    func news() -> FIRStorageReference
    {
        let reference:FIRStorageReference = storageReference.child(kStorageReference_News)
        
        return reference
    }
}