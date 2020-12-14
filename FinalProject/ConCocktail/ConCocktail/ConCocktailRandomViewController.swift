//
//  ConCocktailRandomViewController.swift
//  ConCocktail
//
//  Created by Tanner Halcumb on 12/10/20.
//

import UIKit
import Foundation
import Alamofire
import AlamofireImage

class ConCocktailRandomViewController: ViewController {

    
    @IBOutlet weak var DrinkNameLabel: UILabel!
    @IBOutlet weak var DrinkImageView: UIImageView!
    
    @IBAction func NavigateToSearchButton(_ sender: Any) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "ConCocktailSearchView") as! ConCocktailSearchViewController
        newViewController.modalPresentationStyle = .fullScreen
                self.present(newViewController, animated: true, completion: nil)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is ConCocktailDetailsViewController
        {
            let vc = segue.destination as? ConCocktailDetailsViewController
            vc?.drinkId = "11007"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let headers: HTTPHeaders = [
            "x-rapidapi-key": "0fefec73bamsh9979111e54ab2aap184d0fjsn708a80d0985f",
            "x-rapidapi-host": "the-cocktail-db.p.rapidapi.com",
        ]
        let parameters: Parameters = [
            "i" : "11001"
        ]
        
        let queryString: String = "https://the-cocktail-db.p.rapidapi.com/lookup.php"
       
        AF.request(queryString, parameters: parameters, headers: headers)
          .responseJSON { response in
            
            if let randomCocktailJSON = response.value {
                let cocktailObject:Dictionary = randomCocktailJSON as! Dictionary<String, Any>

                let drink = cocktailObject["drinks"] as! [[String:Any]]
                
                let drinkValue = drink[0]
                let drinkName: String = drinkValue["strDrink"] as! String
                let phrase = "Drink of the week: \n" + drinkName
                
                let drinkThumbStr: String = drinkValue["strDrinkThumb"] as! String
                print(drinkThumbStr)
                
                print(phrase)
                if(self.DrinkNameLabel.text == "...") {
                    self.DrinkNameLabel.text = (phrase)
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
}
