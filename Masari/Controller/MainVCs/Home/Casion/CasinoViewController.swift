//
//  CasinoViewController.swift
//  Masari
//
//  Created by Bukhari Syed Saood on 3/31/21.
//

import UIKit

class CasinoViewController: UIViewController {

    // MARK:- Properties
    
    @IBOutlet weak var casionTableView: UITableView!
    
    
    //MARK:- Controller Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ConfigureCell(tableView: casionTableView, collectionView: nil, nibName: "SportsCell", reuseIdentifier: "SportsCell", cellType: .tblView)
    }
    
    //MARK:- Supporting Functions
    
    
    
    //MARK:- Actions
    
    
}

extension CasinoViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SportsCell", for: indexPath) as! SportsCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
