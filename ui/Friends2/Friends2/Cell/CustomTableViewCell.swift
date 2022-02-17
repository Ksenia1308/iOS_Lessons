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
    
    func configure(name: String?, description: String?, image: UIImage?) {
        photo.image = image
        descriptionLable.text = description
        self.name.text = name
    }
    
    func configure(group: Group) {
        if let avatarPath = group.avatarImagePath {
        photo.image = UIImage(named: avatarPath)
        }
        descriptionLable.text = group.description
        self.name.text = group.name
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        photo.image = nil
        descriptionLable.text = nil
        name.text = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
