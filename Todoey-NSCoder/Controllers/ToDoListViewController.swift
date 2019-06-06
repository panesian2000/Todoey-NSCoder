//
//  ViewController.swift
//  Todoey-NSCoder
//
//  Created by Kenny Loh on 6/6/19.
//  Copyright © 2019 ProApp Concept Pte Ltd. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {

    /*
        Note:   NSCoder are used to store small data and standard data type.
                Custom class object make up of standard data type are allow. Data are store in plist.
    */
    
    //MARK: Local global variables
    var filePath: URL?
    var itemArray: [ToDoItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let baseURL = FileManager.default.urls(for: FileManager.SearchPathDirectory.documentDirectory, in: FileManager.SearchPathDomainMask.userDomainMask).first {
            filePath = baseURL.appendingPathComponent("ToDoItem.plist")
        }
        
    }

    //MARK: Tableview datasource methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        let item: ToDoItem = itemArray[indexPath.row]
        
        // Ternary Conditional Operator - question ? answer1 : answer2.
        cell.textLabel?.text = item.description
        cell.accessoryType = item.completed ? UITableViewCell.AccessoryType.checkmark : UITableViewCell.AccessoryType.none
        
        return cell
    }
    
    //MARK: Tableview delegate methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell: UITableViewCell = tableView.cellForRow(at: indexPath)!
        let item: ToDoItem = itemArray[indexPath.row]
        
        // Ternary Conditional Operator - question ? answer1 : answer2.
        item.completed = !item.completed
        cell.accessoryType = item.completed ? UITableViewCell.AccessoryType.checkmark : UITableViewCell.AccessoryType.none
        
        itemArray[indexPath.row] = item
        saveToDoItemList()
        
        tableView.deselectRow(at: indexPath, animated: true)
        tableView.reloadData()
    }
    
    //MARK: Barbutton methods
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var itemTextField: UITextField = UITextField()
        let alert: UIAlertController = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: UIAlertController.Style.alert)
        let alertAddAction: UIAlertAction = UIAlertAction(title: "Add Item", style: UIAlertAction.Style.default) {
            (action) in
            
            if let description = itemTextField.text {
                if !description.isEmpty {
                    let item: ToDoItem = ToDoItem()
                    item.description = itemTextField.text!
                    item.completed = false
                    
                    self.itemArray.append(item)
                    self.saveToDoItemList()
                    
                    self.tableView.reloadData()
                }
            }
        }
        let alertCancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel) {
            (action) in
        }
        
        alert.addTextField { (textField) in
            textField.placeholder = "Create new item"
            itemTextField = textField
        }
        alert.addAction(alertAddAction)
        alert.addAction(alertCancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    //MARK: Manupulate data methods
    func loadToDoItemList() {
        
    }
    
    func saveToDoItemList() {
        let encoder: PropertyListEncoder = PropertyListEncoder()
        
        do {
            let data = try encoder.encode(itemArray)
            try data.write(to: filePath!)
        }
        catch {
            print("Error saving todo item list, \(error)")
        }
    }
    
}

