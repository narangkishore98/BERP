//
//  Discount.swift
//  BERP
//
//  Created by User on 2019-07-17.
//  Copyright © 2019 Bikloo. All rights reserved.
//

import Foundation
class Discount:DisplayDelegate
{
    func display() -> String {
        return """
        Discount ID: \(discountID)
        Discount Name: \(discountName)
        Discount Code: \(discountCode)
        Discount Percent: \(discountPercent)
        
        """
    }
    private static var _discountID:Int = 0
    var discountID : Int
    var discountName : String
    var discountCode : String
    var discountPercent : Float
   
    
    init(discountID: Int, discountName: String, discountCode: String ,discountPercent: Float)
    {
        Discount._discountID += 1
        self.discountID = discountID
        self.discountName = discountName
        self.discountCode = discountCode
        self.discountPercent = discountPercent
    }
}
