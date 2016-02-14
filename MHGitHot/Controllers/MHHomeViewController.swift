//
//  MHHomeViewController.swift
//  MHGitHot
//
//  Created by MaiMai on 2/14/16.
//  Copyright © 2016 MaiMai. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

struct Repo {
    let name : String?
    let description : String?
}

class MHHomeViewController: MHBaseViewController,UITableViewDelegate,UITableViewDataSource{
    @IBOutlet private weak var reposTableView : UITableView!
    var dataSource : [Repo] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        reposTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cellId")
        loadRepos()
    }

    func loadRepos(){
        Alamofire.request(.GET, "https://api.github.com/search/repositories", parameters: ["q":0])
            .responseJSON { response in
                switch response.result {
                case .Success:
                    if let value = response.result.value {
                        let json = JSON(value)
                        let repo = Repo(name: json["items"][0]["full_name"].string, description: json["items"][0]["description"].string)
                        print("Repo \(repo)")
                    }
                case .Failure(let error):
                    print(error)
                }
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cellId", forIndexPath: indexPath)
        return cell
    }
}
