//
//  MyViewController.swift
//  MyAwesomeChecklist
//
//  Created by Dominik on 08/06/14.
//  Copyright (c) 2014 Dominik. All rights reserved.
//

import UIKit

class MyViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {
    
    var tableView: UITableView!
    var textField: UITextField!
    
    var tableViewData = ["My Text 1","MyText 2"]
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up table view
        
        self.tableView = UITableView(frame: CGRectMake(0, 100, self.view.bounds.size.width, self.view.bounds.size.height-100), style: UITableViewStyle.Plain)
        //self.tableView.registerClass(UITableViewCell.self, forHeaderFooterViewReuseIdentifier: "myCell")
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "myCell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.view.addSubview(self.tableView)
        
        // Set up text field
        self.textField = UITextField(frame: CGRectMake(0, 0, self.view.bounds.size.width, 100))
        self.textField.backgroundColor = UIColor.redColor()
        self.textField.delegate = self
        
        self.view.addSubview(self.textField)
        
        
        
    }
    
    // TableViewDatasoruce
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int{
        return tableViewData.count
    }
    
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!{
        
        let myNewCell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath) as UITableViewCell
        
        myNewCell.text = self.tableViewData[indexPath.row]
        
        return myNewCell
        
    }
    
    // TextFieldDelegate
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        
        tableViewData.append(textField.text)
        textField.text = ""
        self.tableView.reloadData()
        textField.resignFirstResponder()
        return true
    }


}
