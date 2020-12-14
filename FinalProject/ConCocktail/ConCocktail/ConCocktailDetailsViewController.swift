//
//  ConCocktailDetailsViewController.swift
//  ConCocktail
//
//  Created by Tanner Halcumb on 12/10/20.
//

import UIKit
import Foundation
import Alamofire
import AlamofireImage

class ConCocktailDetailsViewController: ViewController {


    @IBOutlet weak var DrinkImageView: UIImageView!
    
    @IBOutlet weak var DrinkNameLabel: UILabel!
    
    @IBOutlet weak var DrinkGlassLabel: UILabel!
    
    @IBOutlet weak var DrinkIBALabel: UILabel!
    
    @IBOutlet weak var DrinkCatLabel: UILabel!
    
    @IBOutlet weak var DrinkIngredientsView: UITextView!
    
    @IBOutlet weak var DrinkInstructionsView: UITextView!
    
    var drinkId = ""
    

    override func viewDidLoad()
    {
        super.viewDidLoad()

        let drinkInt = Int(drinkId)!
        populateDrinkDetails(id: drinkInt)
    }
    
    func populateDrinkDetails(id:Int) {
        print(id)
        let headers: HTTPHeaders = [
            "x-rapidapi-key": "0fefec73bamsh9979111e54ab2aap184d0fjsn708a80d0985f",
            "x-rapidapi-host": "the-cocktail-db.p.rapidapi.com",
        ]
        let parameters: Parameters = [
            "i" : id
        ]
        
        let queryString: String = "https://the-cocktail-db.p.rapidapi.com/lookup.php"
       
        AF.request(queryString, parameters: parameters, headers: headers)
          .responseJSON { response in
            
            if let randomCocktailJSON = response.value {
                let cocktailObject:Dictionary = randomCocktailJSON as! Dictionary<String, Any>

                let drink = cocktailObject["drinks"] as! [[String:Any]]
                
                let drinkValue = drink[0]
                let drinkName: String = drinkValue["strDrink"] as! String
                
                let drinkThumbStr: String = drinkValue["strDrinkThumb"] as! String
                
                if(self.DrinkNameLabel.text == "...") {
                    self.DrinkNameLabel.text = (drinkName)
                }
                
                if let drinkGlass = (drinkValue["strGlass"] as? String)
                {
                    if(self.DrinkGlassLabel.text == "...") {
                        let phrase = ("Glass: " + drinkGlass)
                        self.DrinkGlassLabel.text = phrase
                    }
                }
                else
                {
                    self.DrinkIBALabel.text = "Glass: \tNone"
                }
                
                if let drinkIBA = (drinkValue["strIBA"] as? String)
                {
                    if(self.DrinkIBALabel.text == "...") {
                        let phrase = ("IBA: " + drinkIBA)
                        self.DrinkIBALabel.text = phrase
                    }
                }
                else
                {
                    self.DrinkIBALabel.text = "IBA: \tNone"
                }
                
                if let drinkCat = (drinkValue["strCategory"] as? String)
                {
                    if(self.DrinkCatLabel.text == "...") {
                        let phrase = ("Category: " + drinkCat)
                        self.DrinkCatLabel.text = phrase
                    }
                }
                else
                {
                    self.DrinkCatLabel.text = "Category:\tNone"
                }
                
                var phrase = ("Ingredients: ")
                
                if let drinkIngred1 = (drinkValue["strIngredient1"] as? String)
                {
                    phrase = phrase + drinkIngred1
                    self.DrinkIngredientsView.text = phrase
                }
                if let drinkIngred2 = (drinkValue["strIngredient2"] as? String)
                {
                    phrase = phrase + ", " + drinkIngred2
                    self.DrinkIngredientsView.text = phrase
                }
                if let drinkIngred3 = (drinkValue["strIngredient3"] as? String)
                {
                    phrase = phrase + ", " + drinkIngred3
                    self.DrinkIngredientsView.text = phrase
                }
                if let drinkIngred4 = (drinkValue["strIngredient4"] as? String)
                {
                    phrase = phrase + ", " + drinkIngred4
                    self.DrinkIngredientsView.text = phrase
                }
                if let drinkIngred5 = (drinkValue["strIngredient5"] as? String)
                {
                    phrase = phrase + ", " + drinkIngred5
                    self.DrinkIngredientsView.text = phrase
                }
                if let drinkIngred6 = (drinkValue["strIngredient6"] as? String)
                {
                    phrase = phrase + ", " + drinkIngred6
                    self.DrinkIngredientsView.text = phrase
                }
                if let drinkIngred7 = (drinkValue["strIngredient7"] as? String)
                {
                    phrase = phrase + ", " + drinkIngred7
                    self.DrinkIngredientsView.text = phrase
                }
                if let drinkIngred8 = (drinkValue["strIngredient8"] as? String)
                {
                    phrase = phrase + ", " + drinkIngred8
                    self.DrinkIngredientsView.text = phrase
                }
                if let drinkIngred9 = (drinkValue["strIngredient9"] as? String)
                {
                    phrase = phrase + ", " + drinkIngred9
                    self.DrinkIngredientsView.text = phrase
                }
                if let drinkIngred10 = (drinkValue["strIngredient10"] as? String)
                {
                    print(drinkIngred10)
                    phrase = phrase + ", " + drinkIngred10
                    self.DrinkIngredientsView.text = phrase
                }

                
                if let drinkInstr = (drinkValue["strInstructions"] as? String)
                {
                    if(self.DrinkInstructionsView.text == "...") {
                        let phrase = ("Instructions: " + drinkInstr)
                        self.DrinkInstructionsView.text = phrase
                    }
                }
                else
                {
                    self.DrinkCatLabel.text = "Instructions:\tNone"
                }
               
                
                AF.request(drinkThumbStr, method: .get).response { response in
                                    guard let image = UIImage(data:response.data!) else {
                                        // Handle error
                                        return
                                    }
                    let imageData = image.jpegData(compressionQuality: 1.0)
                    self.DrinkImageView.image = UIImage(data : imageData!)
                                }
            }
    }
}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
