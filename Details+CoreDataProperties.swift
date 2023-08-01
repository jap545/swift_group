//
//  Details+CoreDataProperties.swift
//  MenuTable
//
//  Created by Ravneesh Singh Matharu on 2023-07-29.
//
//

import Foundation
import CoreData


extension Details {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Details> {
        return NSFetchRequest<Details>(entityName: "Details")
    }
    
    class func deleteAll(in managedObjectContext: NSManagedObjectContext) throws{
        
        var details: [Details];
        
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest<NSFetchRequestResult>(entityName: "Details");
        
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest);
        
        try managedObjectContext.execute(deleteRequest)
    }
    
    class func fetchAll(in managedObjectContext: NSManagedObjectContext) throws -> [Details] {
        
        var details: [Details];
        
        let request: NSFetchRequest<Details> = Details.fetchRequest()
        
        details =  try managedObjectContext.fetch(fetchRequest());
        
        return details;
        
        
    }

    @NSManaged public var dataName: String?
    @NSManaged public var dataDescription: String?
    @NSManaged public var dataQuantity: Int16
    @NSManaged public var dataPrice: String?
    

}

extension Details : Identifiable {

}
