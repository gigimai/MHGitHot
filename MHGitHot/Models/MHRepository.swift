//
//  MHRepository.swift
//  MHGitHot
//
//  Created by MaiMai on 2/14/16.
//  Copyright © 2016 MaiMai. All rights reserved.
//

import UIKit
import SwiftyJSON
class MHRepository: MHDataModelBase {
    let owner : MHRepositoryUser
    var repoDescription : String!
    var repoName : String!
    let issues : Array<String>
    let contributors : Array <MHRepositoryUser>
    
    override init(json: JSON) {
        self.owner = MHRepositoryUser(json: json["owner"])
        self.repoDescription = json["description"].string
        self.repoName = json["full_name"].string
        self.issues = []
        self.contributors = []
        super.init(json: json)
    }
}
