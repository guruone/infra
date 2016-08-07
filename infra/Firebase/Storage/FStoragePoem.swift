import Foundation
import Firebase

class FStoragePoem
{
    private let kReferenceRoot:String = "poems"
    
    init()
    {
    }
    
    //MARK: public
    
    func save(poemId:String, poem:NSURL, storage:FIRStorageReference, delegate:FStoragePoemDelegate?)
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
                print(error!.localizedDescription)
                delegate?.fStoragePoemError(error!.localizedDescription)
            }
        }
    }
}