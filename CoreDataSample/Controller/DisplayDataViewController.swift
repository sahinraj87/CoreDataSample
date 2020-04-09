//
//  DisplayDataViewController.swift
//  CoreDataSample
//
//  Created by Sahin Raj on 4/8/20.
//  Copyright © 2020 Sahin Raj. All rights reserved.
//

import UIKit
import CoreData

class DisplayDataViewController: UIViewController {
    
    public var refFromClassID = 0
    
    @IBOutlet weak var tableView: UITableView!
    
    let context = ((UIApplication.shared.delegate) as! AppDelegate).persistentContainer.viewContext
    var localCustomerData: [CustomerInfo]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchDataFromCoreData()
        // Do any additional setup after loading the view.
    }
    
    func fetchDataFromCoreData() {
        let request:NSFetchRequest<CustomerInfo> = CustomerInfo.fetchRequest()
        do {
            localCustomerData = try context.fetch(request)
        } catch {
            print("Error in fetching Request: \(error)")
        }
        tableView.reloadData()
    }
    
}

extension DisplayDataViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let data = localCustomerData {
            return data.count
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mycell", for: indexPath)
        if let data = localCustomerData {
            cell.textLabel?.text = data[indexPath.row].name
        }
        
        return cell
    }
    
    
}

extension DisplayDataViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
        switch refFromClassID {
        case 0:
            print("Do nothing!")
        case 1:
            print("Delete :\(indexPath.row)")
            deleteData(with: indexPath)
            
        default:
            print("default case")
        }
    }
    
    func deleteData(with indexPath: IndexPath) {
    
        let dialogMessage = UIAlertController(title: "Confirm", message: "Are you sure you want to delete this?", preferredStyle: .alert)
        // Create OK button with action handler
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
            print("Ok button tapped")
        })
        
        // Create Cancel button with action handlder
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) -> Void in
            print("Cancel button tapped")
        }
       
        //Add OK and Cancel button to dialog message
        dialogMessage.addAction(ok)
        dialogMessage.addAction(cancel)
        
        // Present dialog message to user
        self.present(dialogMessage, animated: true, completion: nil)
        
    }
}
