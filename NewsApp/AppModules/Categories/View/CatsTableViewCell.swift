//
//  CatsTableViewCell.swift
//  NewsApp
//
//  Created by Adam on 8/11/21.
//  Copyright © 2021 VL. All rights reserved.
//

import UIKit

class CatsTableViewCell: UITableViewCell {
    @IBOutlet weak var img: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
