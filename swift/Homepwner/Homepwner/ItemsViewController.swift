//
//  ItemsViewController.swift
//  Homepwner
//
//  Created by Omer Wazir on 9/3/14.
//  Copyright (c) 2014 Omer Wazir. All rights reserved.
//

import UIKit

class ItemsViewController: UITableViewController {
    
    override init(){
        super.init(style: UITableViewStyle.Plain)
        
        for _ in 1...5 {
            ItemStore.sharedStore.createItem()
        }
    }
    
    override init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    override convenience init(style: UITableViewStyle) {
        self.init()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Use .self to get the class. It's equivalent to [UITableViewCell class] in Objective-C.
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
    }
    
    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return ItemStore.sharedStore.allItems.count
    }
    
    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        
        //Get a new or recycled cell
        let cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("UITableViewCell", forIndexPath: indexPath) as UITableViewCell
        
        //Set the text of the cell with the description of the item
        //that is at the nth index of ItemStore.sharedStore.allitems
        
        let items = ItemStore.sharedStore.allItems
        let item:Item = items[indexPath.row]
        
        cell.textLabel.text = item.description
        
        return cell
    }
}
