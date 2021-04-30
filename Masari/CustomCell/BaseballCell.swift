//
//  BaseballCell.swift
//  Masari
//
//  Created by Hamza Shahbaz on 30/04/2021.
//

import UIKit

class BaseballCell: UITableViewCell {

    @IBOutlet weak  var lblTeam1Name: UILabel!
    @IBOutlet weak var lblTeam2Name: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var team1ImgView: UIImageView!
    @IBOutlet weak var team2ImgView: UIImageView!
    @IBOutlet weak var lblday: UILabel!
    @IBOutlet weak var lblPoint: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
