//
//  HouseViewController.swift
//  Study-House-Project
//
//  Created by David Malicke on 6/29/22.
//

import UIKit
import PhotosUI

class HouseViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    var house: House?
    var isNewHouse = false
    
    @IBAction func changeInfoListType(_ sender: UISegmentedControl) {
        if let infoList = InfoList(rawValue: sender.selectedSegmentIndex) {
            
        }
    }
    
    @IBOutlet weak var houseImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if isNewHouse {
            let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveHouse))
            let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelHouse))
            navigationItem.rightBarButtonItem = saveButton
            navigationItem.leftBarButtonItem = cancelButton
            
        } else {
            
        }
        
        houseImageView.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(changeImage))
        houseImageView.addGestureRecognizer(gestureRecognizer)
        nameLabel.text = house?.name
        addressLabel.text = house?.address
        
    }
    
    
    @objc func saveHouse() {
        performSegue(withIdentifier: "SaveHouse", sender: nil)
    }
    
    @objc func cancelHouse() {
        performSegue(withIdentifier: "CancelHouse", sender: nil)
    }
    
    @objc func changeImage() {
        var configuration = PHPickerConfiguration()
        configuration.filter = .images
        configuration.selectionLimit = 1
        let controller = PHPickerViewController(configuration: configuration)
        controller.delegate = self
        present(controller, animated: true)
    }
    
}

extension HouseViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension HouseViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        if !results.isEmpty {
            let result = results.first!
            let itemProvider = result.itemProvider
            if itemProvider.canLoadObject(ofClass: UIImage.self) {
                itemProvider.loadObject(ofClass: UIImage.self) { [weak self] image, error in
                    guard let image = image as? UIImage else {
                        return
                    }
                    DispatchQueue.main.async {
                        self?.houseImageView.image = image
                    }
                }
            }
        }
    }
}
