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
class MHHomeViewController: MHBaseViewController,UITableViewDelegate,UITableViewDataSource{
    @IBOutlet private weak var reposTableView : UITableView!
    private var datasource : [MHRepository] = []
    private var pageNumber = 0
    private var languageQuery : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.reposTableView.registerNib(UINib(nibName: String(MHCustomTableViewCell.self), bundle: nil), forCellReuseIdentifier: MHCustomTableViewCell.cellIdentifier())
        self.reposTableView.tableFooterView = UIView()
        self.reposTableView.rowHeight = UITableViewAutomaticDimension
        self.reposTableView.estimatedRowHeight = 80
        loadMoreRepositories()
    }
    
    func loadMoreRepositories() {
        MHRepositoryList.loadGeneralRepositories(self.pageNumber, language: nil, success: { repoList in
            self.datasource = repoList.repositories
            print(self.datasource)
            dispatch_async(dispatch_get_main_queue(), {
                self.reposTableView.reloadData()
            })
            }, failure: { error in
                print(error)
        })
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.datasource.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(MHCustomTableViewCell.cellIdentifier()) as? MHCustomTableViewCell
        let repo = self.datasource[indexPath.row]
        cell?.configureCellWithRepo(repo)
        return cell!
    }
}
