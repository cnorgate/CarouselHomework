//
//  SignInViewController.swift
//  CarouselHomework
//
//  Created by Cameron Norgate on 9/22/15.
//  Copyright © 2015 Cameron Norgate. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    var signInOriginalPosition : CGFloat!
    var emailPassOriginalPosition :CGFloat!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var emailForm: UITextField!
    
    @IBOutlet weak var pwForm: UITextField!
    
    
    @IBOutlet weak var signInButton: UIButton!
    
    @IBOutlet weak var signInGroup: UIView!

    @IBOutlet weak var carouselText: UIImageView!
    
    @IBOutlet weak var emailPassGroup: UIView!
    
    @IBOutlet weak var signInNavBar: UIImageView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //Looks for single or multiple taps - this is used to dismiss the keyboard
        //http://stackoverflow.com/questions/24126678/close-ios-keyboard-by-touching-anywhere-using-swift
        let tap = UITapGestureRecognizer(target: self, action: "DismissKeyboard")
        view.addGestureRecognizer(tap)
        
        // Code to register the keyboard being shown or hidden
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
        //Code to get the original y position of the buttons
        signInOriginalPosition = signInGroup.center.y
        emailPassOriginalPosition = emailPassGroup.center.y
        
        
    }
    

    
    func keyboardWillShow(notification: NSNotification!) {

        // GIST CODE
        var userInfo = notification.userInfo!
        
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue().size
        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSNumber
        var animationDuration = durationValue.doubleValue
        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as! NSNumber
        var animationCurve = curveValue.integerValue
        
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions(rawValue: UInt(animationCurve << 16)), animations: {
            
            // Set view properties in here that you want to match with the animation of the keyboard
            // If you need it, you can use the kbSize property above to get the keyboard width and height.
            }, completion: nil)
        
        
        
        carouselText.alpha = 0
        signInGroup.center.y = view.frame.height - kbSize.height - signInGroup.frame.height + 20
        emailPassGroup.center.y = 120
    }
    
    func keyboardWillHide(notification: NSNotification!) {

        //GIST CODE
        var userInfo = notification.userInfo!
        
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue().size
        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSNumber
        var animationDuration = durationValue.doubleValue
        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as! NSNumber
        var animationCurve = curveValue.integerValue
        
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions(rawValue: UInt(animationCurve << 16)), animations: {
            
            // Set view properties in here that you want to match with the animation of the keyboard
            // If you need it, you can use the kbSize property above to get the keyboard width and height.
            }, completion: nil)
        
        
        
        
        signInGroup.center.y = signInOriginalPosition
        emailPassGroup.center.y = emailPassOriginalPosition
        carouselText.alpha = 1
    }
    
    func DismissKeyboard(){
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    

    
    @IBAction func signInClick(sender: AnyObject) {

        if (self.emailForm.text!.isEmpty) || (self.pwForm.text!.isEmpty){
//            print("empty")
            
            let alertController = UIAlertController(title: "Empty Fields", message: "You need to provide an email and password", preferredStyle: .Alert)
            
            // create an OK action
            let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
                // handle response here.
            }
            // add the OK action to the alert controller
            alertController.addAction(OKAction)
            
            presentViewController(alertController, animated: true) {
                // optional code for what happens after the alert controller has finished presenting
            }
        } else if (self.emailForm.text == "c@") && (self.pwForm.text == "pass") {
            self.activityIndicator.startAnimating()
            delay(2) {
                //print("success")
                self.activityIndicator.stopAnimating()
                self.performSegueWithIdentifier("signInSegue", sender: self )
            }
        } else {
            self.activityIndicator.startAnimating()
            delay(2) {
                //print("fail")
                self.activityIndicator.stopAnimating()
                
                let alertController = UIAlertController(title: "Access Denied", message: "Your email and password do not match. Please try again!", preferredStyle: .Alert)
                
                // create an OK action
                let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
                    // handle response here.
                }
                // add the OK action to the alert controller
                alertController.addAction(OKAction)
                
                self.presentViewController(alertController, animated: true) {
                    // optional code for what happens after the alert controller has finished presenting
                }
            }
        }
    }
    
    
    @IBAction func backToMain(sender: AnyObject) {        navigationController!.popViewControllerAnimated(true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
