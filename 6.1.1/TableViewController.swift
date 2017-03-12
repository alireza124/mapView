//
//  TableViewController.swift
//  6.1.1
//
//  Created by user on 12/14/1395 AP.
//  Copyright © 1395 user. All rights reserved.
//
import Foundation
import UIKit

class TableViewController: UITableViewController {

    var array:NSMutableArray = NSMutableArray(capacity:1)
    var names:NSMutableArray = NSMutableArray(capacity:1)
    var addresses:NSMutableArray = NSMutableArray(capacity:1)
    var phones:NSMutableArray = NSMutableArray(capacity:1)
    var path:String! = nil
    var data:String? = nil
    var myArray:[String] = []
    var myArray1:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 121
        tableView.rowHeight = UITableViewAutomaticDimension
        path = Bundle.main.path(forResource: "text", ofType: "txt")
        if path == Bundle.main.path(forResource: "text", ofType: "txt") {
            do {
                data = try String(contentsOfFile: path, encoding: .utf8)
                var myArray = data?.components(separatedBy: "\n")
                
                for i in 0...100000{
                    let myArray1 = myArray?[i].components(separatedBy: ",")
                    //array.add((myArray1?[2])! as String)
                    names.add((myArray1?[2])! as String)
                    addresses.add((myArray1?[3])! as String)
                    phones.add((myArray1?[4])! as String)
                }
                
            } catch {
                
            }
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return names.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : TableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell")! as! TableViewCell
        
        cell.Tvname.text = names[indexPath.row] as? String
        cell.Tvphone.text = phones[indexPath.row] as? String
        cell.Tvaddress.text = addresses[indexPath.row] as? String
        return cell
    }

}
