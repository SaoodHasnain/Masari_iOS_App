//
//  LiveMatchDetailViewController.swift
//  Masari
//
//  Created by Hamza Shahbaz on 28/04/2021.
//

import UIKit
import SDWebImage

class LiveMatchDetailViewController: UIViewController {
    
    //MARK:- Properties
    
    @IBOutlet weak var team1ImgView: UIImageView!
    @IBOutlet weak var team2ImgView: UIImageView!
    @IBOutlet weak var LblTeam1: UILabel!
    @IBOutlet weak var LblTeam2: UILabel!
    @IBOutlet weak var lblEvent: UILabel!
    @IBOutlet weak var lblRemainingTime: UILabel!
    @IBOutlet weak var btnBetNow: UIButton!
    @IBOutlet weak var betNowView: UIView!
    @IBOutlet weak var betNowHeight: NSLayoutConstraint!
    @IBOutlet weak var lblScore: UILabel!
    
    var selectedMatch: Response?
    
    
    //MARK:- Controller Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setMatchDetail()
    }
    
    //MARK:- Supporting Functions
    
    func setMatchDetail(){
        
        LblTeam1.text = selectedMatch?.teams?.home?.name
        LblTeam2.text = selectedMatch?.teams?.away?.name
        lblScore.text  = "\(selectedMatch?.goals?.home ?? 0):\(selectedMatch?.goals?.away ?? 0)"
        lblRemainingTime.text = "\(selectedMatch?.fixture?.status?.long ?? "")\n \(selectedMatch?.fixture?.status?.elapsed ?? 0)"
        team1ImgView.sd_setImage(with: URL(string: selectedMatch?.teams?.home?.logo ?? ""), placeholderImage: placeHolderLeage, options: .forceTransition, context: nil)
        team2ImgView.sd_setImage(with: URL(string: selectedMatch?.teams?.away?.logo ?? ""), placeholderImage: placeHolderLeage, options: .forceTransition, context: nil)
        if selectedMatch?.events?.count ?? 0 > 0 && selectedMatch?.events != nil{
            lblEvent.text = "Type:     \(selectedMatch?.events?[0].type ?? "") \n Detail:     \(selectedMatch?.events?[0].detail ?? "") \n Commnets:     \(selectedMatch?.events?[0].comments ?? "")"
        }
        else
        {
            lblEvent.text = "Event not found"
        }
    }
    
    
    //MARK:- Actions
    
    
    @IBAction func btnBackTapped(_ sender: Any){
        self.popViewController()
    }
    
}
