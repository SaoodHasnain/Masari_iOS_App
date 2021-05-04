//
//  SportsViewController.swift
//  Masari
//
//  Created by Bukhari Syed Saood on 3/31/21.
//

import UIKit

class SportsViewController: UIViewController {

    // MARK:- Properties
    
    @IBOutlet weak var sportTableView: UITableView!
        
    
    //MARK:- Controller Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ConfigureCell(tableView: sportTableView, collectionView: nil, nibName: "SportsCell", reuseIdentifier: "SportsCell", cellType: .tblView)
    }
    
    //MARK:- Supporting Functions
    
    
    
    //MARK:- Actions
    
    
    
}

extension SportsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sportArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SportsCell", for: indexPath) as! SportsCell
        cell.lblMatchName.text = sportArray[indexPath.row]["name"] as? String
        cell.matchImgView.image = sportArray[indexPath.row]["image"] as? UIImage
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 1 {
        let controller: MLbBaseballVC = MLbBaseballVC.initiateFrom(Storybaord: .Main)
        controller.sportTitle = sportArray[indexPath.row]["name"] as? String
        self.pushController(contorller: controller, animated: true)
        }
        else if indexPath.row == 0 {
        let controller: BasketballViewController = BasketballViewController.initiateFrom(Storybaord: .Main)
        controller.sportTitle = sportArray[indexPath.row]["name"] as? String
        self.pushController(contorller: controller, animated: true)
        }
        else if indexPath.row == 2 {
        let controller: NFLFootballDetailVC = NFLFootballDetailVC.initiateFrom(Storybaord: .Main)
        controller.sportTitle = sportArray[indexPath.row]["name"] as? String
        self.pushController(contorller: controller, animated: true)
        }
        
        else if indexPath.row == 4 {
            let controller: HockeyViewController = HockeyViewController.initiateFrom(Storybaord: .Main)
            controller.sportTitle = sportArray[indexPath.row]["name"] as? String
            self.pushController(contorller: controller, animated: true)
        }
    }
    
}
