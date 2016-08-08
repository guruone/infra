import Foundation

class MRootPoemsStateReady:MRootPoemsState
{
    private let kTitle:String = "Ready"
    
    init()
    {
        let state:DInfraPoem.DInfraPoemStatus = DInfraPoem.DInfraPoemStatus.Ready
        super.init(state:state, title:kTitle)
    }
}