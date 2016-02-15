//
//  MHRepositoryOwner.swift
//  MHGitHot
//
//  Created by MaiMai on 2/14/16.
//  Copyright © 2016 MaiMai. All rights reserved.
//

import UIKit
import SwiftyJSON

class MHRepositoryUser: MHDataModelBase {
    let name : String!
    let id : Int64!
    let avatarURL : String!
    override init(json: JSON) {
        self.name = json["login"].string
        self.id = json["id"].int64
        self.avatarURL = json["avatar_URL"].string
        super.init(json: json)
    }    
}
