import Foundation
import Firebase

class CFirebase
{
    static let sharedInstance = CFirebase()
    let storage:CFirebaseStorage
    let analytics:CFirebaseAnalytics
    let database:CFirebaseDatabase
    
    private init()
    {
        FIRApp.configure()
        FIRConfiguration.sharedInstance().logLevel = FIRLogLevel.Error
        storage = CFirebaseStorage()
        analytics = CFirebaseAnalytics()
        database = CFirebaseDatabase()
    }
}