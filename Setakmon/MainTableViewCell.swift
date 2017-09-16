//
//  MainTableViewCell.swift
//  Setakmon
//
//  Created by 이상윤 on 2017. 7. 30..
//  Copyright © 2017년 이상윤. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    @IBOutlet weak var runningTimeLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
