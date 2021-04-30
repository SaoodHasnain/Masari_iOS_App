//
//  PlayerDetailViewController.swift
//  Masari
//
//  Created by Hamza Shahbaz on 29/04/2021.
//

import UIKit

class PlayerDetailViewController: UIViewController {
    
    //MARK:- Properties
    
    @IBOutlet weak var playerTableView: UITableView!
    @IBOutlet weak var noDataSatck: UIStackView!
    
    @IBOutlet weak var team1ImgView: UIImageView!
    @IBOutlet weak var team2ImgView: UIImageView!
    @IBOutlet weak var LblTeam1: UILabel!
    @IBOutlet weak var LblTeam2: UILabel!
    
    
    var selectedMatch: Response?
    var liveDetail: LiveMatchDetailModel?
    
    
    //MARK:- Controller Life Cycle
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getMatchDetail()
        
    }
    
    //MARK:- Supporting Functions
    
    func setMatchDetail(){
        LblTeam1.text = selectedMatch?.teams?.home?.name
        LblTeam2.text = selectedMatch?.teams?.away?.name
        team1ImgView.sd_setImage(with: URL(string: selectedMatch?.teams?.home?.logo ?? ""), placeholderImage: placeHolderLeage, options: .forceTransition, context: nil)
        team2ImgView.sd_setImage(with: URL(string: selectedMatch?.teams?.away?.logo ?? ""), placeholderImage: placeHolderLeage, options: .forceTransition, context: nil)
    }
    
    func getMatchDetail(){
        
        showLoader()
        FootballManager.instance.getliveMatchDetail(fixtureId: selectedMatch?.fixture?.id ?? 0) { [weak self](success, detail, error) in
            if success {
                self?.hideLoader()
                if detail?.response?.count  ?? 0 > 0 && detail?.response?[0].lineups?.count ?? 0 > 0 {
                    self?.setMatchDetail()
                    self?.noDataSatck.isHidden = true
                    self?.liveDetail = detail
                    self?.playerTableView.reloadData()
                }
                else
                {
                    self?.setMatchDetail()
                    self?.noDataSatck.isHidden = false
                }
            }
            else
            {
                self?.hideLoader()
                Alert.showMsg(msg: error?.localizedDescription ?? "")
            }
            
        }
        
    }
    
    //MARK:- Actions
    
    
    @IBAction func btnBackTapped(_ sender: Any){
        self.popViewController()
    }
    
}

extension PlayerDetailViewController: UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return liveDetail?.response?[0].lineups?[0].startXI?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = "\(liveDetail?.response?[0].lineups?[0].startXI?[indexPath.row].player?.name ?? "") \n \(liveDetail?.response?[0].lineups?[1].startXI?[indexPath.row].player?.name ?? "")"
        return cell
    }
}

