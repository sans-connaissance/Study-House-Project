//
//  ViewController.swift
//  Study-House-Project
//
//  Created by David Malicke on 6/29/22.
//

import UIKit

class AddHouseViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    let house = House()
    
    @IBAction func saveHouseButton(_ sender: UIButton) {
        updateHouse()
        if house.isValid() {
            print(house.name)
        } else  {
            let alert = UIAlertController(title: "Invalid House Entry", message: "Please fill out both fields", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default) { action in
                
            }
            alert.addAction(action)
            present(alert, animated: true)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func updateHouse() {
        house.name = nameTextField.text ?? ""
        house.address = addressTextField.text ?? ""
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "HouseEntry" {
            guard let houseViewController = segue.destination as? HouseViewController else {
                return
            }
            houseViewController.house = house
        }
    }
}

extension AddHouseViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        updateHouse()
        return true
    }
}
