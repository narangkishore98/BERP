//
//  Order.swift
//  BERP
//
//  Created by Kishore Narang on 2019-07-17.
//  Copyright © 2019 Bikloo. All rights reserved.
//

import Foundation
class Order
{
    private static var _orderID:Int = 0
    var orderID:Int
    var dateTime:Date
    var products:[Product]
    var discount:Discount?
    {
        set
        {
            totalPrice = totalPrice - (totalPrice * newValue / 100 )
            
        }
        get
        {
            return newValue
        }
    }
    var totalPrice:Float = 0
    init(products:[Product], discount:Discount?)
    {
        self.products = products
        self.dateTime = Date()
        Order._orderID += 1
        self.orderID = Order._orderID
        for product in products
        {
            self.totalPrice += product.price
        }
    }
}
