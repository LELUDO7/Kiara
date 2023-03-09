//
//  Kiara.swift
//  Kiara
//
//  Created by Ludovic Fournier on 2023-02-23.
//

import Foundation

public class Kiara {
    
    let textFontSize = CGFloat(12)
    let blocHeight = CGFloat(20)
    let blocWidth = CGFloat(20)
    let dayTextFontSize = CGFloat(17)
    let courseOpacity = 0.8
    
    let user = UserDefaults.standard
    let userKeys = UserDefaultskeys()
    
    public var schedule = [[Bloc]]()
    public var friends = [String]()
    public var courseBlocHeight = CGFloat(0)
    
    public func SaveDataInUser(data: String, userKey: String){
        user.set(data, forKey: userKey)
    }
    
    public func getDataFromUser(userKey: String) -> String{
        if let data = user.object(forKey: userKey) as? String{
            return data
        }
        else
        {
            return ""
        }
    }
    
    struct UserDefaultskeys{
        let userId = "userId"
        let firstName = "firstName"
        let lastName = "lastName"
        let pendingRecieveFriend = "pendingReciveFriend"
        let pendingSendFriend = "pendingSendFriend"
    }
    
    public func loadScheduleTemplate(){
        schedule.append(cstjTemplate)
        for _ in 1...5{
            schedule.append(cstjTemplate)
        }
    }
    
    public func saveSchedule(){
        
        var schedule = [[saveBloc]]()
        
        var i = 0
        KIARA.schedule.forEach { blocs in
            if i > 0{
                var day = [saveBloc]()
                
                blocs.forEach{ bloc in
                    
                    if let emptyBloc = bloc as? EmptyBloc{
                        day.append(saveBloc(name: "", local: "", nbBloc: 0, display: emptyBloc.display, color: ""))
                    }
                    
                    if let courseBloc = bloc as? CourseBloc{
                        day.append(saveBloc(name: courseBloc.name, local: courseBloc.local, nbBloc: courseBloc.nbBloc, display: true, color: TOOLS.getColorName(color: courseBloc.color)))
                    }
                    
                }
                schedule.append(day)
            }
            i+=1
        }
        
        do {

            let encodedData = try JSONEncoder().encode(schedule)

            user.set(encodedData, forKey: "schedule")

        } catch {

        }
    }
    
    public func loadSchedule(){
        if let savedData = user.object(forKey: "schedule") as? Data {

            do{
                let savedSchedule = try JSONDecoder().decode([[saveBloc]].self, from: savedData)
                var i = 0
                for weekDay in KIARA.schedule{
                    if(i>0)
                    {
                        var u = 0
                        for bloc in weekDay{
                            let savedBloc = savedSchedule[i-1][u]
                            if savedBloc.name == ""{
                                KIARA.schedule[i][u] = EmptyBloc(start: bloc.start, end: bloc.end, display: savedBloc.display)
                            }
                            else
                            {
                                KIARA.schedule[i][u] = CourseBloc(start: bloc.start, end: bloc.end, name: savedBloc.name, local: savedBloc.local, color: TOOLS.getSystemColor(color: savedBloc.color), nbBloc: savedBloc.nbBloc)
                            }
                            u += 1
                        }
                        
                    }
                    i += 1
                }

            } catch {
            }
        }
        
        
    }
    
    private struct saveBloc: Codable{
        let name: String
        let local: String
        let nbBloc: Int
        let display: Bool
        let color: String
    }
    
    private var cstjTemplate: [Bloc] = [
        EmptyBloc(start: "08:00",end: "08:50", display: true),
        EmptyBloc(start: "08:55",end: "09:45", display: true),
        EmptyBloc(start: "09:50",end: "10:40", display: true),
        EmptyBloc(start: "10:45",end: "11:35", display: true),
        EmptyBloc(start: "11:40",end: "12:30", display: true),
        EmptyBloc(start: "12:35",end: "14:20", display: true),
        EmptyBloc(start: "13:30",end: "14:20", display: true),
        EmptyBloc(start: "14:25",end: "15:15", display: true),
        EmptyBloc(start: "15:20",end: "16:10", display: true),
        EmptyBloc(start: "16:15",end: "17:05", display: true),
        EmptyBloc(start: "17:10",end: "18:00", display: true)
    ]
    private let cstjTimesBlocs: [TimeBloc] = [
        TimeBloc(start: "08:00",end: "08:50"),
        TimeBloc(start: "08:55",end: "09:45"),
        TimeBloc(start: "09:50",end: "10:40"),
        TimeBloc(start: "10:45",end: "11:35"),
        TimeBloc(start: "11:40",end: "12:30"),
        TimeBloc(start: "12:35",end: "13:25"),
        TimeBloc(start: "13:30",end: "14:20"),
        TimeBloc(start: "14:25",end: "15:15"),
        TimeBloc(start: "15:20",end: "16:10"),
        TimeBloc(start: "16:15",end: "17:05"),
        TimeBloc(start: "17:10",end: "18:00")
    ]

    
    
}

