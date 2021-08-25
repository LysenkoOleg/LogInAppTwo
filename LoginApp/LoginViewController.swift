//
//  ViewController.swift
//  LoginApp
//
//  Created by Олег Лысенко on 25.08.2021.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var userNameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    var userName = "Name"
    var password = "Password"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else {
            return
        }
        welcomeVC.welcomeUserName = "Welcome, \(userName)!"
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func logInPressed() {
        if userNameTF.text == userName && userNameTF.text != "" {
            if passwordTF.text == password {
                passwordTF.text = ""
                return
            } else { errorLogIn(); passwordTF.text = ""}
        } else { errorLogIn(); passwordTF.text = "" }
    }
    
    @IBAction func forgotUNPressed() {
       showAlert(with: "Oops!", and: "Your name is \(userName)😉")
    }
    
    @IBAction func forgotPassPressed() {
        showAlert(with: "Oops!", and: "Your password is \(password)😉")
    }
    
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
        guard let _ = unwindSegue.source as? WelcomeViewController else {
            return
        }
        userNameTF.text = ""
        passwordTF.text = ""
    }
}

// MARK: - Private Methods
extension LoginViewController {
    private func showAlert(with title: String, and message: String){
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let okAlert = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAlert)
        present(alert, animated: true)
    }

    private func errorLogIn(){
        let alert = UIAlertController(
            title: "Invalid login or password",
            message: "Please, enter correct login and password",
            preferredStyle: .alert
        )
        let okAlert = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAlert)
        present(alert, animated: true)
    }
}

