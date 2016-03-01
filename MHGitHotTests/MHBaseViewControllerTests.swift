//
//  MHBaseViewControllerTests.swift
//  MHGitHot
//
//  Created by MaiMai on 2/25/16.
//  Copyright © 2016 MaiMai. All rights reserved.
//

import Quick
import Nimble

class MHBaseViewControllerTests: QuickSpec {
    override func spec() {
        var testBaseViewController : MHBaseViewController!
        beforeEach {
            testBaseViewController = MHBaseViewController()
        }
        it("test test") {
            expect(1+1).to(equal(2))
        }
        
        describe("test sum") {
            beforeEach {
                
            }
            it("sum of 1 and 2 should be 3") {
                expect(testBaseViewController.sum(1, b: 2)).to(equal(3))
            }
        }
        afterEach {
            
        }
    }
}
