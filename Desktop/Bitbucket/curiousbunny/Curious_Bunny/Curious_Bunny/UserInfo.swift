//
//  UserInfo.swift
//  Curious_Bunny
//
//  Created by Komal Gujarathi on 6/12/17.
//  Copyright © 2017 Komal Gujarathi. All rights reserved.
//

import Foundation

struct UserInfo {
    let userid: String
    let password : String
    
    init(userid:String,password:String){
        self.userid = userid
        self.password = password
    }
    func toAnyObject()->Any{
        return [
            "userid": userid,
            "password":password
        ]
    }
}
