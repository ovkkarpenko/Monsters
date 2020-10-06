//
//  TeamTeamConfiguratorTests.swift
//  Monsters
//
//  Created by Alex on 06/10/2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import XCTest

class TeamModuleConfiguratorTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testConfigureModuleForViewController() {

        //given
        let viewController = TeamViewControllerMock()
        let configurator = TeamModuleConfigurator()

        //when
        configurator.configureModuleForViewInput(viewInput: viewController)

        //then
        XCTAssertNotNil(viewController.output, "TeamViewController is nil after configuration")
        XCTAssertTrue(viewController.output is TeamPresenter, "output is not TeamPresenter")

        let presenter: TeamPresenter = viewController.output as! TeamPresenter
        XCTAssertNotNil(presenter.view, "view in TeamPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in TeamPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is TeamRouter, "router is not TeamRouter")

        let interactor: TeamInteractor = presenter.interactor as! TeamInteractor
        XCTAssertNotNil(interactor.output, "output in TeamInteractor is nil after configuration")
    }

    class TeamViewControllerMock: TeamViewController {

        var setupInitialStateDidCall = false

        override func setupInitialState() {
            setupInitialStateDidCall = true
        }
    }
}
