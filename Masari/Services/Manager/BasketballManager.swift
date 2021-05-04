//
//  BasketBallManager.swift
//  Masari
//
//  Created by Hamza Shahbaz on 04/05/2021.
//

import Foundation


class BasketballManager {
    
    static let instance = BasketballManager()
    
    //MARK:- Basket get matches by the current day
    
    func getBasketBallMatchesByDay(completion: @escaping (_ success: Bool, _ hockey: BasketballModel?, _ error: Error?) ->()){
        
        APIHelper.sharedIntance.sendGetRequest(url: "https://api-basketball.p.rapidapi.com/games?date=\(currentdateToaddOnday())", headers: BasketballHeader, params: nil) { (respone) in
            if respone.error == nil {
                
                let json = try! JSONSerialization.jsonObject(with: respone.data!) as! Dictionary<String,AnyObject>
                do{
                    let decoder = JSONDecoder()
                    let data = try decoder.decode(BasketballModel.self, from: respone.data!)
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

    //MARK:- Basket get today match
    
    func getBasketBallTodayMatch(completion: @escaping (_ success: Bool, _ basket: BasketballModel?, _ error: Error?) ->()){
        
        APIHelper.sharedIntance.sendGetRequest(url: "https://api-basketball.p.rapidapi.com/games?date=\(getCurrentDate())", headers: BasketballHeader, params: nil) { (respone) in
            if respone.error == nil {
                
                let json = try! JSONSerialization.jsonObject(with: respone.data!) as! Dictionary<String,AnyObject>
                do{
                    let decoder = JSONDecoder()
                    let data = try decoder.decode(BasketballModel.self, from: respone.data!)
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
