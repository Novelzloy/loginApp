//
//  ViewController.swift
//  loginApp
//
//  Created by Роман on 27.10.2021.
//

import UIKit

class ViewController: UIViewController{
    
    @IBOutlet weak var userPaswordTF: UITextField!
    @IBOutlet weak var userNameTF: UITextField!
    
    let login = "User"
    let password = "Password"
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let secondViewController = segue.destination as? SecondViewController else {return}
        secondViewController.getUserName = userNameTF.text
    }
    
    @IBAction func loginAction() {
        if userNameTF.text == "" || userPaswordTF.text == ""{
            userNameTF.text = ""
            alert(title: "Invalid login or password", message: "Please, enter correct login or password")
        }
        if userNameTF.text != login || userPaswordTF.text != password {
            userPaswordTF.text = ""
            alert(title: "Invalid login or password", message: "Please, enter correct login or password")
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
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTF {
            userPaswordTF.becomeFirstResponder()
        } else {
            loginAction()
            performSegue(withIdentifier: "onSecondVC", sender: nil)
        }
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            super .touchesBegan(touches, with: event)
            super.touchesBegan(touches, with: event)
            view.endEditing(true)
    }
}
