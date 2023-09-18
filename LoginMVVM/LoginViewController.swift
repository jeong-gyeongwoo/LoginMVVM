//
//  ViewController.swift
//  LoginMVVM
//
//  Created by 정경우 on 2023/09/18.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var nicknameTextField: UITextField!
    @IBOutlet var locationTextField: UITextField!
    @IBOutlet var recommandTextField: UITextField!
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var reasonLabel: UILabel!
    @IBOutlet var emailInvaildLabel: UILabel!
    @IBOutlet var passwordInvaildLabel: UILabel!
    @IBOutlet var codeInvaildLabel: UILabel!
    
    
    
    
    var viewModel = LoginViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.addTarget(self, action: #selector(emailTextFieldChanged), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(passwordTextFieldChanged), for: .editingChanged)
        nicknameTextField.addTarget(self, action: #selector(nicknameextFieldChanged), for: .editingChanged)
        locationTextField.addTarget(self, action: #selector(locationTextFieldChanged), for: .editingChanged)
        recommandTextField.addTarget(self, action: #selector(recommandTextFieldChanged), for: .editingChanged)
        loginButton.addTarget(self, action: #selector(loginButtonClicked), for: .touchUpInside)

        viewModel.email.bind { text in
            self.emailTextField.text = text
        }
        viewModel.password.bind { text in
            self.passwordTextField.text = text
        }
        viewModel.nickname.bind { text in
            self.nicknameTextField.text = text
        }
        viewModel.location.bind { text in
            self.locationTextField.text = text
        }
        viewModel.code.bind { text in
            self.recommandTextField.text = text
        }
        viewModel.vaildation.bind { Bool in
            self.loginButton.isEnabled = Bool
            self.loginButton.backgroundColor = Bool ? .green : .red
        }

       
        
    }
    
    @objc func emailTextFieldChanged() {
        viewModel.email.value = emailTextField.text!
        viewModel.emailValidation()
        emailInvaildLabel.text = viewModel.invaildReason[0]
//        reasonLabel.text = viewModel.invaildReason.map {String($0)}.joined(separator: ",")
        viewModel.areVaild()
        print(viewModel.invaildReason)
    }
    @objc func passwordTextFieldChanged() {
        viewModel.password.value = passwordTextField.text!
        viewModel.passwordValidation()
        passwordInvaildLabel.text = viewModel.invaildReason[1]
        viewModel.areVaild()
    }
    @objc func nicknameextFieldChanged() {
        viewModel.nickname.value = nicknameTextField.text!
    }
    @objc func locationTextFieldChanged() {
        viewModel.location.value = locationTextField.text!
    }
    @objc func recommandTextFieldChanged() {
        viewModel.code.value = recommandTextField.text!
        viewModel.codeInvaildation()
        codeInvaildLabel.text = viewModel.invaildReason[2]
        viewModel.areVaild()
    }
    @objc func loginButtonClicked() {
        reasonLabel.text =  "로그인 성공"
    }
    
    
    
    
}

