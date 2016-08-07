import Foundation
import Firebase

class FStoragePoem
{
    private let kReferenceRoot:String = "poems"
    
    init(poemId:String, poem:NSURL, storage:FIRStorageReference, delegate:FStoragePoemDelegate?)
    {
        let rootReference:FIRStorageReference = storage.child(kReferenceRoot)
        let poemReference:FIRStorageReference = rootReference.child(poemId)
        poemReference.putFile(poem, metadata:nil)
        { (metadata, error) in
            
            if error == nil
            {
                print(metadata!.downloadURL())
                delegate?.fStoragePoemSaved()
            }
            else
            {
                delegate?.fStoragePoemError(error!.localizedDescription)
            }
        }
    }
}