//
//  BetsCell.swift
//  Masari
//
//  Created by Bukhari Syed Saood on 3/31/21.
//

import UIKit

class BetsCell: UITableViewCell {

    //MARK:- Properties
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblTitle : UILabel!
    @IBOutlet weak var amountView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
