import Foundation

protocol FStoragePoemDelegate:class
{
    func fStoragePoemSaved()
    func fStoragePoemError(error:String)
}