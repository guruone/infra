import UIKit

class CRootListUploading:CRootList
{
    weak var viewUploading:VRootListUploading!
    
    override func loadView()
    {
        let viewUploading:VRootListUploading = VRootListUploading(controller:self)
        self.viewUploading = viewUploading
        view = viewUploading
    }
    
    //MARK: public
    
    func removeAll()
    {
        
    }
}