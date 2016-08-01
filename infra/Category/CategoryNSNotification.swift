import Foundation

extension NSNotification
{
    class func observeConfigurated(receiver:AnyObject, sel:Selector)
    {
        NSNotificationCenter.defaultCenter().addObserver(receiver, selector:sel, name:configuratedName(), object:nil)
    }
    
    class func postConfigurated()
    {
        NSNotificationCenter.defaultCenter().postNotificationName(configuratedName(), object:nil)
    }
    
    //MARK: private
    
    private class func configuratedName() -> String
    {
        return "configurated"
    }
}