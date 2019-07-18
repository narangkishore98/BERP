//
//  Product.swift
//  BERP
//
//  Created by Kishore Narang on 2019-07-17.
//  Copyright © 2019 Bikloo. All rights reserved.
//

import Foundation
enum ProductType
{
    case Food,Bakery,Organic, Dairy, Beverages
}
class Product : DisplayDelegate
{
    func display() -> String {
        return """
        Product ID: \(productID)
        Product Name: \(name)
        Product Barcode: \(barcode)
        Product Price: \(price.dollar())
        Product Type: \(productType)
        Product Description: \(description)
        """
    }
    
    private static var _productID:Int = 0
    var productID:Int
    var name:String
    var barcode:String
    var description:String
    var price:Float
    var productType:ProductType
    init(name:String, barcode:String, description:String, price:Float, productType:ProductType)
    {
        Product._productID += 1
        self.productID = Product._productID
        self.name = name
        self.barcode = barcode
        self.description = description
        self.price = price
        self.productType = productType
    }
}
