//
//  MenuCell.swift
//  Masari
//
//  Created by Bukhari Syed Saood on 3/31/21.
//

import UIKit

class MenuCell: UITableViewCell {

    //MARK:- Properties
    
    @IBOutlet weak var menuImgView: UIImageView!
    @IBOutlet weak var menuLblText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
