//
//  DataServices.swift
//  QuotesApp
//
//  Created by Bukhari Syed Saood on 12/22/20.
//

import UIKit
import FirebaseFirestore
import FirebaseStorage


class DataServices {
    
    static let instance = DataServices()
    let betReference = Firestore.firestore().collection("bets")

    
    func saveBets(bet:BetModel){
        betReference.document().setData([
            "betId":bet.betId,
            "userId":bet.userId,
            "gameId":bet.gameId,
            "sportId":bet.sportId,
            "matchId":bet.matchId,
            "isBetOn":bet.isBetOn,
            "time": bet.time,
            "matchName":bet.matchName,
            "points": bet.points,
            "result":bet.result
        ], merge: true) { (err) in
            if let err = err {
                debugPrint("Error adding document: \(err)")
            } else {
            }
        }
    }
    
    func getBets(handler: @escaping(_ success:Bool,_ bets: [BetModel]?)->()){
        Firestore.firestore().collection("Quotes").addSnapshotListener { (snapshot, error) in
            guard let snapshot = snapshot else {
                print("Error \(error!)")
                return
            }
            var bets:[BetModel] = []
            if snapshot.count >= 0 {
                for document in snapshot.documents {
                    let data = document.data()
                    let betId = data["betId"] as? String ?? "Not Found"
                    let userId = data["userId"] as? String ?? "Not Found"
                    let gameId = data["gameId"] as? String ?? "Not Found"
                    let sportId = data["sportId"] as? String ?? "Not Found"
                    let matchId = data["matchId"] as? String ?? "Not Found"
                    let isBetOn = data["isBetOn"] as? Bool ?? false
                    let time = data["time"] as? Double ?? 0.00
                    let matchName = data["matchName"] as? String ?? "Not Found"
                    let points = data["points"] as? Int ?? 0
                    let result = data["result"] as? Int ?? 0
                    
                    let bet = BetModel(betId: betId, userId: userId, gameId: gameId, matchId: matchId, sportId: sportId, isBetOn: isBetOn, time: time, matchName: matchName, points: points, result: result)

                    bets.append(bet)
                    handler(true,bets)
                }
            }
        }
    }
    
}
