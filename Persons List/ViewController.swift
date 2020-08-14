//
//  ViewController.swift
//  Persons List
//
//  Created by Kairzhan Kural on 8/11/20.
//  Copyright © 2020 Kairzhan Kural. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var persons: Set<Person> = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let names = ["Sergio", "Cristiano", "David", "Dani", "Raphael", "Leo", "Zinedine", "Duvan"]
        let surnames = ["Zapata", "Ramos", "Ronaldo", "Silva", "Varane", "Messi", "Zidane", "Alaba"]
        let emails = ["serram@mail.ru", "cr7@mail.ru", "silvas@gmail.com", "leomes@mail.com", "alabama@mail.ru", "zamara@gmail.com", "varane43@gmail.com", "levandoc45@mail.ru"]
        let phones = ["83425345", "23523656", "624547312", "352372", "634262", "623462364", "363752", "7245723471"]

        for _ in 1...8 {
            persons.insert(Person(name: names.randomElement()!, surname: surnames.randomElement()!, email: emails.randomElement()!, phone: phones.randomElement()!))
        }
        
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "person", for: indexPath)
        
        let indexedPersons = Array(persons)
        
        cell.textLabel?.text = "\(indexedPersons[indexPath.row].name) \(indexedPersons[indexPath.row].surname)"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        var indexedPersons = Array(persons)
        let currentPerson = indexedPersons.remove(at: sourceIndexPath.row)
        indexedPersons.insert(currentPerson, at: destinationIndexPath.row)
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indexedPersons = Array(persons)
        if let indexPath = tableView.indexPathForSelectedRow {
            let detailVC = segue.destination as! DetailViewController
            detailVC.person = indexedPersons[indexPath.row]
        }
    }


}

