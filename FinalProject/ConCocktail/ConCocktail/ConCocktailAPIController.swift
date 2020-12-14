//
//  ConCocktailAPIController.swift
//  ConCocktail
//
//  Created by Tanner Halcumb on 12/13/20.
//

import UIKit
import Foundation
import Alamofire

class ConCocktailAPIController: NSObject {

    
    func searchDrinkByIngredient( ingredient:String) {
        
        let headers: HTTPHeaders = [
            "x-rapidapi-key": "0fefec73bamsh9979111e54ab2aap184d0fjsn708a80d0985f",
            "x-rapidapi-host": "the-cocktail-db.p.rapidapi.com",
        ]
        let parameters: Parameters = [
            "i" : ingredient
        ]
        
        let queryString: String = "https://the-cocktail-db.p.rapidapi.com/filter.php"
       
        AF.request(queryString, parameters: parameters, headers: headers)
          .responseJSON { response in
            
            if let randomCocktailJSON = response.value {
                let cocktailObject:Dictionary = randomCocktailJSON as! Dictionary<String, Any>

                let drink = cocktailObject["drinks"] as! [[String:Any]]
                
                let drinkValue = drink[0]
                let drinkName: String = drinkValue["strDrink"] as! String
                print(drinkName)
        
    }
}
    }
}
