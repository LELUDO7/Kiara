//
//  Kiara_API.swift
//  Kiara
//
//  Created by Ludovic Fournier on 2023-02-17.
//

import Foundation
import UIKit

let url = "http://localHost:7187/schedule/5fc125a21633312494c41fee";

func getData(from url:String) async{
    guard let URL = URL(string: url) else {
        print("invalid url")
        return
    }
    
    do{
        let (data, _) = try await URLSession.shared.data(from:URL)
        
        if let decodeResponse = try? JSONDecoder().decode(apiResult.self, from: data)
        {
            var i = 0
            for day in weekCourseBlocs{
                var u = 0
                for bloc in day {
                    if(u > 0 && i > 0)
                    {
                        let responseBloc = decodeResponse.weekDay[i-1][u-1]
                        if( responseBloc.name != ""){
                            weekCourseBlocs[i][u] = CourseBloc(start: bloc.start, end: bloc.end, name: responseBloc.name, local: responseBloc.local, color: getSystemColor(color: responseBloc.color), nbBloc: responseBloc.nbBloc)
                        }
                        else
                        {
                            weekCourseBlocs[i][u] = EmptyBloc(start: bloc.start, end: bloc.end, display: responseBloc.display)
                        }
                        
                    }
                    u+=1
                }
                i+=1
            }
        }
    }catch{
        print("invalid data")
    }
            
            
}

private struct Response: Codable{
    let results: apiResult
    let status : String
    
}

private struct apiResult : Codable{
    let _id : String
    let weekDay : [[apiResultBloc]]
}

private struct apiResultBloc : Codable{
    let _id : String
    let name : String
    let local : String
    let nbBloc : Int
    let display : Bool
    let color : String
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

