//
//  ConCocktailSearchViewController.swift
//  ConCocktail
//
//  Created by Tanner Halcumb on 12/10/20.
//

import UIKit
import Foundation
import Alamofire

class ConCocktailSearchViewController: ViewController, UITableViewDelegate, UITableViewDataSource {

    

    @IBOutlet weak var UserQueryInput: UISearchBar!

    @IBOutlet weak var tableView: UITableView!
    
    var drinkResults = [] as [String]
    var drinkIDs = [] as [String]
    
    var selectedDrink: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "customcell")

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            tableView.reloadData()
        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return drinkResults.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customcell", for: indexPath)
            cell.textLabel?.text = drinkResults[indexPath.item]
            return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedDrink = drinkIDs[indexPath.row]
        print(selectedDrink!)
        
        
        if let newViewController = storyboard?.instantiateViewController(identifier: "ConCocktailDetails") as? ConCocktailDetailsViewController {
            newViewController.drinkId = selectedDrink
            self.present(newViewController, animated: true, completion: nil)
        }

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is ConCocktailDetailsViewController
        {
            let vc = segue.destination as? ConCocktailDetailsViewController
            vc?.drinkId = selectedDrink
        }
    }

    
    
    @IBAction func NavBackToRandomPage(_ sender: Any) {
                self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func InputUserSearchButton(_ sender: Any) {
        let userQuery = UserQueryInput.text!
        
        searchDrinkByIngredient(ingredient: userQuery)
        
    }
    
    
    
    func searchDrinkByIngredient( ingredient:String) {
        
        let headers: HTTPHeaders = [
            "x-rapidapi-key": "0fefec73bamsh9979111e54ab2aap184d0fjsn708a80d0985f",
            "x-rapidapi-host": "the-cocktail-db.p.rapidapi.com",
        ]
        let parameters: Parameters = [
            "i" : ingredient
        ]
        
        let queryString: String = "https://the-cocktail-db.p.rapidapi.com/filter.php"
       
        drinkResults.removeAll()
        drinkIDs.removeAll()
        
        if !ingredient.isEmpty {
            AF.request(queryString, parameters: parameters, headers: headers)
              .responseJSON { response in
                
                if let randomCocktailJSON = response.value {
                    let cocktailObject:Dictionary = randomCocktailJSON as! Dictionary<String, Any>
                    
                    if let drink = cocktailObject["drinks"] as? [[String:Any]] {
                        for cocktail in drink {
                            let drinkName: String = cocktail["strDrink"] as! String
                            print(drinkName)
                            self.drinkResults.append(drinkName)
                            let drinkIDstr: String = cocktail["idDrink"] as! String
//                            let drinkInt = Int(drinkIDstr)!
                            self.drinkIDs.append(drinkIDstr)
//                            print(drinkInt)
                        }
                        self.tableView.reloadData()
                    }
                }
            }
        }
        else{
            print("Empty Search")
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
