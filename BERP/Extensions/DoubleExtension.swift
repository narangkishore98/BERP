//
//  DoubleExtension.swift
//  BERP
//
//  Created by Kishore Narang on 2019-07-19.
//  Copyright © 2019 Bikloo. All rights reserved.
//

import Foundation
extension Double
{
    func dollar() -> String
    {
        return String(format: "$%.02f", self)
    }
}
