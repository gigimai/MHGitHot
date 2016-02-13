//
//  MHSplashViewController.swift
//  MHGitHot
//
//  Created by MaiMai on 2/14/16.
//  Copyright © 2016 MaiMai. All rights reserved.
//

import UIKit

class MHSplashViewController: UIViewController {
    @IBOutlet private weak var animateView : UIImageView!
    init() {
        super.init(nibName: String(self.dynamicType), bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBarHidden = true
        self.animateView.transform = CGAffineTransformMakeScale(1, 1)
        UIView.animateWithDuration(1, delay: 0, options: [.Repeat,.Autoreverse,.BeginFromCurrentState], animations: {
                self.animateView.transform = CGAffineTransformMakeScale(1.2, 1.2)
            }, completion:nil)
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(3 * NSEC_PER_SEC)), dispatch_get_main_queue()) {
            let homeViewController = MHHomeViewController()
            let transition = CATransition()
            transition.duration = 1
            transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            transition.type = kCATransitionFade
            transition.subtype = kCATransitionFromTop
            self.navigationController?.view.layer.addAnimation(transition, forKey: kCATransition)
            self.navigationController?.viewControllers = [homeViewController]
        }
    }

}
