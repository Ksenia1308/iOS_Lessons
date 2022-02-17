//
//  ViewController.swift
//  Friends2
//
//  Created by 18986602 on 06.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let fromLoginToTabBarSegue = "fromLoginToTabBarSegue"
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapAction = UITapGestureRecognizer(target: self, action: #selector(tap))
        self.view.addGestureRecognizer(tapAction)
        
        NotificationCenter.default.addObserver(self , selector: #selector(openKeyboard(_:)), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self , selector: #selector(closeKeyboard(_:)), name: UIResponder.keyboardDidHideNotification, object: nil)
    }
    
    @objc func openKeyboard(_ notfication: Notification) {
        let keyboardSize = notfication.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect
        guard let keyboardHeight = keyboardSize?.height else {return}
        
        let contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardHeight, right: 0)
        scrollView.contentInset = contentInset
        scrollView.scrollIndicatorInsets = contentInset
    }
    @objc func closeKeyboard(_ notfication: Notification) {
        scrollView.contentInset = UIEdgeInsets.zero
        scrollView.scrollIndicatorInsets = UIEdgeInsets.zero
    }
    @objc func tap() {
        self.view.endEditing(true)
    }
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        guard let login = self.loginTextField.text,
              login == "puk",
        let password = self.passwordTextField.text,
            password == "000"
        else {
            print("error")
            return
        }
        performSegue(withIdentifier: fromLoginToTabBarSegue, sender: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

