//
//  UpcomingViewController.swift
//  Masari
//
//  Created by Hamza Shahbaz on 01/04/2021.
//

import UIKit

class UpcomingViewController: UIViewController {
    
    @IBOutlet weak var upcomingTableView: UITableView!
    @IBOutlet weak var noDataSatck: UIStackView!

    var upComing: FootballModel?

    
    //MARK:- Controller Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ConfigureCell(tableView: upcomingTableView, collectionView: nil, nibName: "FootballCell", reuseIdentifier: "FootballCell", cellType: .tblView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getFootBallUpcoming()
    }
    
    //MARK:- Supporting Functions
    
    func getFootBallUpcoming(){
        showLoader()
        SportsManager.instance.getFootballUpcomingSports { [weak self](success, liveMatch, error) in
            if success {
                self?.hideLoader()
                if liveMatch?.response?.count == 0 {
                    self?.noDataSatck.isHidden = false
                }
                else
                {
                    self?.upComing = liveMatch
                    self?.noDataSatck.isHidden = true
                    DispatchQueue.main.async {
                        self?.upcomingTableView.reloadData()
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
    
    
    //MARK:- Actions
    
    
}

extension UpcomingViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return upComing?.response?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FootballCell", for: indexPath) as! FootballCell
        let data = upComing?.response
        let timeStamp = data?[indexPath.row].fixture?.timestamp
        cell.lblRemainingTime.text = getdatefromUNixTimes(time: timeStamp ?? 0)
        cell.betNowHeight.constant = 0
        cell.btnBetNow.isHidden = true
        cell.LblTeam1.text = data?[indexPath.row].teams?.home?.name
        cell.LblTeam2.text = data?[indexPath.row].teams?.away?.name
        cell.team1ImgView.sd_setImage(with: URL(string: data?[indexPath.row].teams?.home?.logo ?? ""), placeholderImage: placeHolderLeage, options: .forceTransition, context: nil)
        cell.team2ImgView.sd_setImage(with: URL(string: data?[indexPath.row].teams?.away?.logo ?? ""), placeholderImage: placeHolderLeage, options: .forceTransition, context: nil)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 168
    }
}
