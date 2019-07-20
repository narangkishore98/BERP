//
//  UINavigationControllerExtension.swift
//  BERP
//
//  Created by Kishore Narang on 2019-07-20.
//  Copyright © 2019 Bikloo. All rights reserved.
//

import Foundation
import UIKit

extension UINavigationController
{
    //https://stackoverflow.com/questions/8236940/how-do-i-pop-two-views-at-once-from-a-navigation-controller
    func popViewControllers(viewsToPop: Int, animated: Bool = true) {
        if viewControllers.count > viewsToPop {
            let vc = viewControllers[viewControllers.count - viewsToPop - 1]
            popToViewController(vc, animated: animated)
        }
    }
}
