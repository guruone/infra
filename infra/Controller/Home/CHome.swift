import UIKit

class CHome:CMainController, CFirebaseStorageNewsDelegate
{
    override func loadView()
    {
        super.loadView()
        
        CFirebase.sharedInstance.storage.loadNews(self)
    }
    
    //MARK: news delegate
    
    func firebaseStorageNewsLoaded(image:UIImage, text:String)
    {
        print("done")
    }
    
    func firebaseStorageNewsError(error:String)
    {
        print("error")
    }
}