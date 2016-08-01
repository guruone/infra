import Foundation
import FirebaseDatabase

class CFirebaseDatabase
{
    private let reference:FIRDatabaseReference
    
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
}