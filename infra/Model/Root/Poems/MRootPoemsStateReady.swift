import Foundation

class MRootPoemsStateReady:MRootPoemsState
{
    init()
    {
        let state:DInfraPoem.DInfraPoemStatus = DInfraPoem.DInfraPoemStatus.Ready
        super.init(state:state)
    }
}