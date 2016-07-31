import UIKit

class CHome:CMainController, CFirebaseStorageNewsDelegate
{
    weak var viewHome:VHome!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        CFirebase.sharedInstance.storage.loadNews(self)
    }
    
    override func loadView()
    {
        let viewHome:VHome = VHome(controller:self)
        self.viewHome = viewHome
        view = viewHome
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