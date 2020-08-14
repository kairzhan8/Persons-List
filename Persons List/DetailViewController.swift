//
//  DetailViewController.swift
//  Persons List
//
//  Created by Kairzhan Kural on 8/14/20.
//  Copyright © 2020 Kairzhan Kural. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var nameSurname: UILabel!
    @IBOutlet var email: UILabel!
    @IBOutlet var phone: UILabel!
    
    var person: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        email.text = person.email
        phone.text = person.phone
        nameSurname.text = "\(person.name) \(person.surname)"
    }

}
