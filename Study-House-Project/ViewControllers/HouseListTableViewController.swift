//
//  HouseListTableViewController.swift
//  Study-House-Project
//
//  Created by David Malicke on 6/30/22.
//

import UIKit

class HouseListTableViewController: UITableViewController {

    var houses = [House]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let house1 = House()
        let house2 = House()
        let house3 = House()
        
        house1.name = "Ann Arbor"
        house1.address = "1715 South BLVD, Ann Arbor MI, 48104"
        house2.name = "Nice Apt"
        house2.address = "8 Rue D'anglaterre, Nice 0600"
        house3.name = "Cottage Row"
        house3.address = "Path of Believers, Howell, MI"

        houses = [house1, house2, house3]
        
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return houses.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HouseCell", for: indexPath)
        cell.textLabel?.text = houses[indexPath.row].name
        cell.imageView?.image = UIImage(systemName: "house")
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let house = houses[indexPath.row]
        performSegue(withIdentifier: "ShowHouseEntry", sender: house)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowHouseEntry" {
            guard let houseViewController = segue.destination as? HouseViewController,
                  let house = sender as? House else {
                return
            }
            houseViewController.house = house
        }
    }
}
