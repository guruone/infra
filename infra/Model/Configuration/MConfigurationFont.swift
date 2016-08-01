import UIKit

class MConfigurationFont
{
    private(set) var fontModifier:CGFloat
    private let kBodyFontSize:CGFloat = 15
    
    init()
    {
        fontModifier = 1
    }
    
    //MARK: public
    
    func loadFonts()
    {
        let font:UIFont = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
        let pointSize:CGFloat = font.pointSize
        
        if pointSize > kBodyFontSize
        {
            let delta:CGFloat = pointSize / kBodyFontSize
            fontModifier = delta
        }
    }
}