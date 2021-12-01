//
//  CustomAlert.swift
//  GuessTheMovie
//
//  Created by Yasmin Mohsen on 01/12/2021.
//

import Foundation
import UIKit
struct CustomAlert {
    static func showSimpleAlert(title: String,message: String, viewRef: UIViewController){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)

        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.cancel, handler: nil))
        viewRef.present(alert, animated: true, completion: nil)
    }
}
