//
//  TeamTeamViewController.swift
//  Monsters
//
//  Created by Alex on 06/10/2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import UIKit

class TeamViewController: UIViewController, TeamViewInput {
    
    @IBOutlet weak var tableView: UITableView!
    
    var monsters: [Monster] = []
    
    let realm = RealmStorage.shared
    var output: TeamViewOutput!
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        let configurator = TeamModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: self)
        output.viewIsReady()
        
    }
    
    // MARK: TeamViewInput
    func setupInitialState() {
        monsters = realm.getMonsters().map(Monster.toModel)
        tableView.reloadData()
    }
}

extension TeamViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return monsters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MonsterCell") as! MonsterViewCell
        cell.smallImageView.image = monsters[indexPath.row].imageSmall
        cell.nameLabel.text = monsters[indexPath.row].name
        cell.levelLabel.text = "Level \(monsters[indexPath.row].level)"
        return cell
    }
}
