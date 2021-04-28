//
//  ApiManager.swift
//  Sculpt
//
//  Created by Hamza Shahbaz on 04/02/2021.
//

import UIKit
import Alamofire

class SportsManager {
    
    static let instance = SportsManager()
    
    func getFootballSports(completion: @escaping (_ success: Bool, _ liveMacth: FootballModel?, _ error: Error?) ->()){
        
   
        APIHelper.sharedIntance.sendGetRequest(url: "https://api-football-v1.p.rapidapi.com/v3/fixtures?live=all", headers: headers, params: nil) { (respone) in
            if respone.error == nil {
                
                do{
                    let json = try! JSONSerialization.jsonObject(with: respone.data!) as! Dictionary<String,AnyObject>
                    print(json)
                    let decoder = JSONDecoder()
                    let data = try decoder.decode(FootballModel.self, from: respone.data!)
                    completion(true, data,nil)

                }
                catch let decodingError
                {
                    completion(false, nil,decodingError)
                    print(decodingError)
                }
            }
            else
            {
                completion(false, nil,respone.error)
                print("No data found")
            }
        }
    }
    
    func getFootballUpcomingSports(completion: @escaping (_ success: Bool, _ liveMacth: FootballModel?, _ error: Error?) ->()){
        
   
        APIHelper.sharedIntance.sendGetRequest(url: "https://api-football-v1.p.rapidapi.com/v3/fixtures?next=20", headers: headers, params: nil) { (respone) in
            if respone.error == nil {
                
                do{
                    let json = try! JSONSerialization.jsonObject(with: respone.data!) as! Dictionary<String,AnyObject>
                    print(json)
                    let decoder = JSONDecoder()
                    let data = try decoder.decode(FootballModel.self, from: respone.data!)
                    completion(true, data,nil)

                }
                catch let decodingError
                {
                    completion(false, nil,decodingError)
                    print(decodingError)
                }
            }
            else
            {
                completion(false, nil,respone.error)
                print("No data found")
            }
        }
    }
    
    func getFootBallLeagues(completion: @escaping (_ success: Bool, _ leagues: LeaguesModel?, _ error: Error?) ->()){
        
        APIHelper.sharedIntance.sendGetRequest(url: "https://api-football-v1.p.rapidapi.com/v3/leagues?current=true&season=\(getCurrentYear())", headers: headers, params: nil) { (respone) in
            if respone.error == nil {
                
                do{
                    let json = try! JSONSerialization.jsonObject(with: respone.data!) as! Dictionary<String,AnyObject>
                    print(json)
                    let decoder = JSONDecoder()
                    let data = try decoder.decode(LeaguesModel.self, from: respone.data!)
                    completion(true, data,nil)

                }
                catch let decodingError
                {
                    completion(false, nil,decodingError)
                    print(decodingError)
                }
            }
            else
            {
                completion(false, nil,respone.error)
                print("No data found")
            }
        }
    }

    func getliveMatchDetail(fixtureId: Int, completion: @escaping (_ success: Bool, _ detail: LeaguesModel?, _ error: Error?) ->()){
        
        APIHelper.sharedIntance.sendGetRequest(url: "https://api-football-v1.p.rapidapi.com/v3/fixtures?id=\(fixtureId)", headers: headers, params: nil) { (respone) in
            if respone.error == nil {
                
                let json = try! JSONSerialization.jsonObject(with: respone.data!) as! Dictionary<String,AnyObject>
                print(json)

//                do{
//                    let decoder = JSONDecoder()
//                    let data = try decoder.decode(LeaguesModel.self, from: respone.data!)
//                    print(json)
//                    completion(true, data,nil)
//
//                }
//                catch let decodingError
//                {
//                    completion(false, nil,decodingError)
//                    print(decodingError)
//                }
//            }
            }
            else
            {
                completion(false, nil,respone.error)
                print("No data found")
            }
        }
    }
    
}
