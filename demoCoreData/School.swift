//
//  School.swift
//  demoCoreData
//
//  Created by Godfather on 3/12/17.
//  Copyright © 2017 Godfather. All rights reserved.
//

import Foundation


class Class: NSObject {
    
    var nameClass: String = ""
    var student: [Student] = []
    
    init(nameClass: String, student: [Student]) {
        self.nameClass = nameClass
        self.student = student
    }
    
}

class Student {
    var nameStudent: String = ""
    var ageStudent: String = ""
    var addressStudent: String = ""
    var phoneNumberStudent: String = ""
    
    
    init(nameStudent: String, ageStudent: String, addressStudent: String, phoneNumberStudent: String) {
        self.nameStudent = nameStudent
        self.ageStudent = ageStudent
        self.addressStudent = addressStudent
        self.phoneNumberStudent = phoneNumberStudent
    }
}
