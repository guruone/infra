import Foundation
import FirebaseDatabase

class FDatabase
{
    private let reference:FIRDatabaseReference
    private let kReferenceUser:String = "user"
    
    init()
    {
        reference = FIRDatabase.database().reference()
        /*let newUser:FIRDatabaseReference = reference.child("user").childByAutoId()
        let key:String = newUser.key
        newUser.setValue(["name":"juan", "id":"1234"])
        
        print(key)*/
        
//        reference.setValue(["roman":[]])
        /*
        reference.observeEventType(FIRDataEventType.Value, withBlock:
        { (snapshot) in
            
            print(snapshot)
            
        })*/
    }
    
    //MARK: public
    
    func newUser(fUser:FDatabaseModelUser) -> String
    {
        let userJson:[String:AnyObject] = fUser.modelJson()
        let newUser:FIRDatabaseReference = reference.child(kReferenceUser).childByAutoId()
        let newUserId:String = newUser.key
        newUser.setValue(userJson)
        
        return newUserId
    }
    
    func updateUser
    
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
}