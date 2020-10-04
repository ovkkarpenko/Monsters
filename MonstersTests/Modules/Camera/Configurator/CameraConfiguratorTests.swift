//
//  CameraCameraConfiguratorTests.swift
//  Monsters
//
//  Created by Alex on 03/10/2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import XCTest

class CameraModuleConfiguratorTests: XCTestCase {

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
        let viewController = CameraViewControllerMock()
        let configurator = CameraModuleConfigurator()

        //when
        configurator.configureModuleForViewInput(viewInput: viewController)

        //then
        XCTAssertNotNil(viewController.output, "CameraViewController is nil after configuration")
        XCTAssertTrue(viewController.output is CameraPresenter, "output is not CameraPresenter")

        let presenter: CameraPresenter = viewController.output as! CameraPresenter
        XCTAssertNotNil(presenter.view, "view in CameraPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in CameraPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is CameraRouter, "router is not CameraRouter")

        let interactor: CameraInteractor = presenter.interactor as! CameraInteractor
        XCTAssertNotNil(interactor.output, "output in CameraInteractor is nil after configuration")
    }

    class CameraViewControllerMock: CameraViewController {

        var setupInitialStateDidCall = false

        override func setupInitialState() {
            setupInitialStateDidCall = true
        }
    }
}
