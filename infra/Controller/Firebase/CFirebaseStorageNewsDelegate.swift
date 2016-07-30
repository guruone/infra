import UIKit

protocol CFirebaseStorageNewsDelegate:class
{
    func firebaseStorageNewsLoaded(image:UIImage, text:String)
    func firebaseStorageNewsError(error:String)
}