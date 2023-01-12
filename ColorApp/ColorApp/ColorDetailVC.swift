//
//  ColorDetailVC.swift
//  ColorApp
//
//  Created by Ahmed Hussein on 09.01.23.
//

import UIKit

class ColorDetailVC: UIViewController {

    var color: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = color ?? .blue
    }
}
