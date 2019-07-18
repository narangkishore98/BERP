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
    var workingIn:Enterprise!
    func addPoints(value:Int)
    {
        points += value
    }
    
    
}
