import UIKit

class MConfiguration
{
    static let sharedInstance = MConfiguration()
    private(set) var fontModifier:CGFloat
    private let kBodyFontSize:CGFloat = 15
    
    private init()
    {
        fontModifier = 1
    }
    
    //MARK: private
    
    private func loadFonts()
    {
        let font:UIFont = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
        let pointSize:CGFloat = font.pointSize
        
        if pointSize > kBodyFontSize
        {
            let delta:CGFloat = pointSize / kBodyFontSize
            fontModifier = delta
        }
    }
    
    private func loadUser()
    {
        DManager.sharedInstance.managerUbik.fetchManagedObjects(, limit: <#T##Int#>, predicate: <#T##NSPredicate?#>, sorters: <#T##[NSSortDescriptor]?#>, block: <#T##([ModelType] -> ())?##([ModelType] -> ())?##[ModelType] -> ()#>)
    }
    
    //MARK: public
    
    func load()
    {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0))
        {
            self.loadFonts()
            self.loadUser()
        }
    }
}