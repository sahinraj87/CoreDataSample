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
    
    let context = ((UIApplication.shared.delegate) as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
       
    }
    
    
}

