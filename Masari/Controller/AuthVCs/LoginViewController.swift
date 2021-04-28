//
//  LoginViewController.swift
//  Masari
//
//  Created by Hamza Shahbaz on 30/03/2021.
//

import UIKit

class LoginViewController: UIViewController {

    
    //MARK:- Properties
    
    
    //MARK:- Controller LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //MARK:- Supporting Functions
    
    
    
    //MARK:- Actions
    
    
    @IBAction func btnForgotPasswordTapped(_ sender: Any){
        let controller: ForgotViewController = ForgotViewController.initiateFrom(Storybaord: .Auth)
        self.pushController(contorller: controller, animated: true)
    }
    
    @IBAction func btnLoginTapped(_ sender: Any){
        let controller: HomeViewController = HomeViewController.initiateFrom(Storybaord: .Main)
        self.pushController(contorller: controller, animated: true)
    }
    @IBAction func btnDontHaveAnAccountTapped(_ sender: Any){
        let controller: SignupViewController = SignupViewController.initiateFrom(Storybaord: .Auth)
        self.pushController(contorller: controller, animated: true)
    }
    @IBAction func btnFacebookTapped(_ sender: Any){
        
    }
    @IBAction func btnGoogleTapped(_ sender: Any){
        
    }

}
