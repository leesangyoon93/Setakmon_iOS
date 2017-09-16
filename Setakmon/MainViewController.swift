//
//  MainViewController.swift
//  Setakmon
//
//  Created by 이상윤 on 2017. 8. 13..
//  Copyright © 2017년 이상윤. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, WasherUpdateDeleagte {

    var washers = [Washer]()
    let model =  WasherRoomModel()
    
    @IBOutlet weak var mainInfoLabel: UILabel!
    @IBOutlet weak var washerTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        washerTableView.delegate = self
        washerTableView.dataSource = self
        
        model.washerUpdateDelegate = self
        model.updateWasher()
        
        setUI()
    }
    
    func setUI() {
        self.navigationItem.title = "세탁몬"
    }
    
    func update(_ washers: [Washer]) {
        self.washers = washers
        sortWashers()
        washerTableView.reloadData()
    }
    
    @IBAction func washerRoomInfoTouched(_ sender: Any) {
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    // MARK: - Table view data source
    
    func numberOfSections(in tableView:UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return washers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = washerTableView.dequeueReusableCell(withIdentifier: "WasherCell", for: indexPath) as! MainTableViewCell
        
        cell.idLabel.text = "\(washers[indexPath.row].id)"
        cell.runningTimeLabel.text = "\(washers[indexPath.row].runningTime)"
        
        cell.favoriteButton.layer.cornerRadius = cell.favoriteButton.frame.width / 2.0
        cell.favoriteButton.layer.masksToBounds = true
        cell.favoriteButton.tag = indexPath.row
        cell.favoriteButton.addTarget(self, action: #selector(favorateToggleTouched), for: .touchUpInside)
        
        if washers[indexPath.row].isFavorate {
            cell.favoriteButton.setImage(#imageLiteral(resourceName: "star_active"), for: UIControlState())
        } else {
            cell.favoriteButton.setImage(#imageLiteral(resourceName: "star_not_active"), for: UIControlState())
        }
        
        return cell
    }
    
    func favorateToggleTouched(sender: UIButton) {
        let value = sender.tag;
        
        let washer = washers[value]
        
        washer.setIsFavorate(isFavorate: !washer.isFavorate)
        sortWashers()
        washerTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        washerTableView.deselectRow(at: indexPath, animated: true)
    }
    
    func sortWashers() {
        washers.sort { (washer1, washer2) -> Bool in
            if washer1.isFavorate == washer2.isFavorate {
                return washer1.id < washer2.id
            } else {
                return washer1.isFavorate == true
            }
        }
    }
    
}
