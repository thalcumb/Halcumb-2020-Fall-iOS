//
//  BreakListViewController.swift
//  BathroomBreak
//
//  Created by Tanner Halcumb on 12/2/20.
//

import UIKit
import CoreData

class BreakListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return BathroomBreakController.breakList().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BreakCell")
        
        let currentBreak = BathroomBreakController.breakList()[indexPath.row]
        cell?.textLabel?.text = currentBreak.breakName! + ": " + currentBreak.breakDescription!
        
        return cell!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        LocationController.startGPS()
        
        NotificationCenter.default.addObserver(self, selector: #selector(breakWasUpdated(notification:)), name: NSNotification.Name("New_Break"), object: nil)
        
        BathroomBreakController.fetchData()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    @objc
    func breakWasUpdated(notification:Notification) {
        tableView.reloadData()
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
