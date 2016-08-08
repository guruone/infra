import Foundation

class MRootPoemsStateNeedsRevision:MRootPoemsState
{
    private let kTitle:String = "Needs Revision"
    
    init()
    {
        let state:DInfraPoem.DInfraPoemStatus = DInfraPoem.DInfraPoemStatus.NeedsRevision
        super.init(state:state, title:kTitle)
    }
}