import UIKit

protocol FStorageNewsDelegate:class
{
    func fStorageNewsLoaded(image:UIImage, text:String)
    func fStorageNewsError(error:String)
}