//
//  BaseketballDetailVC.swift
//  Masari
//
//  Created by Hamza Shahbaz on 04/05/2021.
//

import UIKit

class HockeyMatchDetailVC: UIViewController {
    
    //MARK:- Properties
    
    @IBOutlet weak var team1ImgView: UIImageView!
    @IBOutlet weak var team2ImgView: UIImageView!
    @IBOutlet weak var LblTeam1: UILabel!
    @IBOutlet weak var LblTeam2: UILabel!
    @IBOutlet weak var lblEvent: UILabel!
    @IBOutlet weak var lblRemainingTime: UILabel!
    @IBOutlet weak var lblScore: UILabel!
    @IBOutlet weak var BetTableView: UITableView!
    
    var selectedMatch: HResponse?
    
    
    //MARK:- Controller Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ConfigureCell(tableView: BetTableView, collectionView: nil, nibName: "BetsCell", reuseIdentifier: "BetsCell", cellType: .tblView)
        setMatchDetail()
    }
    
    //MARK:- Supporting Functions
    
    func setMatchDetail(){
        
        LblTeam1.text = selectedMatch?.teams?.home?.name
        LblTeam2.text = selectedMatch?.teams?.away?.name
//        lblScore.text  = "\(selectedMatch?.goals?.home ?? 0):\(selectedMatch?.goals?.away ?? 0)"
        lblRemainingTime.text = "\(selectedMatch?.date?.prefix(10) ?? "") \n \(selectedMatch?.time ?? "")"
        team1ImgView.sd_setImage(with: URL(string: selectedMatch?.teams?.home?.logo ?? ""), placeholderImage: placeHolderLeage, options: .forceTransition, context: nil)
        team2ImgView.sd_setImage(with: URL(string: selectedMatch?.teams?.away?.logo ?? ""), placeholderImage: placeHolderLeage, options: .forceTransition, context: nil)
     
    }
    
    
    
    //MARK:- Actions
    
    @IBAction func btnBackTapped(_ sender: Any){
        self.popViewController()
    }
    
    @IBAction func btnBetNowTapped(_ sender: Any){
//        let controller: PlayerDetailViewController = PlayerDetailViewController.initiateFrom(Storybaord: .Main)
//        controller.selectedMatch = selectedMatch
//        self.pushController(contorller: controller, animated: true)
    }
}

extension HockeyMatchDetailVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BetsCell", for: indexPath) as! BetsCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}
