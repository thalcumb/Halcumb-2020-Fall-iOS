//
//  FavoritesViewController.swift
//  ConCocktail
//
//  Created by Tanner Halcumb on 12/14/20.
//

import UIKit

class FavoritesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var FavoritesTableView: UITableView!
    
    
    var selectedDrink: ConCocktail!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        FavoritesTableView.delegate = self
        FavoritesTableView.dataSource = self
        FavoritesTableView.register(UITableViewCell.self, forCellReuseIdentifier: "customcell")
        
        ConCocktailFavoritesController.fetchData()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            FavoritesTableView.reloadData()
        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return ConCocktailFavoritesController.ConCocktails().count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customcell")
        
        let currentDrink = ConCocktailFavoritesController.ConCocktails()[indexPath.row]
        cell?.textLabel?.text = currentDrink.drinkName
        
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedDrink = ConCocktailFavoritesController.ConCocktails()[indexPath.row]
        print(selectedDrink.drinkName!)
        
        if let newViewController = storyboard?.instantiateViewController(identifier: "ConCocktailDetails") as? ConCocktailDetailsViewController {
            newViewController.drinkId = "\(selectedDrink.drinkID)"
            self.present(newViewController, animated: true, completion: nil)
        }

    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            ConCocktailFavoritesController.removeDrink(index: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)

        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is ConCocktailDetailsViewController
        {
            let vc = segue.destination as? ConCocktailDetailsViewController
            vc?.drinkId = "\(selectedDrink.drinkID)"
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
