//
//  CurrencyExtension.swift
//  BERP
//
//  Created by User on 2019-07-17.
//  Copyright © 2019 Bikloo. All rights reserved.
//

import Foundation

extension Float
{
    
        public func dollar() -> String
        {
            return String.init(format: "$%0.2f", self)
        }
    

}
