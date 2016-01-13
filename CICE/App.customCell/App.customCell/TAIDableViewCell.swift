//
//  TAIDableViewCell.swift
//  App.customCell
//
//  Created by CICE on 13/1/16.
//  Copyright © 2016 CICE. All rights reserved.
//

import UIKit

class TAIDableViewCell: UITableViewCell {
    
    
    //MARK: - IBOulets
    @IBOutlet weak var customFirstName: UILabel!
    @IBOutlet weak var customLastName: UILabel!
    @IBOutlet weak var customText: UITextView!
    @IBOutlet weak var customImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
