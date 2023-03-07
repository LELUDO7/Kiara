////
//  Kiara_API.swift
//  Kiara
//
//  Created by Ludovic Fournier on 2023-02-17.
//

import Foundation
import UIKit
public class KiaraAPI {
    private let url = "http://anthony.serveminecraft.net:7187/";
    
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
    
    func updateUserSchedule(userid: String){
        let url = URL(string: url + "user/" + userid)!
        
        var request = URLRequest(url: url)
        request.httpMethod = "PATCH"
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        var schedule = [[[String:Any]]]()
        
        var i = 0
        KIARA.schedule.forEach { blocs in
            if i > 0{
                var day = [[String:Any]]()
                
                blocs.forEach{ bloc in
                    var scheduleBloc = ["name": "", "local": "","nbBloc": 0, "display":true, "color":""] as [String: Any]
                    if let emptyBloc = bloc as? EmptyBloc{
                        scheduleBloc = ["name": "", "local": "","nbBloc": 0, "display": emptyBloc.display, "color":""]
                    }
                    
                    if let courseBloc = bloc as? CourseBloc{
                        scheduleBloc = ["name": courseBloc.name, "local": courseBloc.local,"nbBloc": courseBloc.nbBloc, "display":true, "color": TOOLS.getColorName(color: courseBloc.color)]
                    }
                    
                    day.append(scheduleBloc)
                }
                schedule.append(day)
            }
            i+=1
        }
        
        let body : [String: Any] = [
            "schedule" : schedule
        ]
        
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
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
        
        var i = 0
        KIARA.schedule.forEach { day in
            if i > 0 {
                var weekDay = [[String:Any]]()
                day.forEach{ bloc in
                    weekDay.append(emptyDay)
                }
                emptySchedule.append(weekDay)
            }
            i+=1
        }
        
        let body : [String: Any] = [
            "idUser" :  KIARA.user.string(forKey: "userId"),
            "firstName" :  KIARA.user.string(forKey: "firstName"),
            "lastName" :  KIARA.user.string(forKey: "lastName"),
            "schedule" : emptySchedule
        ]
        
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
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
    
    func getAllUserInfo(searchContent : String, completion: @escaping (Bool) -> Void) {
        guard let url = URL(string: url + "userinfo/" + searchContent) else {
            print("invalid url")
            return
        }
        
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
                FRIENDS.currentResearchOfUser.removeAll()
                let myResponse = try decoder.decode([ResponseUserInfo].self, from: data)
                
                for userInfo in myResponse {
                    FRIENDS.currentResearchOfUser.append(UserInfo(idUser: userInfo.idUser, firstName: userInfo.firstName, lastName: userInfo.lastName))
                }
                completion(true)
            } catch {
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
                KIARA.user.set(myResponse.firstName ,forKey: "firstName")
                KIARA.user.set(myResponse.lastName ,forKey: "lastName")
                var i = 0
                for weekDay in KIARA.schedule{
                    if(i>0)
                    {
                        var u = 0
                        for bloc in weekDay{
                            let responseBloc = myResponse.schedule[i-1][u]
                            if myResponse.schedule[i-1][u].name == ""{
                                KIARA.schedule[i][u] = EmptyBloc(start: bloc.start, end: bloc.end, display: responseBloc.display)
                            }
                            else
                            {
                                KIARA.schedule[i][u] = CourseBloc(start: bloc.start, end: bloc.end, name: responseBloc.name, local: responseBloc.local, color: TOOLS.getSystemColor(color: responseBloc.color), nbBloc: responseBloc.nbBloc)
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
    
    public struct ResponseUserInfo: Codable {
        let idUser : String
        let firstName : String
        let lastName : String
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
    
    
}




