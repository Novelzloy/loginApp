//
//  ThirdViewController.swift
//  loginApp
//
//  Created by Роман on 03.11.2021.
//

import UIKit

class ThirdViewController: UIViewController {

    var user: User!
    
    @IBOutlet weak var hobbies: UILabel!
    @IBOutlet weak var secondName: UILabel!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var firstName: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstName.text = user.person.firstName
        secondName.text = user.person.secondName
        hobbies.text = ""

        button.layer.cornerRadius = 20
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let imageVC = segue.destination as? ImageViewController else {return}
        imageVC.user = user
    }

    
}
