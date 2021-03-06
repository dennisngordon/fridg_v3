//
//  LeftSideViewController.swift
//  fridg_v3
//
//  Created by Dennis Gordon on 2016-09-27.
//  Copyright (c) 2016 Dennis Gordon. All rights reserved.
//

import UIKit

class LeftSideViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {

    var menuItems:[String] = ["Dashboard","My FRIDG","Sign out"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return menuItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let myCell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) 
        
        myCell.textLabel?.text = menuItems[(indexPath as NSIndexPath).row]
        
        return myCell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        switch((indexPath as NSIndexPath).row)
        {
        case 0:
            let mainPageViewController = self.storyboard?.instantiateViewController(withIdentifier: "MainPageViewController") as! MainPageViewController
            let mainPageNav = UINavigationController(rootViewController: mainPageViewController)
            
           let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
            
           appDelegate.drawerContainer!.centerViewController = mainPageNav
           appDelegate.drawerContainer!.toggle(MMDrawerSide.left, animated: true, completion: nil)
            
            break
        case 1:
            let fridgTableViewController = self.storyboard?.instantiateViewController(withIdentifier: "FridgTableViewController") as! FridgTableViewController
            let fridgPageNav = UINavigationController(rootViewController: fridgTableViewController)
            
            let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
            
            appDelegate.drawerContainer!.centerViewController = fridgPageNav
            appDelegate.drawerContainer!.toggle(MMDrawerSide.left, animated: true, completion: nil)
            
            break
        case 2:
            
            UserDefaults.standard.removeObject(forKey: "userFirstName")
            UserDefaults.standard.removeObject(forKey: "userLastName")
            UserDefaults.standard.removeObject(forKey: "userId")
            UserDefaults.standard.synchronize()
            
            
            let signInPage = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
            
            let signInNav = UINavigationController(rootViewController: signInPage)
            
            let appDelegate = UIApplication.shared.delegate
            appDelegate?.window??.rootViewController = signInNav

            break
            
        default:
            print("Not handled")
        }
    }
    
    
     }
