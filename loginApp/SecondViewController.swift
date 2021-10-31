//
//  SecondViewController.swift
//  loginApp
//
//  Created by Роман on 28.10.2021.
//

import UIKit

class SecondViewController: UIViewController {

    
    var getUserName: String?
    
    @IBOutlet weak var nextFieldName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        nextFieldName.text = String("Welcome \(getUserName!)")
        
    }
}
