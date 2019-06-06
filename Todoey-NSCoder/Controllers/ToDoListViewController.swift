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

}

