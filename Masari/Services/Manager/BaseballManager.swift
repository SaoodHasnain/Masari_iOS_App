//
//  BaseBallManager.swift
//  Masari
//
//  Created by Hamza Shahbaz on 30/04/2021.
//

import Foundation


class BaseballManager {
    
    static let instance = BaseballManager()
    
    //MARK:- Baseball get matches by the current day
    
    func getBaseBallMatchesByDay(completion: @escaping (_ success: Bool, _ baseBall: BaseBallModel?, _ error: Error?) ->()){
        
        APIHelper.sharedIntance.sendGetRequest(url: "https://api-baseball.p.rapidapi.com/games?date=\(currentdateToaddOnday())", headers: baseBallHeaders, params: nil) { (respone) in
            if respone.error == nil {
                
                let json = try! JSONSerialization.jsonObject(with: respone.data!) as! Dictionary<String,AnyObject>
                do{
                    let decoder = JSONDecoder()
                    let data = try decoder.decode(BaseBallModel.self, from: respone.data!)
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

    //MARK:- baseball get today match
    
    func getBaseballTodayMatch(completion: @escaping (_ success: Bool, _ baseBall: BaseBallModel?, _ error: Error?) ->()){
        
        APIHelper.sharedIntance.sendGetRequest(url: "https://api-baseball.p.rapidapi.com/games?date=\(getCurrentDate())", headers: baseBallHeaders, params: nil) { (respone) in
            if respone.error == nil {
                
                let json = try! JSONSerialization.jsonObject(with: respone.data!) as! Dictionary<String,AnyObject>
                do{
                    let decoder = JSONDecoder()
                    let data = try decoder.decode(BaseBallModel.self, from: respone.data!)
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
