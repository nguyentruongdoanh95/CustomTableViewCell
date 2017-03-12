//
//  ViewController.swift
//  demoCoreData
//
//  Created by Godfather on 3/11/17.
//  Copyright © 2017 Godfather. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var listTitle = [String]()
    var listSchool: [[Class]] = [
        [Class(nameClass: "Lớp 1", student: [
            Student(nameStudent: "1", ageStudent: "21", addressStudent: "Q1", phoneNumberStudent: "12345"),
            Student(nameStudent: "2", ageStudent: "22", addressStudent: "Q2", phoneNumberStudent: "56789"),
            Student(nameStudent: "3", ageStudent: "23", addressStudent: "Q3", phoneNumberStudent: "10111213"),])],
        [Class(nameClass: "Lớp 2", student: [
            Student(nameStudent: "4", ageStudent: "24", addressStudent: "Q4", phoneNumberStudent: "141516"),
            Student(nameStudent: "5", ageStudent: "25", addressStudent: "Q5", phoneNumberStudent: "171819"),
            Student(nameStudent: "6", ageStudent: "26", addressStudent: "Q6", phoneNumberStudent: "202122")])],
        [Class(nameClass: "Lớp 3", student: [
            Student(nameStudent: "7", ageStudent: "27", addressStudent: "Q7", phoneNumberStudent: "232425"),
            Student(nameStudent: "8", ageStudent: "28", addressStudent: "Q8", phoneNumberStudent: "262728"),
            Student(nameStudent: "9", ageStudent: "29", addressStudent: "Q9", phoneNumberStudent: "293031"),
            Student(nameStudent: "10", ageStudent: "30", addressStudent: "Q10", phoneNumberStudent: "323334")])]
    ]
    var isFirstLoad: Bool = true
    var selectedSection: Int = -1
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = editButtonItem
        tableView.tableFooterView = UIView(frame: .zero)
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        tableView.setEditing(editing, animated: animated)
    }
    
    @objc fileprivate func taped(sender: UITapGestureRecognizer) {
        let view = sender.view
        if (selectedSection == view?.tag) {
            selectedSection = -1
        } else {
            selectedSection = (view?.tag)!
        }
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        //return arrTitle.count
        return listSchool.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let insideSchool = listSchool[section][0]
        if section != selectedSection {
            return 0
        } else {
            return insideSchool.student.count
        }
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let insideSchool = listSchool[section][0]
        return insideSchool.nameClass
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UITableViewHeaderFooterView()
        let imgView = UIImageView(frame: CGRect(x: tableView.frame.width - 20, y: 20, width: 20, height: 20))
        if selectedSection == section {
            imgView.image = #imageLiteral(resourceName: "div")
        } else {
            imgView.image = #imageLiteral(resourceName: "pluss")
        }
        
        headerView.contentView.addSubview(imgView)
        headerView.tag = section
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.taped(sender:)))
        headerView.addGestureRecognizer(tapGesture)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SchoolTableViewCell
        let insideSchool = listSchool[indexPath.section][0]
        cell.lblName.text = "Tên: \(insideSchool.student[indexPath.row].nameStudent)"
        cell.lblAddress.text = "Địa chỉ: \(insideSchool.student[indexPath.row].addressStudent)"
        cell.lblPhoneNumber.text = "Sđt: \(insideSchool.student[indexPath.row].phoneNumberStudent)"
        cell.lblAge.text = "Tuổi: \(insideSchool.student[indexPath.row].ageStudent)"
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            let insideSchool = listSchool[indexPath.section][0]
            insideSchool.student.remove(at: indexPath.row)
            if insideSchool.student.count > 0 {
                tableView.deleteRows(at: [indexPath], with: .automatic)
                
            } else if insideSchool.student.count != 1 {
                // Do something
            }
            tableView.reloadData()
            
        }
    }
    
    
    
}


extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let insideSchool = listSchool[section][0]
        if insideSchool.student.count > 0 {
            return 60
        } else {
            return 0
        }
        
    }
}












