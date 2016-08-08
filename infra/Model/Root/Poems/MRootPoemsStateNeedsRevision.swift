import Foundation

class MRootPoemsStateNeedsRevision:MRootPoemsState
{
    init()
    {
        let state:DInfraPoem.DInfraPoemStatus = DInfraPoem.DInfraPoemStatus.NeedsRevision
        super.init(state:state)
    }
}