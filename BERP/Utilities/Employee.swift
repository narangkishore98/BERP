//
//  Employee.swift
//  BERP
//
//  Created by Kishore Narang on 2019-07-17.
//  Copyright © 2019 Bikloo. All rights reserved.
//

import Foundation
class Employee:User
{
    var points:Int = 0
    init(fullName: String, email: String, password: String, address: String) {
        super.init(fullName: fullName, email: email, password: password, address: address, userType: .Employee)
        
    }
    var workingIn:Enterprise!
    func addPoints(value:Int)
    {
        points += value
    }
    func makeOrder(products:[Product], discount:Discount?)
    {
        let order = Order(products: products, madeBy: self, discount: discount)
        workingIn.addOrder(order: order)
        points += workingIn.bonusMultiplier * 10
    }
    
    
}
