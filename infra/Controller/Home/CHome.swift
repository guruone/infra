import UIKit

class CHome:CMainController, FStorageNewsDelegate
{
    weak var viewHome:VHome!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        FMain.sharedInstance.storage.loadNews(self)
    }
    
    override func loadView()
    {
        let viewHome:VHome = VHome(controller:self)
        self.viewHome = viewHome
        view = viewHome
    }
    
    //MARK: news delegate
    
    func fStorageNewsLoaded(image:UIImage, text:String)
    {
        print("done")
    }
    
    func fStorageNewsError(error:String)
    {
        print("error")
    }
}