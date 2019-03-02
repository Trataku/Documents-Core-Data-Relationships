//
//  NewCategoryViewController.swift
//  Documents Core Data
//
//  Created by Dylan Mouser on 3/1/19.
//  Copyright © 2019 Dylan Mouser. All rights reserved.
//

import UIKit

class NewCategoryViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        titleTextField.resignFirstResponder()
    }
    
    @IBAction func saveCategory(_ sender: Any) {
        let category = Category(title: titleTextField.text ?? "")
        
        do {
            try category?.managedObjectContext?.save()
            
            self.navigationController?.popViewController(animated: true)
        } catch {
            print("Could not save Category")
        }
    }
    

}

extension NewCategoryViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
