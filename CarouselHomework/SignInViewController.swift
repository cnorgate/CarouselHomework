//
//  SignInViewController.swift
//  CarouselHomework
//
//  Created by Cameron Norgate on 9/22/15.
//  Copyright © 2015 Cameron Norgate. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //Looks for single or multiple taps - this is used to dismiss the keyboard
        //http://stackoverflow.com/questions/24126678/close-ios-keyboard-by-touching-anywhere-using-swift
        let tap = UITapGestureRecognizer(target: self, action: "DismissKeyboard")
        view.addGestureRecognizer(tap)
    }
    
    func DismissKeyboard(){
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    @IBOutlet weak var emailForm: UITextField!

    @IBOutlet weak var pwForm: UITextField!
    
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
    
    @IBAction func backToMain(sender: AnyObject) {
        navigationController!.popViewControllerAnimated(true)
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
