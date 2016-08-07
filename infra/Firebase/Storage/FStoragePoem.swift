import Foundation
import Firebase

class FStoragePoem
{
    private weak var delegate:FStoragePoemDelegate?
    private let kReferenceRoot:String = "poems"
    
    init(poemId:String, poem:NSURL, storage:FIRStorageReference, delegate:FStoragePoemDelegate?)
    {
        self.delegate = delegate
        let rootReference:FIRStorageReference = storage.child(kReferenceRoot)
        let poemReference:FIRStorageReference = rootReference.child(poemId)
        poemReference.putFile(poem, metadata:nil)
        { (metadata, error) in
            
        }
    }
}