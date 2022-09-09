//
//  CreateAccountVC.swift
//  DataTransferTask-1
//
//  Created by Berkay on 5.09.2022.
//

import UIKit

class CreateAccountVC: UIViewController {

    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var departmentTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    var delegate: DataTransferProtocol?
    
    // Phone status bar dark
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .darkContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        phoneTextField.delegate = self
    }
    
    // to back from CreateAccountVC
    @IBAction func backButtonTapped(_ sender: Any) {
        dismiss(animated: true)
    }
    

    // Save contact information button
    @IBAction func signUpButtonTapped(_ sender: Any) {
        
        // Optional control status
        if let name = fullNameTextField.text, let department = departmentTextField.text, let email = emailTextField.text, let phone = phoneTextField.text {
            // Text Field cannot be empty
            if name != "" && department != "" && email != "" && phone != "" {
                // Send information to ViewVontroller
                delegate?.data(name: name, department: department, email: email, phone: phone)
                let alert = UIAlertController(title: "Create Account", message: "Successful", preferredStyle: .alert)
                self.present(alert, animated: true)
                
                // Asynchronous operations
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.dismiss(animated: true)
                    self.dismiss(animated: true)
                }
            }else {
                let alert = UIAlertController(title: "Warning", message: "Enter something", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Okay", style: .default))
                self.present(alert, animated: true)
            }
        }
    }
}

// Customizing the Text Field
extension CreateAccountVC: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        // Limit for Phone Text Field, have to 11 characters
        let maxLength = 11
        let currentString = (phoneTextField.text ?? "") as NSString
        let newString = currentString.replacingCharacters(in: range, with: string)
        return newString.count <= maxLength
    }
}
