//
//  UIViewController + ActivityIndicator.swift
//  StarWarsInformation
//
//  Created by Satwik Munshi on 2019-01-22.
//  Copyright © 2019 Satwik Munshi. All rights reserved.
//

import Foundation
import UIKit

/* Created with the help of
 http://brainwashinc.com/2017/07/21/loading-activity-indicator-ios-swift/
 */

extension UIViewController {
    class func displaySpinner(onView : UIView) -> UIView {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let ai = UIActivityIndicatorView.init(activityIndicatorStyle: .whiteLarge)
        ai.startAnimating()
        ai.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
        }
        
        return spinnerView
    }
    
    class func removeSpinner(spinner :UIView) {
        DispatchQueue.main.async {
            spinner.removeFromSuperview()
        }
    }
}
