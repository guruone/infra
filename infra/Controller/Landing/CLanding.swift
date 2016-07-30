import UIKit

class CLanding:CMainController
{
    weak var viewLanding:VLanding!
    
    override func loadView()
    {
        let viewLanding:VLanding = VLanding(controller:self)
        self.viewLanding = viewLanding
        view = viewLanding
        
        CFirebase.sharedInstance.storage.news().metadataWithCompletion
        { (metadata, error) in
            
            if error != nil
            {
                print("error \(error!.localizedDescription)")
            }
            else
            {
                let urls:[NSURL]? = metadata?.downloadURLs
                
                if urls != nil
                {
                    for url in urls!
                    {
                        print(url)
                    }
                }
            }
        }
    }
}