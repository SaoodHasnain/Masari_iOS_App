//
//  SignupViewController.swift
//  Masari
//
//  Created by Hamza Shahbaz on 30/03/2021.
//

import UIKit

class SignupViewController: UIViewController {

    //MARK:- Properties
    
    
    
    //MARK:- controller Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    //MARK:- Supporting Functions
    
    
    
    //MARK:- Actions
    
    @IBAction func btnBackTapped(_ sender:Any){
        self.popViewController()
    }
    @IBAction func btnAlredyHaveAnAccountTapped(_ sender: Any){
        self.popViewController()
    }

}
