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
    
    //MARK: public
    
    func load()
    {
        loadFonts()
    }
}