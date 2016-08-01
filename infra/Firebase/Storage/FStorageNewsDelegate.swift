import UIKit

protocol FStorageNewsDelegate:class
{
    func firebaseStorageNewsLoaded(image:UIImage, text:String)
    func firebaseStorageNewsError(error:String)
}