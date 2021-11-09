//
//  ViewController.swift
//  loginApp
//
//  Created by Роман on 27.10.2021.
//

import UIKit

class ViewController: UIViewController{
    
    private var user = User.getDataUser()
   
    
    @IBOutlet weak var userPaswordTF: UITextField!
    @IBOutlet weak var userNameTF: UITextField!
    
    private let login = "User"
    private let password = "password"
    
    override func viewDidLoad() {
        userNameTF.delegate = self
        userNameTF.returnKeyType = .next
        userPaswordTF.delegate = self
        userPaswordTF.returnKeyType = .done
        userPaswordTF.isEnabled = true
        userPaswordTF.enablesReturnKeyAutomatically = true
        userNameTF.autocapitalizationType = .words
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarController = segue.destination as? UITabBarController else {return}
        guard let viewControllers = tabBarController.viewControllers else {return}
        
        viewControllers.forEach {
            if let secondVC = $0 as? SecondViewController{
                secondVC.user = user
            } else if let navigationVC = $0 as? UINavigationController{
                if let thirdVC = navigationVC.topViewController as? ThirdViewController{
                    thirdVC.user = user
                }
            }
        }
        
    }
    
    @IBAction func loginAction() {
        if userNameTF.text != login || userPaswordTF.text != password {
            alert(
                title: "Invalid login or password",
                message: "Please, enter correct login and password",
                textField: userPaswordTF
            )
        }
    }
    
    @IBAction func fogotRegiserData(_ sender: UIButton){
        sender.tag == 0
        ? alert(title: "Ooops!", message: "You're name is \(login)")
        : alert(title: "Ooops!", message: "You're password is \(password)")
    }
    
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
        userNameTF.text = ""
        userPaswordTF.text = ""
    }
}

extension ViewController {
    private func alert(title: String, message: String, textField: UITextField? = nil){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default){  _ in
            textField?.text = ""
        })
        present(alert, animated: true, completion: nil)
    }
}

extension ViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            super.touchesBegan(touches, with: event)
            view.endEditing(true)
        }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTF {
            userPaswordTF.becomeFirstResponder()
        } else {
            loginAction()
            performSegue(withIdentifier: "onSecondVC", sender: nil)
        }
        return true
    }
    
    
}
