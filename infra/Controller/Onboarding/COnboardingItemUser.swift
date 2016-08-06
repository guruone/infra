import UIKit

class COnboardingItemUser:COnboardingItem, UITextFieldDelegate
{
    override func loadView()
    {
        view = VOnboardingItemUser(controller:self)
    }
    
    //MARK: actions
    
    func actionStart(sender button:UIButton)
    {
        
    }
    
    //MARK: field del
    
    func textFieldShouldReturn(textField:UITextField) -> Bool
    {
        textField.resignFirstResponder()
        
        return true
    }
}