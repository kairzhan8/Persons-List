//
//  SectionsViewController.swift
//  Persons List
//
//  Created by Kairzhan Kural on 8/15/20.
//  Copyright © 2020 Kairzhan Kural. All rights reserved.
//

import UIKit

class SectionsViewController: UITableViewController {
    
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
        
    }
    
   

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return persons.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 2
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let indexedPersons = Array(persons)
        return "\(indexedPersons[section].name) \(indexedPersons[section].surname)"
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sectionsCell", for: indexPath)
        let indexedPersons = Array(persons)
        if indexPath.row == 0 {
            cell.textLabel?.text = indexedPersons[indexPath.section].email
        } else {
            cell.textLabel?.text = indexedPersons[indexPath.section].phone
        }
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
