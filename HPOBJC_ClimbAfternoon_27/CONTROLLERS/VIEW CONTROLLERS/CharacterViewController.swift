//
//  CharacterViewController.swift
//  HPOBJC_ClimbAfternoon_27
//
//  Created by RYAN GREENBURG on 7/3/19.
//  Copyright © 2019 RYAN GREENBURG. All rights reserved.
//

import UIKit

class CharacterViewController: UIViewController {
    
    var characters: [AJDWCharacter] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
       
        AJDWCharacterController.sharedInstance().fetchCharacters({ (characters) in
            guard let foundCharacters = characters else { return }
            self.characters = foundCharacters
        })
        
    }
}

extension CharacterViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "characterCell", for: indexPath) as? CharacterTableViewCell
        
        let character = characters[indexPath.row]
        cell?.character = character
        
        return cell ?? UITableViewCell()
    }
    
}
