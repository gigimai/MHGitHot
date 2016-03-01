//
//  MHGitHotTests.swift
//  MHGitHotTests
//
//  Created by MaiMai on 2/14/16.
//  Copyright © 2016 MaiMai. All rights reserved.
//

import XCTest
@testable import MHGitHot

class MHGitHotTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPeel_shouldMakeBananaEdible() {
        let myBanana = Banana()
        myBanana.peel()
        XCTAssertTrue(myBanana.isEdible)
    }
    
}

class OfferTest : XCTestCase {
    
    func testOffer_whenBananaIsPeel_offerTheBanana() {
        let banana = Banana()
        banana.peel()
        let message = offer(banana)
        XCTAssertEqual(message, "Hey, want a banana?")
    }
    
    func testOffer_whenBananaIsNotPeel_offerToPeel() {
        let banana = Banana()
        let message = offer(banana)
        XCTAssertEqual(message, "Hey, want me to peel this banana for you?")
    }
}

public class Banana {
    private var isPeeled = false
    
    func peel() {
        isPeeled = true
    }
    
    var isEdible : Bool {
        return isPeeled
    }
}

func offer(aBanana:Banana) -> String {
    if aBanana.isEdible {
        return "Hey, want a banana?"
    } else {
        return "Hey, want me to peel this banana for you?"
    }
}
