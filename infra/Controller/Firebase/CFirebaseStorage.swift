import Foundation
import Firebase

class CFirebaseStorage
{
    private let storage:FIRStorage
    let storageReference:FIRStorageReference
    private let kStorageReference_News:String = "news"
    
    init()
    {
        storage = FIRStorage.storage()
        storageReference = storage.reference()
    }
    
    //MARK: public
    
    func news() -> FIRStorageReference
    {
        let reference:FIRStorageReference = storageReference.child(kStorageReference_News)
        
        return reference
    }
}