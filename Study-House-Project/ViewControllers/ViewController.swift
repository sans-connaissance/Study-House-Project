//
//  ViewController.swift
//  Study-House-Project
//
//  Created by David Malicke on 6/29/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    let house = House()
    
    @IBAction func saveHouseButton(_ sender: UIButton) {
        updateHouse()
        print(house.name)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func updateHouse() {
        house.name = nameTextField.text ?? ""
        house.address = addressTextField.text ?? ""
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        updateHouse()
        return true
    }
}
