//
//  CustomTableViewCell.swift
//  Friends4
//
//  Created by 18986602 on 13.02.2022.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    
    @IBOutlet weak var photo: UIImageView!
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var descriptionLable: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
