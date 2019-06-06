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
        
        cell.textLabel?.text = item.description
        cell.accessoryType = item.completed ? UITableViewCell.AccessoryType.checkmark : UITableViewCell.AccessoryType.none
        
        return cell
    }
    
    //MARK: Tableview delegate methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell: UITableViewCell = tableView.cellForRow(at: indexPath)!
        let item: ToDoItem = itemArray[indexPath.row]
        
        item.completed = !item.completed
        cell.accessoryType = item.completed ? UITableViewCell.AccessoryType.checkmark : UITableViewCell.AccessoryType.none
        
        saveToDoItemList()
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK: Barbutton methods
    
    //MARK: Manupulate data methods
    func loadToDoItemList() {
        
    }
    
    func saveToDoItemList() {
        
    }
    
}

