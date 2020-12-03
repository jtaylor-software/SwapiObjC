//
//  JATPersonViewController.swift
//  SwapiObjc
//
//  Created by Jeremy Taylor on 12/3/20.
//

import UIKit

class JATPersonViewController: UIViewController {
    
    var person: JATPerson?
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var birthYearLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchBar.delegate = self
        fetchPerson(searchTerm: "Luke")
    }
    
    func fetchPerson(searchTerm: String) {
        JATPersonController.fetchPerson(forSearchTerm: searchTerm) { (person) in
            DispatchQueue.main.async {
                self.person = person
                self.updateViews()
                
            }
        }
    }
    
    func updateViews() {
        guard let person = person else { return }
        
        nameLabel.text = person.name
        birthYearLabel.text = person.birthYear
        genderLabel.text = person.gender
    }

}

extension JATPersonViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.fetchPerson(searchTerm: searchText)
    }
}
