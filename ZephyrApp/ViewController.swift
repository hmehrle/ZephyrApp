//
//  ViewController.swift
//  ZephyrApp
//
//  Created by Hannah Mehrle on 11/9/16.
//  Copyright © 2016 Hannah Mehrle. All rights reserved.
//

import UIKit
import Firebase
//import FBSDKCoreKit
import FBSDKLoginKit


class ViewController: UIViewController, FBSDKLoginButtonDelegate{

    var loggedIn = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let loginButton = FBSDKLoginButton()
        print ("in view did load")
        view.addSubview(loginButton)
        loginButton.frame = CGRect(x:16, y:view.frame.height/2, width: view.frame.width-32, height:50)
        loginButton.delegate = self
        
        print("outside if before")
        if FBSDKAccessToken.current() != nil {
            print("inside if before segue")
            DispatchQueue.main.async(execute: {
                self.performSegue(withIdentifier: "loginSegue", sender: nil )
            })
            print("inside if after segue")
        }

        
        // unsure if this is correct
        //facebookButton.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //if (FBSDKAccessToken.current() != nil && loggedIn == true)
        if FBSDKAccessToken.current() != nil {
            //performSegue(withIdentifier: "loginSegue", sender: self)
        }
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("Did log out")
    }
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if error != nil {
            print(error)
            return
        }
        else {
            print("Successfully logged in")
            loggedIn = true
            DispatchQueue.main.async(execute: {
                self.performSegue(withIdentifier: "loginSegue", sender: nil )
            })
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

