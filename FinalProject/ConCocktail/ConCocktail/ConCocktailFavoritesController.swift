//
//  ConCocktailFavoritesController.swift
//  ConCocktail
//
//  Created by Tanner Halcumb on 12/14/20.
//

import UIKit
import CoreData

class ConCocktailFavoritesController: NSObject {

    static var drinkArray = Array<ConCocktail>()
    
    class func fetchData() {
        let managedObjectContext = DatabaseController.getContext()
        
        let fetchRequest:NSFetchRequest = ConCocktail.fetchRequest()
        do {
            let fetchResults = try managedObjectContext.fetch(fetchRequest)
                        
            if(fetchResults.count > 0) {
                drinkArray = fetchResults
//                NotificationCenter.default.post(Notification(name: Notification.Name("New_Break")))
                
                //sort
            }
        }
        catch {
            print(exception.self)
        }
    }
    
    class func createDrink(favID:Int, favName: String) {
        
        let drink:ConCocktail = ConCocktail(context: DatabaseController.getContext())
        
        drink.drinkID = Int16(favID)
        drink.drinkName = favName
        
        var exists = false
        for i in drinkArray {
            if i.drinkID == drink.drinkID {
                print("Already a favorite drink")
                exists = true
            }
        }
        if !exists {
            ConCocktailFavoritesController.addDrink(newDrink: drink)
        }
                



        
//        NotificationCenter.default.post(Notification(name:Notification.Name("New_Drink")))
        
    }
    
    class func addDrink(newDrink:ConCocktail){
        var exists = false
        for i in drinkArray {
            if i.drinkID == newDrink.drinkID {
                print("Already a favorite drink")
                exists = true
            }
        }
        if !exists {
            drinkArray.append(newDrink)
            DatabaseController.saveContext()
        }
    }
    
    
    class func ConCocktails() -> Array<ConCocktail> {
        return drinkArray
    }
    
    
}
