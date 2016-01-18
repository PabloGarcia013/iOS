//
//  AIDCustomCell.swift
//  App_Listado_de_tareas
//
//  Created by CICE on 18/1/16.
//  Copyright © 2016 CICE. All rights reserved.
//

import UIKit

class AIDCustomCell: UITableViewCell {
    
    
    // MARK: - IBOULET
    @IBOutlet weak var labelTarea: UILabel!
    @IBOutlet weak var labelPrioridad: UILabel!
    @IBOutlet weak var textViewDescripcion: UITextView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
