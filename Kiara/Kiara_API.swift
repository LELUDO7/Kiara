////
//  Kiara_API.swift
//  Kiara
//
//  Created by Ludovic Fournier on 2023-02-17.
//

import Foundation
import UIKit
public class KiaraAPI {
    private let url = "http://localHost:7187/";
    
    func checkAPI(completion: @escaping (Bool) -> Void) {
        let url = URL(string: url + "apistatus/")!
        let session = URLSession.shared
        var request = URLRequest(url: url)
        request.httpMethod = "HEAD"
        
        let task = session.dataTask(with: request) { (data, response, error) in
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                completion(true)
            } else {
                completion(false)
            }
        }
        task.resume()
    }
    
    func checkIfUserExist(userid: String, completion: @escaping (Bool) -> Void) {
        let url = URL(string: url + "user/" + userid)!
        let session = URLSession.shared
        var request = URLRequest(url: url)
        request.httpMethod = "HEAD"
        
        let task = session.dataTask(with: request) { (data, response, error) in
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                completion(true)
            } else {
                completion(false)
            }
        }
        task.resume()
    }
    
    func creatUser() {
        guard let URL = URL(string: url + "user/") else {
            print("invalid url")
            return
        }
        
        var request = URLRequest(url: URL)
        
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let emptyDay = ["name": "", "local": "","nbBloc": 0, "display": true, "color":""] as [String: Any]
        
        var emptySchedule = [[[String:Any]]]()
        
        weekCourseBlocs.forEach { day in
            var weekDay = [[String:Any]]()
            day.forEach{ bloc in
                weekDay.append(emptyDay)
            }
            emptySchedule.append(weekDay)
        }
        
        let body : [String: Any] = [
            "idUser" :  userDefaults.string(forKey: "userId"),
            "firstName" :  userDefaults.string(forKey: "firstName"),
            "lastName" :  userDefaults.string(forKey: "lastName"),
            "schedule" : emptySchedule
        ]
        
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                print("merde")
                return
            }
            
            do{
                let response = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                print(response)
            }catch{
                print(error)
            }
        }
        task.resume()
    }


    func getUser(userId: String, completion: @escaping (Bool) -> Void) {
        let url = URL(string: url + "user/" + userId)!
        
        let session = URLSession.shared
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = session.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    print(error)
                    return
                }
                
                guard let data = data else {
                    print(NSError(domain: "myDomain", code: -1, userInfo: nil))
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let myResponse = try decoder.decode(Response.self, from: data)
                    userDefaults.set(myResponse.firstName ,forKey: "firstName")
                    userDefaults.set(myResponse.lastName ,forKey: "lastName")
                    print(myResponse)
                    var i = 0
                    for weekDay in weekCourseBlocs{
                        if(i>0)
                        {
                            var u = 0
                            for bloc in weekDay{
                                let responseBloc = myResponse.schedule[i-1][u]
                                if myResponse.schedule[i-1][u].name == ""{
                                    weekCourseBlocs[i][u] = EmptyBloc(start: bloc.start, end: bloc.end, display: responseBloc.display)
                                }
                                else
                                {
                                    weekCourseBlocs[i][u] = CourseBloc(start: bloc.start, end: bloc.end, name: responseBloc.name, local: responseBloc.local, color: self.getSystemColor(color: responseBloc.color), nbBloc: responseBloc.nbBloc)
                                }
                                u += 1
                            }
                        
                        }
                        i += 1
                    }
                    completion(true)
                } catch {
                    print(error)
                }
            }
            task.resume()
                
    }

    public struct Response: Codable{
        let idUser : String
        let firstName : String
        let lastName : String
        let schedule : [[apiResultBloc]]
        
    }
                                
    public struct apiResultBloc : Codable{
        let name : String
        let local : String
        let nbBloc : Int
        let display : Bool
        let color : String
        let _id : String
    }

    
    
    
    private func getSystemColor(color:String) -> UIColor
    {
        switch color{
        case "gray":
            return UIColor.systemGray
        case "red":
           return UIColor.systemRed
        case "green":
            return UIColor.systemGreen
        case "blue":
            return UIColor.systemBlue
        case "cyan":
            return UIColor.systemCyan
        case "yellow":
            return UIColor.systemYellow
        case "orange":
            return UIColor.systemOrange
        case "pink":
            return UIColor.systemPink
        case "purple":
            return UIColor.systemPurple
        case "brown":
            return UIColor.systemBrown
        default:
            return UIColor.white
            }
        }
}

    
    

