//
//  InfoCellTableViewCell.swift
//  Animation Profile
//
//  Created by Pavlo Novak on 3/14/18.
//  Copyright © 2018 Pavlo Novak. All rights reserved.
//

import UIKit

class InfoCellTableViewCell: UITableViewCell {

    @IBOutlet weak var infoLabel: UILabel!
    
    func prepareForCell(information: InfoClass) {
        infoLabel.text = information.information
    }
}
