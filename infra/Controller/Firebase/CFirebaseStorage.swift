import Foundation
import Firebase

class CFirebaseStorage
{
    private let storage:FIRStorage
    private let storageReference:FIRStorageReference
    private let kStorageReference:String = "gs://infra-3cd0d.appspot.com"
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