//
//  FridgItem.swift
//  fridg_v3
//
//  Created by Dennis Gordon on 10/26/16.
//  Copyright © 2016 Dennis Gordon. All rights reserved.
//

import Foundation

class FridgItem
{
    //Mark : Properties
    var ingredientName: String?
    var qty: Int
    var imgUrl: String?
    
    //Mark : Initialization
    init?(ingredientName: String, qty: Int, imgUrl: String) {
        self.ingredientName = ingredientName
        self.qty = qty
        self.imgUrl = imgUrl
        
        if ingredientName.isEmpty || qty < 0 {
            return nil
        }
    }
    
}
