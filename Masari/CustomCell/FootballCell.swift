//
//  FootballCell.swift
//  Masari
//
//  Created by Hamza Shahbaz on 22/04/2021.
//

import UIKit

class FootballCell: UITableViewCell {

    @IBOutlet weak var team1ImgView: UIImageView!
    @IBOutlet weak var team2ImgView: UIImageView!
    @IBOutlet weak var LblTeam1: UILabel!
    @IBOutlet weak var LblTeam2: UILabel!
    @IBOutlet weak var lblRemainingTime: UILabel!
    @IBOutlet weak var btnBetNow: UIButton!
    @IBOutlet weak var betNowView: UIView!
    @IBOutlet weak var betNowHeight: NSLayoutConstraint!
    @IBOutlet weak var lblScore: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
