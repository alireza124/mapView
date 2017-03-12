//
//  mapTableViewController.swift
//  6.1.1
//
//  Created by user on 11/30/1395 AP.
//  Copyright © 1395 user. All rights reserved.
//
import Foundation
import UIKit

class mapTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var label: UILabel!
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
            path = Bundle.main.path(forResource: "text", ofType: "txt")
            if path == Bundle.main.path(forResource: "text", ofType: "txt") {
                do {
                    data = try String(contentsOfFile: path, encoding: .utf8)
                    var myArray = data?.components(separatedBy: "\n")
                    
                    for i in 0...4{
                        let myArray1 = myArray?[i].components(separatedBy: ",")
                        array.add((myArray1?[2])! as String)
                        names.add((myArray1?[2])! as String)
                        addresses.add((myArray1?[3])! as String)
                        phones.add((myArray1?[4])! as String)
                    }
                    
                } catch {
                    
                }
            }
        label.text = names[0] as AnyObject as? String

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return names.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell : TableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell")! as! TableViewCell
        
        cell.TVname.text = "hi"
        //cell.TVaddress.text = (addresses[indexPath.row] as AnyObject) as! String
        //cell.TVphone.text = phones[indexPath.row] as! String
        return cell
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
