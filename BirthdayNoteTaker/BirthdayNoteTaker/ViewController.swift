//
//  ViewController.swift
//  BirthdayNoteTaker
//
//  Created by Mesut Kaya on 1.11.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameTextfield: UITextField!
    @IBOutlet weak var birthdayTextfield: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
        
        if let newName = storedName as? String {
            nameLabel.text = "Name: \(newName)"
        }
        if let newBirthday = storedBirthday as? String {
            birthdayLabel.text = "Birthday: \(newBirthday)"
        }
        
        
    }

    @IBAction func saveClicked(_ sender: Any) {
        
        nameLabel.text = "Name: \(nameTextfield.text!)"
        birthdayLabel.text = "Birthday: \(birthdayTextfield.text!)"
        
        UserDefaults.standard.set(nameTextfield.text, forKey: "name")
        UserDefaults.standard.set(birthdayTextfield.text, forKey: "birthday")
        
        
    }
    
    
    @IBAction func deleteClicked(_ sender: Any) {
        
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
        
        if (storedName as? String) != nil {
            UserDefaults.standard.removeObject(forKey: "name")
            nameLabel.text = "Name:"
        }
        if (storedBirthday as? String) != nil {
            UserDefaults.standard.removeObject(forKey: "birthday")
            birthdayLabel.text = "Birthday:"
        }
        //ya da yukarıdaki gibi bu şekilde de yazabilirdik:
        
        /*if let newName = storedName as? String {
            UserDefaults.standard.removeObject(forKey: "name")
            nameLabel.text = "Name:"
        }
        if let newBirthday = storedBirthday as? String {
            UserDefaults.standard.removeObject(forKey: "birthday")
            birthdayLabel.text = "Birthday:"
        } */
    }
    
}

