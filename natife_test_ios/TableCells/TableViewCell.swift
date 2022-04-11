//
//  TableViewCell.swift
//  natife_test_ios
//
//  Created by Разработчик on 28.03.2022.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var titleCell: UILabel!
    @IBOutlet weak var previewTextCell: UILabel!
    @IBOutlet var showInFullButton: UIButton!
    @IBOutlet weak var timeShampCell: UILabel!
    @IBOutlet weak var likesCountCell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
