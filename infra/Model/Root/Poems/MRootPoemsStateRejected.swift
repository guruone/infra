import Foundation

class MRootPoemsStateRejected:MRootPoemsState
{
    private let kTitle:String = "Rejected"
    
    init()
    {
        let state:DInfraPoem.DInfraPoemStatus = DInfraPoem.DInfraPoemStatus.Rejected
        super.init(state:state, title:kTitle)
    }
}