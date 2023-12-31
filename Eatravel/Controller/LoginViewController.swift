//
//  LoginViewController.swift
//  Eatravel
//
//  Created by Yapı Kredi Teknoloji A.Ş. on 21.07.2023.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {
    var text: UILabel!
    
    private let email = CustomTextField(fieldType: .email)
    private let password = CustomTextField(fieldType: .password)
    
    private let loginBtn = CustomButton(title: "Sign In", hasBackground: true, fontSize: .med)
    
    private let registerBtn = CustomButton(title: "Create Account" , fontSize: .small)
    private let forgotPasswordBtn = CustomButton(title: "Forgot Password", fontSize: .small)
    
    private let authHeader = AuthHeaderView(title: "Sign In", subTitle: "Sign in to your account")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        
        loginBtn.addTarget(self, action: #selector(openMainPage), for: .touchUpInside)
        registerBtn.addTarget(self, action: #selector(openRegisterPage), for: .touchUpInside)
        forgotPasswordBtn.addTarget(self, action: #selector(openForgotPasswordPage), for: .touchUpInside)
    }
            
    @objc private func openMainPage(){
        self.loginPost()
    }
    
    @objc private func openRegisterPage(){
            navigationController?.pushViewController(RegisterViewController(), animated: true)
        }

    @objc private func openForgotPasswordPage(){
            navigationController?.pushViewController(ForgotPasswordViewController(), animated: true)
        }
    
    private func setupUI(){
        self.view.backgroundColor = .systemBackground

        self.view.addSubview(authHeader)
        self.view.addSubview(email)
        self.view.addSubview(password)
        self.view.addSubview(loginBtn)
        self.view.addSubview(registerBtn)
        self.view.addSubview(forgotPasswordBtn)
        
        self.authHeader.translatesAutoresizingMaskIntoConstraints = false
        self.email.translatesAutoresizingMaskIntoConstraints = false
        self.password.translatesAutoresizingMaskIntoConstraints = false
        self.loginBtn.translatesAutoresizingMaskIntoConstraints = false
        self.registerBtn.translatesAutoresizingMaskIntoConstraints = false
        self.forgotPasswordBtn.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            self.authHeader.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor, constant: 40),
            self.authHeader.heightAnchor.constraint(equalToConstant: 222),
            self.authHeader.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.authHeader.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            
            
            self.email.topAnchor.constraint(equalTo: self.authHeader.bottomAnchor, constant: 20),
            self.email.centerXAnchor.constraint(equalTo: self.authHeader.centerXAnchor),
            self.email.heightAnchor.constraint(equalToConstant: 55),
            self.email.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.85),
            
            self.password.topAnchor.constraint(equalTo: self.email.bottomAnchor, constant: 20),
            self.password.centerXAnchor.constraint(equalTo: self.email.centerXAnchor),
            self.password.heightAnchor.constraint(equalToConstant: 55),
            self.password.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.85),
            
            self.loginBtn.topAnchor.constraint(equalTo: self.password.bottomAnchor, constant: 20),
            self.loginBtn.centerXAnchor.constraint(equalTo: self.password.centerXAnchor),
            self.loginBtn.heightAnchor.constraint(equalToConstant: 55),
            self.loginBtn.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.85),
            
            self.registerBtn.topAnchor.constraint(equalTo: self.loginBtn.bottomAnchor, constant: 20),
            self.registerBtn.centerXAnchor.constraint(equalTo: self.loginBtn.centerXAnchor),
            //self.registerBtn.heightAnchor.constraint(equalToConstant: 55),
            self.registerBtn.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.85),
            
            self.forgotPasswordBtn.topAnchor.constraint(equalTo: self.registerBtn.bottomAnchor, constant: 15),
            self.forgotPasswordBtn.centerXAnchor.constraint(equalTo: self.registerBtn.centerXAnchor),
            //self.forgotPassBtn.heightAnchor.constraint(equalToConstant: 55),
            self.forgotPasswordBtn.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.85)
            
        ])
    }
}

extension LoginViewController {
    private func loginPost(){
        let endpoint = "http://localhost:3001/auth/login"
        let params = ["email": "dundarrburhan@gmail.com", "password": "123456"]
        guard let url = URL(string: endpoint) else { return }
        AF.request(url, method: .post, parameters: params).responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let postBody = try decoder.decode(LoginResponseModel.self, from: data)
                    
                    guard let status = postBody.status else { return }
                    
                    if status == "ok" {
                        print("giriş başarılı")
                    } else {
                        print("giriş başarısız")
                    }
                    
                 } catch {
                     print(error)
                 }
            case .failure(let error):
                    print(error)
                }
            }
    }
}
