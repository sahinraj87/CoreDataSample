//
//  CustomerInfo+CoreDataProperties.swift
//  CoreDataSample
//
//  Created by Sahin Raj on 4/9/20.
//  Copyright © 2020 Sahin Raj. All rights reserved.
//
//

import Foundation
import CoreData


extension CustomerInfo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CustomerInfo> {
        return NSFetchRequest<CustomerInfo>(entityName: "CustomerInfo")
    }

    @NSManaged public var address: String?
    @NSManaged public var age: Int16
    @NSManaged public var name: String?
    @NSManaged public var id: Int16

}
