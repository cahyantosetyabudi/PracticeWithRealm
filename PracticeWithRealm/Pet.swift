//
//  Pet.swift
//  PracticeWithRealm
//
//  Created by Cahyanto Setya Budi on 11/27/18.
//  Copyright © 2018 Cahyanto Setya Budi. All rights reserved.
//

import Foundation
import RealmSwift

class User: Object {
    @objc dynamic var name = ""
    @objc dynamic var pet: Pet?
}

class Pet: Object {
    @objc dynamic var petName = ""
    @objc dynamic var petType = ""
}
