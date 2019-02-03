//
//  EntryTableViewController.swift
//  Journal_iOS22
//
//  Created by Ivan Ramirez on 10/3/18.
//  Copyright © 2018 ramcomw. All rights reserved.
//

import UIKit

class EntryTableViewController: UITableViewController, UISearchBarDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return EntryController.shared.entries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EntryCell", for: indexPath)
        let entry = EntryController.shared.entries[indexPath.row]
        cell.textLabel?.text = entry.title
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let entry = EntryController.shared.entries[indexPath.row]
            EntryController.shared.remove(entry: entry)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC" {
            let destinationVC = segue.destination as? EntryDetailViewController
            guard let indexPath = tableView.indexPathForSelectedRow else {return}
            let entry = EntryController.shared.entries[indexPath.row]
            destinationVC?.entry = entry
        }
    }
    
    // MARK: UISearchBarDelegate
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty else {
            EntryController.shared.predicate = nil
            tableView.reloadData()
            
            return
        }
        
        let titlePredicate = NSPredicate(format: "title contains[cd] %@", argumentArray: [searchText])
        //compound predicate
        let textPredicate = NSPredicate(format: "textBody contains[cd] %@", argumentArray: [searchText])
        let predicate = NSCompoundPredicate(orPredicateWithSubpredicates: [titlePredicate, textPredicate])
        
        EntryController.shared.predicate = predicate
        
        tableView.reloadData()
    }
}

