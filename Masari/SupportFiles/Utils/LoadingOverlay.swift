//
//  LoadingOverlay.swift
//  Akoya
//
//  Created by Wahab on 01/09/2020.
//  Copyright © 2020 Fast Net. All rights reserved.
//

import UIKit

public class LoadingOverlay{
    
    var overlayView : UIView!
    var logoIndicator : UIImageView!
    var backgroundView:UIView!
    
    class var shared: LoadingOverlay {
        struct Static {
            static let instance: LoadingOverlay = LoadingOverlay()
        }
        return Static.instance
    }
    
    init(){
        self.overlayView = UIView()
        self.logoIndicator = UIImageView()
        self.backgroundView = UIView()
        
        
        
    }
    
    public func showOverlay()
    {
        if  let appDelegate = UIApplication.shared.delegate as? AppDelegate,
            let window = appDelegate.window {
            self.backgroundView.frame = CGRect(x: 0, y: 0, width: UtilityManager().screenWidth, height: UtilityManager().screenHeight)
            self.backgroundView.backgroundColor = .black
            self.backgroundView.alpha = 0.2
            window.addSubview(self.backgroundView)
            overlayView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
            overlayView.center = CGPoint(x: window.frame.width / 2.0, y: window.frame.height / 2.0)
            overlayView.backgroundColor = .clear
            overlayView.clipsToBounds = true
            overlayView.layer.cornerRadius = 10
            
            self.logoIndicator = UIImageView(frame: CGRect(x: 10, y: 10, width: 80, height: 80))
            self.logoIndicator.image = UIImage(named: "logo-ic")
            self.logoIndicator.rotateFast()
            self.logoIndicator.center = CGPoint(x: overlayView.bounds.width / 2, y: overlayView.bounds.height / 2)
            
            overlayView.addSubview(self.logoIndicator)
            window.addSubview(overlayView)
            
        }
    }
    
    public func hideOverlayView() {
        backgroundView.removeFromSuperview()
        overlayView.removeFromSuperview()
    }
}
