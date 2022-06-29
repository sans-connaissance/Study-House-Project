//
//  HouseViewController.swift
//  Study-House-Project
//
//  Created by David Malicke on 6/29/22.
//

import UIKit

class HouseViewController: UIViewController {

    @IBAction func changeInfoListType(_ sender: UISegmentedControl) {
        
        if let infoList = InfoList(rawValue: sender.selectedSegmentIndex) {
 
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

}
