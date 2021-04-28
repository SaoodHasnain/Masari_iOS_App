//
//  SplashViewController.swift
//  Masari
//
//  Created by Hamza Shahbaz on 30/03/2021.
//

import UIKit

class SplashViewController: UIViewController {

    @IBOutlet weak var logoImgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        logoImgView.transform =
        CGAffineTransform.identity.scaledBy(x: 0.001, y: 0.001)
//        logoTxtImg.alpha = 0.0
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
            self.popAnimationLogo()
        })
        
    }
    
    func popAnimationLogo()
    {
        logoImgView.transform = logoImgView.transform.scaledBy(x: 0.001, y: 0.001)

        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.3, options: .curveEaseInOut, animations: {
            self.logoImgView.transform = CGAffineTransform.identity.scaledBy(x: 1.0, y: 1.0)
          }, completion: { (finish) in
            self.logoImgView.rotate()
            DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
                self.moveToNextViewController()
            })
        })
    }
    
    func showAnimationForLogoText()
    {
        UIView.animate(withDuration: 20.0, delay: 0.3, options: .curveEaseIn, animations: {
//            self.logoTxtImg.alpha = 1.0
        }, completion: { (finish) in
        })
    }

    func moveToNextViewController()
    {
        let controller: LoginViewController = LoginViewController.initiateFrom(Storybaord: .Auth)
        self.pushController(contorller: controller, animated: true)
    }
}
