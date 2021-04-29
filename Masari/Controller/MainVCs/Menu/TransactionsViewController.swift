//
//  TransactionsViewController.swift
//  Masari
//
//  Created by Bukhari Syed Saood on 3/31/21.
//

import UIKit

class TransactionsViewController: UIViewController {
    
    //MARK:- Properties
    
    @IBOutlet weak var tableView: UITableView!
    
    
    //MARK:- Controller Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ConfigureCell(tableView: tableView, collectionView: nil, nibName: "BetsCell", reuseIdentifier: "BetsCell", cellType: .tblView)
    }
    
    //MARK:- Supporting Functions
    
    
    
    //MARK:- Actions
    
    @IBAction func btnBackTapped(_ sender: Any){
        self.popViewController()
    }
    
}

extension TransactionsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 4
        }
        else if section == 1 {
            return 4
        }
        else
        {
            return 4
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BetsCell", for: indexPath) as! BetsCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .white
        
        let headerLabel = UILabel(frame: CGRect(x: 30, y: 15, width:
                                                    tableView.bounds.size.width, height: tableView.bounds.size.height))
        headerLabel.font = UIFont(name: "TTCommons-Bold", size: 20)
        headerLabel.textColor = UIColor.black
        headerLabel.text = ["Deposit","Withdrawls","Others"][section]
        headerLabel.sizeToFit()
        headerView.addSubview(headerLabel)
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
}
