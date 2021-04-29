//
//  SportDetailViewController.swift
//  Masari
//
//  Created by Bukhari Syed Saood on 3/31/21.
//

import UIKit
import LZViewPager
class SportDetailViewController: UIViewController {


    //MARK:- Properties
    
    @IBOutlet weak var betTableView: UITableView!
    @IBOutlet weak var viewPager: LZViewPager!
    @IBOutlet weak var lbltitle: UILabel!
    private var subControllers:[UIViewController] = []

    var sportTitle: String?
    
    //MARK:- Controller Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lbltitle.text = sportTitle
        setupViewPager()
        ConfigureCell(tableView: betTableView, collectionView: nil, nibName: "BetsCell", reuseIdentifier: "BetsCell", cellType: .tblView)
        

    }
    
    //MARK:- Supporting Functions
    
    func setupViewPager(){
        viewPager.dataSource = self
        viewPager.delegate = self
        viewPager.hostController = self
    
        
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        viewPager.tintColor = #colorLiteral(red: 0.5076961517, green: 0.2106034458, blue: 0.2362745106, alpha: 1)
        let vc1 = mainStoryboard.instantiateViewController(withIdentifier: "UpcomingViewController") as! UpcomingViewController
        vc1.title = "Upcoming"
        vc1.sportType = sportTitle
        let vc2 = mainStoryboard.instantiateViewController(withIdentifier: "LiveViewController") as! LiveViewController
        vc2.title = "Live"
        vc2.sportType = sportTitle
        subControllers = [vc1, vc2]
        viewPager.reload()
    }
    
    //MARK:- Actions
    
    @IBAction func btnBackTapped(_ sender: Any){
        self.popViewController()
    }
    
    @IBAction func btnMatchesLeagueTapped(_ sender: Any){
        let controller: LeaguesViewController = LeaguesViewController.initiateFrom(Storybaord: .Main)
        self.pushController(contorller: controller, animated: true)
    }
}

extension SportDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
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
}

extension SportDetailViewController: LZViewPagerDelegate, LZViewPagerDataSource{
    func numberOfItems() -> Int {
        return self.subControllers.count
    }
    
    func controller(at index: Int) -> UIViewController {
        return subControllers[index]
    }
    
    func button(at index: Int) -> UIButton {
        //Customize your button styles here
        let button = UIButton()
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "TTCommons-Bold", size: 20)
        return button
    }
    
    
    func widthForButton(at index: Int) -> CGFloat {
        return 100.0
    }
    func colorForIndicator(at index: Int) -> UIColor {
        return #colorLiteral(red: 0.2499485314, green: 0.3317975998, blue: 0.8006594181, alpha: 1)
    }
    func widthForIndicator(at index: Int) -> CGFloat {
        return 70
    }
    func heightForIndicator() -> CGFloat {
        return 2
    }

    
}
