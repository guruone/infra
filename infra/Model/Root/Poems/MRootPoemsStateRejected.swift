import Foundation

class MRootPoemsStateRejected:MRootPoemsState
{
    init()
    {
        let state:DInfraPoem.DInfraPoemStatus = DInfraPoem.DInfraPoemStatus.Rejected
        super.init(state:state)
    }
}