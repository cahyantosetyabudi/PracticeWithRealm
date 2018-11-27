//
//  ViewController.swift
//  PracticeWithRealm
//
//  Created by Cahyanto Setya Budi on 11/27/18.
//  Copyright © 2018 Cahyanto Setya Budi. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var petOwnerLabel: UITextField!
    @IBOutlet weak var petNameField: UITextField!
    @IBOutlet weak var petTypeField: UITextField!
    @IBOutlet weak var petNameLabel: UILabel!
    @IBOutlet weak var petTypeLabel: UILabel!
    @IBOutlet weak var nameOwnerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func buttonSaveTapped(_ sender: UIButton) {
        let petName = petNameField.text
        let petOwner = petOwnerLabel.text
        let petType = petTypeField.text
        createPet(petName!, petType!, petOwner!)
    }
    
    func createPet(_ petName: String, _ petType: String, _ owner: String) {
        let pet = Pet()
        pet.petName = petName
        pet.petType = petType
        
        let user = User()
        user.name = owner
        user.pet = pet
        
        let realm = try! Realm()
        try! realm.write {
            realm.add(user)
        }
        
        let users = realm.objects(User.self)
        petNameLabel.text = users.last?.pet?.petName
        petTypeLabel.text = users.last?.pet?.petType
        nameOwnerLabel.text = users.last?.name
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

