//
//  MenuViewController.swift
//  Masari
//
//  Created by Bukhari Syed Saood on 3/31/21.
//

import UIKit

class MenuViewController: UIViewController {
    
    //MARK:- Properties
    
    @IBOutlet weak var menuTableView: UITableView!
    
    
    //MARK:- Controller Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ConfigureCell(tableView: menuTableView, collectionView: nil, nibName: "MenuCell", reuseIdentifier: "MenuCell", cellType: .tblView)
    }
    
    //MARK:- Supporting Functions
    
    
    
    //MARK:- Actions
    
    @IBAction func btnBackTapped(_ sender: Any){
        self.popViewController()
    }
    
}

extension MenuViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuArr.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as! MenuCell
        let menu = menuArr[indexPath.row]
        cell.menuImgView.image = menu["image"] as? UIImage
        cell.menuLblText.text = menu["name"] as? String
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let controller: ProfileViewController = ProfileViewController.initiateFrom(Storybaord: .Main)
            self.pushController(contorller: controller, animated: true)
            
        }
        else if indexPath.row == 1 {
            let controller: TransactionsViewController = TransactionsViewController.initiateFrom(Storybaord: .Main)
            self.pushController(contorller: controller, animated: true)
            
        }
        else {
            let controller: SettingsViewController = SettingsViewController.initiateFrom(Storybaord: .Main)
            self.pushController(contorller: controller, animated: true)
            
        }

    }
}
