//
//  ViewController.swift
//  CoreDataSample
//
//  Created by Sahin Raj on 4/8/20.
//  Copyright © 2020 Sahin Raj. All rights reserved.
//

import UIKit
import CoreData


class ViewController: UIViewController {
    
    @IBOutlet weak var nameTextView: UITextField!
    
    @IBOutlet weak var ageTextView: UITextField!
    
    @IBOutlet weak var addressTextView: UITextField!
    
    var clickRef = 0
    
    let context = ((UIApplication.shared.delegate) as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "FedEx Core Data"
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        clickRef = 0
    }
    
    @IBAction func saveBtnTapped(_ sender: UIButton) {
        
        if let name = nameTextView.text ,
            let age = ageTextView.text,
            let address = addressTextView.text {
            
            if name.count > 0  && age.count > 0 && address.count > 0 {
                print(name)
                print(age)
                print(address)
                
                
                let customerInfo = CustomerInfo(context: context)
                
                customerInfo.name = name
                
                if let age = Int16(age) {
                    customerInfo.age = age
                }
                customerInfo.address = address
                
                do {
                    try context.save()
                    nameTextView.text = ""
                    ageTextView.text = ""
                    addressTextView.text = ""
                    
                    print("Data saved successfully...!")
                } catch {
                    print("Error in saving data\(error)")
                }
                
            }else {
                print("Empty fields")
            }
        }
    }
    
    @IBAction func viewBtnTapped(_ sender: UIButton) {
        clickRef = 0
    }
    
    
    @IBAction func deleteBtnTapped(_ sender: UIButton) {
        clickRef = 1
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is DisplayDataViewController
        {
            let vc = segue.destination as? DisplayDataViewController
            switch clickRef {
            case 0:
                vc?.title = "View Data"
                vc?.refFromClassID = 0
            case 1:
                vc?.title = "Delete Data"
                vc?.refFromClassID = 1
            default:
                vc?.title = "View only"
            }
            
        }
    }
}

