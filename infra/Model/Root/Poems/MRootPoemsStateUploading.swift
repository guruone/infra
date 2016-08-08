import Foundation

class MRootPoemsStateUploading:MRootPoemsState
{
    init()
    {
        let state:DInfraPoem.DInfraPoemStatus = DInfraPoem.DInfraPoemStatus.Uploading
        super.init(state:state)
    }
}