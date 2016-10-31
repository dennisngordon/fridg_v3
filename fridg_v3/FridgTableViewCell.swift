//
//  FridgTableViewCell.swift
//  fridg_v3
//
//  Created by Dennis Gordon on 10/27/16.
//  Copyright © 2016 Dennis Gordon. All rights reserved.
//

import UIKit

class FridgTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
