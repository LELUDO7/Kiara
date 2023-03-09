//
//  Friends.swift
//  Kiara
//
//  Created by Ludovic Fournier on 2023-03-06.
//

import Foundation

public class Friends {
    public var currentResearchOfUser = [UserInfo]()
    public var sendFriendRequest = [String]()
    public var receiveFriendRequest = [String]()
    public var friends = [Friend]()
    
    public func SendFriendRequest(friend:UserInfo){
        API.SendFriendRequest(friendId: friend.idUser)
        sendFriendRequest.append(friend.idUser)
    }
    
    public func loadUserFriend() -> Bool{
        for friend in KIARA.friends{
            API.getFriend(friendId: friend, completion: { _ in
            })
        }
        return true
    }
}


