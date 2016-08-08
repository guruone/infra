import UIKit

class CRootListUploading:CRootList
{
    weak var viewUploading:VRootUploading!
    
    override func loadView()
    {
        let viewUploading:VRootUploading = VRootUploading(controller:self)
        self.viewUploading = viewUploading
        view = viewUploading
    }
}