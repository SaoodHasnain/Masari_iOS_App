//
//  Constants.swift
//  Waldaa
//
//  Created by Malik Javed Iqbal on 07/12/2020.
//

import UIKit
import Alamofire

let headers: HTTPHeaders = HTTPHeaders(["x-rapidapi-key": "20659b441fmshb185905e977f8a7p191811jsn2af781bf80db",
                                       "x-rapidapi-host": "api-football-v1.p.rapidapi.com"])
let baseBallHeaders: HTTPHeaders = HTTPHeaders([
    "x-rapidapi-key": "20659b441fmshb185905e977f8a7p191811jsn2af781bf80db",
    "x-rapidapi-host": "api-baseball.p.rapidapi.com"])

let placeHolderLeage = UIImage(named: "bet_icon")
let placeHolderArtistImage = UIImage(named: "2")
let menuArr = [["image": UIImage(named: "icon_user_profile")!,"name":"Profile"],["image": UIImage(named: "icon_transactions")!,"name":"Transactions"],["image": UIImage(named: "icon_settings")!,"name":"Settings"]]
let sportArray = [["name": "NBA-Basketball", "image": UIImage(named: "icon_basketball")!],["name": "MLB-Baseball", "image": UIImage(named: "icon_baseball")!],["name": "NFL-Football", "image": UIImage(named: "icon_football")!],["name": "FIFA-Soccer", "image": UIImage(named: "icon_football")!],["name": "NHL-Ice Hockey", "image": UIImage(named: "icon_hockey")!]]


enum albumType: String {
    case newAlbum = "get-new-albums"
    case allAlbum = "get-all-albums"
    case weeklyCollection = "weekly-selection"

}

func getdatefromUNixTimes(time: Double) -> String{
    let unixTimeStamp = time
    let exactDate = NSDate.init(timeIntervalSince1970: unixTimeStamp)
    let dateFormatt = DateFormatter()
    dateFormatt.dateFormat = "dd/MM/yyy hh:mm a"
    return dateFormatt.string(from: exactDate as Date)

}
