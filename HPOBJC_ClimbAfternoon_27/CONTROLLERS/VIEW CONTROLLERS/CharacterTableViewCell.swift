//
//  CharacterTableViewCell.swift
//  HPOBJC_ClimbAfternoon_27
//
//  Created by RYAN GREENBURG on 7/3/19.
//  Copyright © 2019 RYAN GREENBURG. All rights reserved.
//

import UIKit

class CharacterTableViewCell: UITableViewCell {

    var character: AJDWCharacter? {
        didSet {
            updateViews()
        }
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var wandLabel: UILabel!
    @IBOutlet weak var houseLabel: UILabel!
    @IBOutlet weak var bloodStatusLabel: UILabel!
    
    func updateViews() {
        guard let character = character else { return }
        nameLabel.text = character.name
        wandLabel.text = character.wand
        houseLabel.text = character.house
        bloodStatusLabel.text = character.bloodStatus
        
        nameLabel.textColor = character.deathEater ? .red : .green
    }
}
