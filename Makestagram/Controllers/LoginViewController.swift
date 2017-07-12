//
//  LoginViewController.swift
//  Makestagram
//
//  Created by Alikeju Adejo on 7/11/17.
//  Copyright © 2017 Alikeju Adejo. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseAuthUI
import FirebaseDatabase

typealias FIRUser = FirebaseAuth.User

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var loginButton: UIButton!
    
   
    @IBAction func loginButtonTapped(_ sender: Any) {
        
        
        print("Login Button Tapped")
        
        //access the FUIAuth default auth UI singleton
        guard let authUI = FUIAuth.defaultAuthUI()
            else { return }
        
        //set FUIAuth's singleton delegate
        authUI.delegate = self
        
        //let authViewController = authUI.authViewController()
        let authViewController = authUI.authViewController()
        present(authViewController, animated: true)
    }
   

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension LoginViewController: FUIAuthDelegate {
    func authUI(_ authUI: FUIAuth, didSignInWith user: FIRUser?, error: Error?) {
        if let error = error {
            assertionFailure("Error signing in: \(error.localizedDescription)")
            return
        }
        
   
        guard let user = user
            else { return }
        
    
        let userRef = Database.database().reference().child("users").child(user.uid)
        
        userRef.observeSingleEvent(of: .value, with: { (snapshot) in
            // 4 retrieve user data from snapshot
            
//            if let userDict = snapshot.value as? [String : Any] {
//                print("User already exists \(userDict.debugDescription).")
//            } else {
//                print("New user!")
//            }
            
            if let user = User(snapshot: snapshot) {
                print("Welcome back, \(user.username).")
            } else {
                self.performSegue(withIdentifier: "toCreateUsername", sender: self)
            }
        })
    }
}
