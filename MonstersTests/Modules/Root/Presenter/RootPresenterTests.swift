//
//  RootRootPresenterTests.swift
//  Monsters
//
//  Created by Alex on 03/10/2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import XCTest

class RootPresenterTest: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    class MockInteractor: RootInteractorInput {

    }

    class MockRouter: RootRouterInput {

    }

    class MockViewController: RootViewInput {

        func setupInitialState() {

        }
    }
}
