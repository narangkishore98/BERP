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
    private static var _enterpriseID:Int = 0
    var enterpriseID:Int
    var enterpriseName:String
    var address:String
    var enterpriseType:EnterpriseType
    var products:[Products]
    var employees:[Employees]
    
    init()
}
