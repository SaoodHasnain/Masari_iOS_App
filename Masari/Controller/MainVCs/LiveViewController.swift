//
//  LiveViewController.swift
//  Masari
//
//  Created by Hamza Shahbaz on 01/04/2021.
//

import UIKit
import SDWebImage


class LiveViewController: UIViewController {
    
    //MARK:- Properties
    
    @IBOutlet weak var sportTableView: UITableView!
    @IBOutlet weak var noDataSatck: UIStackView!
    var liveMatch: FootballModel?
    
    //MARK:- Controller Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ConfigureCell(tableView: sportTableView, collectionView: nil, nibName: "FootballCell", reuseIdentifier: "FootballCell", cellType: .tblView)
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getFootBallLiveMAtch()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        noDataSatck.isHidden = true
    }
    
  
    //MARK:- Supporting Functions
    
    func getFootBallLiveMAtch(){
        showLoader()
        SportsManager.instance.getFootballSports { [weak self](success, liveMatch, error) in
            if success {
                self?.hideLoader()
                if liveMatch?.response?.count == 0 {
                    self?.noDataSatck.isHidden = false
                }
                else
                {
                    self?.liveMatch = liveMatch
                    self?.noDataSatck.isHidden = true
                    DispatchQueue.main.async {
                        self?.sportTableView.reloadData()
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


extension LiveViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return liveMatch?.response?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FootballCell", for: indexPath) as! FootballCell
        let data = liveMatch?.response
        cell.LblTeam1.text = data?[indexPath.row].teams?.home?.name
        cell.LblTeam2.text = data?[indexPath.row].teams?.away?.name
        cell.lblScore.text  = "\(data?[indexPath.row].goals?.home ?? 0):\(data?[indexPath.row].goals?.away ?? 0)"
        cell.lblRemainingTime.text = "\(data?[indexPath.row].fixture?.status?.long ?? "")\n \(data?[indexPath.row].fixture?.status?.elapsed ?? 0)"
        cell.team1ImgView.sd_setImage(with: URL(string: data?[indexPath.row].teams?.home?.logo ?? ""), placeholderImage: placeHolderLeage, options: .forceTransition, context: nil)
        cell.team2ImgView.sd_setImage(with: URL(string: data?[indexPath.row].teams?.away?.logo ?? ""), placeholderImage: placeHolderLeage, options: .forceTransition, context: nil)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 212
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller: LiveMatchDetailViewController = LiveMatchDetailViewController.initiateFrom(Storybaord: .Main)
        if liveMatch?.response?.count ?? 0 > 0 {
            controller.selectedMatch = liveMatch?.response?[indexPath.row]
        }
        self.pushController(contorller: controller, animated: true)
    }
}
