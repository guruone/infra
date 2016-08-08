import Foundation

class MRootPoemsStateUploading:MRootPoemsState
{
    private let kTitle:String = "Uploading"
    
    init()
    {
        let state:DInfraPoem.DInfraPoemStatus = DInfraPoem.DInfraPoemStatus.Uploading
        super.init(state:state, title:kTitle)
    }
    
    override func controller() -> UIViewController
    {
        
    }
}