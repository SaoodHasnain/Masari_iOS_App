//
//  BaseballTodayMatchVC.swift
//  Masari
//
//  Created by Hamza Shahbaz on 30/04/2021.
//

import UIKit

class BaseballTodayMatchVC: UIViewController {

    //MARK:- Properties
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var noDataSatck: UIStackView!
    
    var baseBallMatch: BaseBallModel?
    

    
    //MARK:- Controller Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ConfigureCell(tableView: tableView, collectionView: nil, nibName: "BaseballCell", reuseIdentifier: "BaseballCell", cellType: .tblView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getMatch()
    }
    
    //MARK:- Supporting Functions
    
    
    func getMatch(){
        
        showLoader()
        BaseballManager.instance.getBaseballTodayMatch {[weak self] (success, baseball, error) in
            if success {
                self?.hideLoader()
                if baseball?.response?.count == 0 {
                    self?.noDataSatck.isHidden = false
                }
                else
                {
                    self?.baseBallMatch = baseball
                    self?.noDataSatck.isHidden = true
                    DispatchQueue.main.async {
                        self?.tableView.reloadData()
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

extension BaseballTodayMatchVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return baseBallMatch?.response?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BaseballCell", for: indexPath) as! BaseballCell
        let data = baseBallMatch?.response
        cell.team1ImgView.sd_setImage(with: URL(string: data?[indexPath.row].teams?.home?.logo ?? ""), placeholderImage: placeHolderLeage, options: .forceTransition, context: nil)
        cell.team2ImgView.sd_setImage(with: URL(string: data?[indexPath.row].teams?.away?.logo ?? ""), placeholderImage: placeHolderLeage, options: .forceTransition, context: nil)
        cell.lblTeam1Name.text = data?[indexPath.row].teams?.home?.name
        cell.lblTeam2Name.text = data?[indexPath.row].teams?.away?.name
        if data?[indexPath.row].status?.short == "NS" {
            cell.lblPoint.text = ""
            cell.lblday.text = "\(data?[indexPath.row].status?.long ?? "")"
            cell.lblTime.text = data?[indexPath.row].time
        }
        else
        {
            cell.lblTime.text = ""
            cell.lblday.text = "\(data?[indexPath.row].status?.long ?? "")"
            cell.lblPoint.text = "[ \(data?[indexPath.row].scores?.home?.total ?? 0) : \(data?[indexPath.row].scores?.away?.total ?? 0) ]"

        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
