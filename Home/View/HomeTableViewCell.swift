//
//  HomeTableViewCell.swift
//  Test
//
//  Created by UMESH MADATHA on 06/09/22.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func configureCell(text: String) {
        self.textLabel?.text = text
    }
}
