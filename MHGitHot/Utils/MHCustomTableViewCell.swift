//
//  MHCustomTableViewCell.swift
//  MHGitHot
//
//  Created by MaiMai on 2/14/16.
//  Copyright © 2016 MaiMai. All rights reserved.
//

import UIKit

class MHCustomTableViewCell: UITableViewCell {
    @IBOutlet private weak var title : UILabel!
    @IBOutlet private weak var subTitle : UILabel!
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCellWithRepo(repo:MHRepository) {
        self.title.text = repo.repoName
        self.subTitle.text = repo.repoDescription
    }
    
    static func cellIdentifier() -> String {
        return String(self.dynamicType)
    }
}
