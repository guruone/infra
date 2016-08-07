import Foundation
import FirebaseDatabase

class FDatabase
{
    private let reference:FIRDatabaseReference
    private let kReferenceUser:String = "user"
    private let kReferencePoem:String = "poem"
    
    init()
    {
        reference = FIRDatabase.database().reference()
    }
    
    //MARK: public
    //MARK: user
    
    func newUser(fUser:FDatabaseModel) -> String
    {
        let userJson:[String:AnyObject] = fUser.modelJson()
        let newUser:FIRDatabaseReference = reference.child(kReferenceUser).childByAutoId()
        let newUserId:String = newUser.key
        newUser.setValue(userJson)
        
        return newUserId
    }
    
    func updateUser(userId:String, property:[String:AnyObject])
    {
        let userReference = reference.child(kReferenceUser).child(userId)
        userReference.updateChildValues(property)
    }
    
    func listenUser(userId:String, snapBlock:((FIRDataSnapshot) -> Void)) -> UInt
    {
        let userReference:FIRDatabaseReference = reference.child(kReferenceUser).child(userId)
        let handler:UInt = userReference.observeEventType(FIRDataEventType.Value, withBlock:snapBlock)
        
        return handler
    }
    
    func stopListener(userId:String, handler:UInt)
    {
        let userReference:FIRDatabaseReference = reference.child(kReferenceUser).child(userId)
        userReference.removeObserverWithHandle(handler)
    }
    
    //MARK: poem
    
    func newPoem(fPoem:FDatabaseModel) -> String
    {
        let userJson:[String:AnyObject] = fPoem.modelJson()
        let newPoem:FIRDatabaseReference = reference.child(kReferencePoem).childByAutoId()
        let newUserId:String = newUser.key
        newUser.setValue(userJson)
        
        return newUserId
    }
}