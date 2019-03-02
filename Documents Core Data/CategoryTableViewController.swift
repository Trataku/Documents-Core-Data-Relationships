//
//  CategoryTableViewController.swift
//  Documents Core Data
//
//  Created by Dylan Mouser on 3/1/19.
//  Copyright © 2019 Dylan Mouser. All rights reserved.
//

import UIKit
import CoreData

class CategoryTableViewController: UITableViewController {
    @IBOutlet var categoriesTableView: UITableView!
    
    var categories: [Category] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<Category> = Category.fetchRequest()
        
        do {
            categories = try managedContext.fetch(fetchRequest)
            
            categoriesTableView.reloadData()
        }catch{
            print("Could not fetch categories")
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = categoriesTableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath)
        
        let category = categories[indexPath.row]
        cell.textLabel?.text = category.title
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? DocumentTableViewController,
            let selectedRow = self.categoriesTableView.indexPathForSelectedRow?.row else {
            return
        }
        
        destination.category = categories[selectedRow]
    }
}
