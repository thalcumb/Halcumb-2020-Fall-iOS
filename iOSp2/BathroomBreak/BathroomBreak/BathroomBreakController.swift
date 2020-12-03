//
//  BathroomBreakController.swift
//  BathroomBreak
//
//  Created by Tanner Halcumb on 12/2/20.
//

import UIKit
import CoreData

class BathroomBreakController: NSObject {

    static var breakArray = Array<BathroomBreak>()
    
    class func fetchData() {
        let managedObjectContext = DatabaseController.getContext()
        
        let fetchRequest:NSFetchRequest = BathroomBreak.fetchRequest()
        do {
            let fetchResults = try managedObjectContext.fetch(fetchRequest)
                        
            if(fetchResults.count > 0) {
                BathroomBreakController.breakArray = fetchResults
                NotificationCenter.default.post(Notification(name: Notification.Name("New_Break")))
                
                //sort
            }
        }
        catch {
            print(exception.self)
        }
    }
    
    class func addBreak(newBathroomBreak:BathroomBreak){
        BathroomBreakController.breakArray.append(newBathroomBreak)
        DatabaseController.saveContext()
    }
    
    class func createBreak(newName: String, newDescription:String, newLongitude: Double, newLatitude: Double) {
        
        let brBreak:BathroomBreak = BathroomBreak(context: DatabaseController.getContext())
        
        brBreak.breakName = newName
        brBreak.breakDescription = newDescription
//        brBreak.breakCategory = newCategory
        
        brBreak.breakLat = newLatitude
        brBreak.breakLong = newLongitude
        
        BathroomBreakController.addBreak(newBathroomBreak: brBreak)
        
        DatabaseController.saveContext()
        
        NotificationCenter.default.post(Notification(name:Notification.Name("New_Break")))
        
    }
    
    class func breakList() -> Array<BathroomBreak> {
        return BathroomBreakController.breakArray
    }
}
