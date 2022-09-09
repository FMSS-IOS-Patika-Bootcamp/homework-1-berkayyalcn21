//
//  ViewController.swift
//  DataTransferTask-1
//
//  Created by Berkay on 5.09.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var homeBgView: UIView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelDepartment: UILabel!
    @IBOutlet weak var labelEmail: UILabel!
    @IBOutlet weak var labelPhone: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeView()
    }
    
    // View radius
    func homeView() {
        homeBgView.layer.cornerRadius = 20
        homeBgView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    // Phone status bar white
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    // Go to CreateAccountVC
    @IBAction func createButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "toCreate", sender: nil)
    }
    
    // Check identifier and give a permission
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toCreate" {
            let toGoVC = segue.destination as! CreateAccountVC
            toGoVC.delegate = self
        }
    }
}

// inherit from DataTransferProtocol
extension ViewController: DataTransferProtocol {
    
    func data(name: String?, department: String?, email: String?, phone: String?) {
        
        labelName.text = name
        labelDepartment.text = department
        labelEmail.text = email
        labelPhone.text = phone
    }
}


