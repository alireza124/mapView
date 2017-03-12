//
//  TableViewCell.swift
//  6.1.1
//
//  Created by user on 12/14/1395 AP.
//  Copyright © 1395 user. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var Tvname: UILabel!
    @IBOutlet weak var Tvaddress: UILabel!
    @IBOutlet weak var Tvphone: UILabel!
    @IBOutlet weak var Tvimage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
