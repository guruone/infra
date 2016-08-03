import Foundation

class MMainNavItemCreate:MMainNavItem
{
    private let kImage:String = "navigationCreate"
    
    init(index:Int)
    {
        super.init(image:kImage, index:index)
    }
}