//
//  FridgTableViewController.swift
//  fridg_v3
//
//  Created by Dennis Gordon on 10/26/16.
//  Copyright © 2016 Dennis Gordon. All rights reserved.
//

import UIKit
//import SwiftyJSON

class FridgTableViewController: UITableViewController {
    
    //MARK : Properties
    
    var fridgItems = [FridgItem]()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        
        //Download fridg data for user and show fridg items
        let spinningActivity = MBProgressHUD.showAdded(to: self.view, animated: true)
        spinningActivity?.labelText = "Loading"
        spinningActivity?.detailsLabelText = "Please wait"
        
        
        var urlString = "http://localhost/fridgapp/scripts/getFridg.php?userId="
        let userId:String? = UserDefaults.standard.string(forKey: "userId")
        urlString += userId!
        
        if let url = URL(string: urlString) {
            
            if let data = try? Data(contentsOf: url, options: []) {
                
                let json = JSON(data: data)
                print(json)
                print(json["results"][0])
                //let results = JSON(json)
                
//                for anItem in results.array! {
//                    var name = anItem["ingredient_name"].string
//                    var qty = anItem["qty"].int 
//                    var imgUrl = anItem["img_url"].string
//                    fridgItems.append(FridgItem(ingredientName: name!, qty: qty!, imgUrl: imgUrl!)!)
//                }
                
//                for (key, subJson) in json["results"] {
//                    let name = subJson["ingredient_name"].string
//                    let qty = subJson["qty"].int
//                    let imgUrl = subJson["img_url"].string
//                    var fridgItem = FridgItem(ingredientName: name!, qty: qty!, imgUrl: imgUrl!)
//                    
//                    fridgItems += fridgItem
//                    
//                }
                print(fridgItems)
                
                
                
                
                
                
                //let arrJSON = json["results"]
                
                
                //print(arrJSON)
                //print(arrJSON[0]["ingredient_name"].string) // gives me the name of the first ingredient
                
                
                
                
                //for index in 0...arrJSON.count-1 {
                //    let fItem = FridgItem(ingredientName:arrJSON[index]["ingredient_name"].string!, qty:arrJSON[index]["qty"].int!, imgUrl:arrJSON[index]["img_url"])
                //}
                
                //print(json)
                
                //let f = json[0]["name"].stringValue
                
                //let s = json[0]["age"].stringValue
                
                //firstLb.text = f
                
                //secondLb.text = s
            }
        }
        
        
        
        
        
//        let myUrl = URL(string: "http://localhost/fridgapp/scripts/getFridg.php");
//        var request = URLRequest(url:myUrl!);
//        request.httpMethod = "POST";
//        let userId:String? = UserDefaults.standard.string(forKey: "userId");
//        let postString = "userId=\(userId!)";
//        request.httpBody = postString.data(using: String.Encoding.utf8);
//        
//        let task = URLSession.shared.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
//            
//            DispatchQueue.main.async
//                {
//                    
//                    spinningActivity!.hide(true)
//                    
//                    
//                    if(error != nil)
//                    {
//                        //Display an alert message
//                        let myAlert = UIAlertController(title: "Alert", message: error!.localizedDescription, preferredStyle: UIAlertControllerStyle.alert);
//                        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler:nil)
//                        myAlert.addAction(okAction);
//                        self.present(myAlert, animated: true, completion: nil)
//                        return
//                    }
//                    
//                    
//                    
//                    do {
//                        let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
//                        
//                        if let parseJSON = json {
//                            
//                            let status = parseJSON["status"] as? String
//                            if(status != nil)
//                            {
//                                
//                                //
//                                print(parseJSON["status"]);
//                                print(parseJSON["results"]);
//                                
//                                
//                               
//                                
//                                
//                            } else {
//                                // display an alert message
//                                let userMessage = parseJSON["message"] as? String
//                                let myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertControllerStyle.alert);
//                                let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler:nil)
//                                myAlert.addAction(okAction);
//                                self.present(myAlert, animated: true, completion: nil)
//                            }
//                            
//                        }
//                    } catch
//                    {
//                        print(error)
//                    }
//                    
//                    
//            }
//            
//            
//            
//        }
//        
//        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
    
    @IBAction func leftSideButtonTapped(_ sender: AnyObject) {
        let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        
        appDelegate.drawerContainer!.toggle(MMDrawerSide.left, animated: true, completion: nil)
    }
    

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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
