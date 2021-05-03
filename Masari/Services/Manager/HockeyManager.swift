//
//  HockeyManager.swift
//  Masari
//
//  Created by Hamza Shahbaz on 03/05/2021.
//

import Foundation

class HockeyManager {
    
    static let instance = HockeyManager()
    
    //MARK:- Hockey get matches by the current day
    
    func getHockeyMatchesByDay(completion: @escaping (_ success: Bool, _ hockey: HockeyModel?, _ error: Error?) ->()){
        
        APIHelper.sharedIntance.sendGetRequest(url: "https://api-hockey.p.rapidapi.com/games/?date=\(currentdateToaddOnday())", headers: HockeyHeaders, params: nil) { (respone) in
            if respone.error == nil {
                
                let json = try! JSONSerialization.jsonObject(with: respone.data!) as! Dictionary<String,AnyObject>
                do{
                    let decoder = JSONDecoder()
                    let data = try decoder.decode(HockeyModel.self, from: respone.data!)
                    print(json)
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

    //MARK:- Hockey get today match
    
    func getHockeyTodayMatch(completion: @escaping (_ success: Bool, _ hockey: HockeyModel?, _ error: Error?) ->()){
        
        APIHelper.sharedIntance.sendGetRequest(url: "https://api-hockey.p.rapidapi.com/games/?date=\(getCurrentDate())", headers: HockeyHeaders, params: nil) { (respone) in
            if respone.error == nil {
                
                let json = try! JSONSerialization.jsonObject(with: respone.data!) as! Dictionary<String,AnyObject>
                do{
                    let decoder = JSONDecoder()
                    let data = try decoder.decode(HockeyModel.self, from: respone.data!)
                    print(json)
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

}
