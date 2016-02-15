//
//  MHRepositoryList.swift
//  MHGitHot
//
//  Created by MaiMai on 2/14/16.
//  Copyright © 2016 MaiMai. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class MHRepositoryList: MHDataModelBase {
    static let kReposPerPage = 20
    var repositories : [MHRepository] = []
    override init(json: JSON) {
        for (_,subJSON) : (String,JSON) in json {
            let repo = MHRepository(json: subJSON)
            self.repositories.append(repo)
        }
        super.init(json: json)
    }
    
    static func loadGeneralRepositories(pageNumber:Int, language:String?, success:((MHRepositoryList) -> Void)?, failure: ((NSError) -> Void)?) {
        Alamofire.request(.GET, MHWebServiceEndpoints.kMHWebServiceSearchRepos,parameters: ["q":1,"page":String(pageNumber),"per_page":kReposPerPage]).validate().responseJSON { response in
            switch response.result {
            case .Success:
                if let value = response.result.value {
                    let json = JSON(value)
                    print(json)
                    let repoList = MHRepositoryList(json: json["items"])
                    if let successBlock = success {
                        successBlock(repoList)
                    }
                }
            case .Failure(let error):
                if let failureBlock = failure {
                    failureBlock(error)
                }
            }
        }
    }
}
