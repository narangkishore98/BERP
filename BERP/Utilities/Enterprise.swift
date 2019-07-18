//
//  Enterprise.swift
//  BERP
//
//  Created by Kishore Narang on 2019-07-17.
//  Copyright © 2019 Bikloo. All rights reserved.
//

import Foundation
enum EnterpriseType
{
    case Restaurant, Store, MegaMart
}
class Enterprise : DisplayDelegate
{
    func display() -> String {
        return """
        Enterprise ID: \(enterpriseID)
        Enterprise Name: \(enterpriseName)
        Enterprise Type: \(enterpriseType)
        No. Of Employees: \(employees.count)
        Address: \(address)
        """
    }
    
    private static var _enterpriseID:Int = 0
    var enterpriseID:Int
    var enterpriseName:String
    var address:String
    var bonusMultiplier:Int = 0
    var enterpriseType:EnterpriseType
    var products:[Product]
    var employees:[Employee]
    var orders:[Order]
    
    init(name:String, address:String, type:EnterpriseType)
    {
        self.enterpriseName = name
        self.address = address
        self.enterpriseType = type
        Enterprise._enterpriseID += 1
        self.enterpriseID = Enterprise._enterpriseID
        products = Array<Product>()
        employees = Array<Employee>()
        orders = Array<Order>()
    }
    func addEmployee(employee:Employee)
    {
        self.employees.append(employee)
        
    }
    func getEmployees() -> [Employee]
    {
        return employees
    }
    func addProduct(product:Product)
    {
        self.products.append(product)
    }
    func getAllProducts() -> [Product]
    {
        return products
    }
    func getProducts(startingWith:String) -> [Product]
    {
        return products // this we have to change [Kishore]
    }
    func getEmployee(withEmail:String) -> Employee?
    {
        for employee in employees
        {
            if employee.email == withEmail
            {
                return employee
            }
        }
        return nil
    }
    func addOrder(order:Order)
    {
        orders.append(order)
    }
    func getAllOrders() -> [Order]
    {
        return orders
    }
    
}
