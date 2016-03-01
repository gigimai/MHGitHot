//
//  MHBaseViewController.swift
//  MHGitHot
//
//  Created by MaiMai on 2/14/16.
//  Copyright © 2016 MaiMai. All rights reserved.
//

import UIKit

class MHBaseViewController: UIViewController {
    
    init() {
        super.init(nibName: String(self.dynamicType), bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBarHidden = false
        self.edgesForExtendedLayout = .None
    }
    
    func sum(a: Int, b: Int) -> Int {
        return a + b
    }
}
