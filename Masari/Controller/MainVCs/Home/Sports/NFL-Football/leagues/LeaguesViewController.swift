//
//  LeaguesViewController.swift
//  Masari
//
//  Created by Hamza Shahbaz on 22/04/2021.
//

import UIKit
import SDWebImage

class LeaguesViewController: UIViewController, UISearchBarDelegate{
    
    //MARK:- Properties
    
    @IBOutlet weak var leaguesTblVIew: UITableView!
    @IBOutlet weak var lblLeaguesTitle: UILabel!
    @IBOutlet weak var noDataSatck: UIStackView!
    @IBOutlet var searchBar:UISearchBar!
    
    var leaguesArr: LeaguesModel?
    var sportsTitle: String?
    var filteredData = [Response]()
    
    //MARK:- Controller Life Cycle
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblLeaguesTitle.text = "\(sportsTitle ?? "")"
        ConfigureCell(tableView: leaguesTblVIew, collectionView: nil, nibName: "BetsCell", reuseIdentifier: "BetsCell", cellType: .tblView)
        getAllleagues()
        searchBar.delegate = self
        
        
    }
    
    
    //MARK:- Supporting Functions
    
    func getAllleagues(){
        showLoader()
        FootballManager.instance.getFootBallLeagues { [weak self](success, league, error) in
            if success {
                self?.hideLoader()
                if league?.response?.count == 0 {
                    self?.noDataSatck.isHidden = false
                    
                }
                else
                {
                    self?.noDataSatck.isHidden = false
                    self?.leaguesArr = league
                    self?.filteredData = (league?.response)!
                    
                    DispatchQueue.main.async {
                        self?.leaguesTblVIew.reloadData()
                    }
                }
            }
            else
            {
                self?.hideLoader()
                Alert.showMsg(msg: error?.localizedDescription ?? "")
            }
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let searchString = searchText.trimWhiteSpace()
        if searchString != "", searchString.count > 0 {
            filteredData = (leaguesArr?.response)!.filter {
                return $0.league?.name!.range(of: searchString, options: .caseInsensitive) != nil
            }
            leaguesTblVIew.reloadData()
        }
        
    }
    
    //MARK:- Actions
    
    
    @IBAction func btnBackTapped(_ sender: Any) {
        self.popViewController()
    }
    
    
}


extension LeaguesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BetsCell", for: indexPath) as! BetsCell
        let data = filteredData[indexPath.row].league
        cell.amountView.isHidden = true
        cell.lblTitle.text = data?.name
        cell.imgView.sd_setImage(with: URL(string: data?.logo ?? ""), placeholderImage: placeHolderLeage, options: .forceTransition, context: nil)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}


