//
//  ViewController.swift
//  Weather
//
//  Created by Владимир Рузавин on 9/5/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var loginTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addGesture()
    }
    private func addGesture() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(handleGesture))
        self.scrollView.addGestureRecognizer(gesture)
    }
    @objc private func handleGesture() {
        print(999)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.addObservers()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.removeObservers()
    }
    private func addObservers() {
        NotificationCenter.default
            .addObserver(self, selector: #selector(handleKeybordWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default
            .addObserver(self, selector: #selector(handleKeyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    private func removeObservers() {
        NotificationCenter.default
            .removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default
            .removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    @IBAction private func onButtonPressed(_ sender: Any) {
        let login = self.loginTextField.text
        let password = self.passwordTextField.text
        if login == "admin" && password == "99999" {
            print("Вы вошли в систему")
        } else {
            print("Неверный логин и/или пароль")
        }
    }
    @objc private func handleKeybordWillShow() {
        self.scrollView.contentInset.bottom += 100
    }
    @objc private func handleKeyboardWillHide() {
        self.scrollView.contentInset.bottom += 0
    }
}

