//
//  House.swift
//  Study-House-Project
//
//  Created by David Malicke on 6/29/22.
//

import Foundation

enum InfoList: Int {
  case utilities, cable
}

class House {
    var name = ""
    var address = ""
    
    func isValid() -> Bool {
        return !(name.isEmpty && address.isEmpty)
    }
}
