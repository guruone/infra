import Foundation
import CoreData

class DManagerModelUbik:DManagerModel
{
    private let kModelName:String = "DInfraModel"
    
    init()
    {
        super.init(modelName:kModelName)
    }
}