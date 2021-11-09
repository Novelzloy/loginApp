//
//  ImageViewController.swift
//  loginApp
//
//  Created by Роман on 03.11.2021.
//

import UIKit

class ImageViewController: UIViewController {
    
    var user: User!

    @IBOutlet var button: [UIButton]!
    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        image.image = UIImage(named: user.person.image)
        
    }
    
}
