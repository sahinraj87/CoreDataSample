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
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    let context = ((UIApplication.shared.delegate) as! AppDelegate).persistentContainer.viewContext
    var localCustomerData: [CustomerInfo]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchDataFromCoreData()
        // Do any additional setup after loading the view.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
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
    
}
