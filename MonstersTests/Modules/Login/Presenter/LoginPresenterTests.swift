//
//  LoginLoginPresenterTests.swift
//  Monsters
//
//  Created by Alex on 13/10/2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import XCTest

class LoginPresenterTest: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    class MockInteractor: LoginInteractorInput {

    }

    class MockRouter: LoginRouterInput {

    }

    class MockViewController: LoginViewInput {

        func setupInitialState() {

        }
    }
}
