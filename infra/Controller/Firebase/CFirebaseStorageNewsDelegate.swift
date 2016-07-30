import Foundation

protocol CFirebaseStorageNewsDelegate:class
{
    func firebaseStorageNewsLoaded();
    func firebaseStorageNewsError(error:String);
}