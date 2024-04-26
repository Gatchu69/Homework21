//
//  logInView.swift
//  homework21
//
//  Created by Nodiko Gachava on 27.04.24.
//

import UIKit

class LogInVC: UIViewController {
    let userImage = UIImageView()
    let userNameLabel: UILabel = {
        let label = UILabel()
        label.text = "მომხმარებლის სახელი"
        label.font = UIFont(name: "FiraGO", size: 11)
        label.font = UIFont.systemFont(ofSize: 11)
        label.textAlignment = .left
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let userPassLabel: UILabel = {
        let label = UILabel()
        label.text = "პაროლი"
        label.font = UIFont(name: "FiraGO", size: 11)
        label.font = UIFont.systemFont(ofSize: 11)
        label.textAlignment = .left
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let repeatPassLabel: UILabel = {
        let label = UILabel()
        label.text = "გაიმეორეთ პაროლი"
        label.font = UIFont(name: "FiraGO", size: 11)
        label.font = UIFont.systemFont(ofSize: 11)
        label.textAlignment = .left
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let userName: UITextField = {
        let text = UITextField()
        text.placeholder = "შეიყვანეთ მომხმარებლის სახელი"
        text.layer.cornerRadius = 22.5
        text.borderStyle = .roundedRect
        text.layer.backgroundColor = UIColor.gray.cgColor
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    let userPass: UITextField = {
        let text = UITextField()
        text.placeholder = "პაროლი"
        text.layer.cornerRadius = 22.5
        text.borderStyle = .roundedRect
        text.layer.backgroundColor = UIColor.gray.cgColor
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    let userRepeatPass: UITextField = {
        let text = UITextField()
        text.placeholder = "გაიმეორეთ პაროლი"
        text.layer.cornerRadius = 22.5
        text.borderStyle = .roundedRect
        text.layer.backgroundColor = UIColor.gray.cgColor
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    let logInButton: UIButton = {
        let button = UIButton()
        button.setTitle("შესვლა", for: .normal)
        button.backgroundColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
       
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(userNameLabel)
        view.addSubview(userPassLabel)
        view.addSubview(repeatPassLabel)
        view.addSubview(userName)
        view.addSubview(userPass)
        view.addSubview(userRepeatPass)
        view.addSubview(logInButton)
        logInButton.addAction(UIAction (handler: { action in
            self.goToNextVC()
        }), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            userNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 289),
            userNameLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant:24),
            userPassLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 384),
            userPassLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24),
            repeatPassLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 479),
            repeatPassLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24),
            userName.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24),
            userName.topAnchor.constraint(equalTo: view.topAnchor, constant: 308),
            userName.widthAnchor.constraint(equalToConstant: 327),
            userName.heightAnchor.constraint(equalToConstant: 45),
            userPass.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24),
            userPass.topAnchor.constraint(equalTo: view.topAnchor, constant: 403),
            userPass.widthAnchor.constraint(equalToConstant: 327),
            userPass.heightAnchor.constraint(equalToConstant: 45),
            userRepeatPass.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24),
            userRepeatPass.topAnchor.constraint(equalTo: view.topAnchor, constant: 498),
            userRepeatPass.widthAnchor.constraint(equalToConstant: 327),
            userRepeatPass.heightAnchor.constraint(equalToConstant: 45),
            logInButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 593),
            logInButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24),
            logInButton.widthAnchor.constraint(equalToConstant: 327),
            logInButton.heightAnchor.constraint(equalToConstant: 45),
        ])
    }
    
    func goToNextVC(){
        let nameInput = userName.text
        let passInput = userPass.text
        let repeatPassInput = userRepeatPass.text
        let countriesViewController = CountriesViewController()
        if passInput == repeatPassInput && passInput!.count > 4 && nameInput?.count != 0 {
            self.navigationController?.pushViewController(countriesViewController, animated: true)
        } else {
            let alert = UIAlertController(title: "შეცდომა", message: "შეავსეთ ყველა ველი სწორად", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "კაი ჩემო ძმაო ", style: .cancel))
            present(alert, animated: true)
        }
    }
}
