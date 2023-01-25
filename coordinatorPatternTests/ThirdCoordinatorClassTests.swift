//
//  ThirdCoordinatorClassTests.swift
//  coordinatorPatternTests
//
//  Created by belal medhat on 24/01/2023.
//

import XCTest
@testable import coordinatorPattern
final class ThirdCoordinatorClassTests: XCTestCase {
    private var sut: ThirdViewController!
    private var thirdCoordinator: ThirdCoordinatorMock!
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = ThirdViewController()
        let navigationController
            = UINavigationController(rootViewController: UIViewController())
        thirdCoordinator = ThirdCoordinatorMock(navigationController: navigationController)
        sut.coordinator = thirdCoordinator
        navigationController.pushViewController(sut, animated: false)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        thirdCoordinator = nil
        super.tearDown()
        
    }
    func testPopView(){
        sut.coordinator?.popView(animation: true)
        sut.delegate = SecondCoordinatorClassTests()
        sut.delegate?.returnData(data: "return second screen")
        XCTAssertTrue(thirdCoordinator.didback,"back to second screen")

    }
    func testPoptoRoot(){
        sut.coordinator?.popToRoot(animation: true)
        XCTAssertTrue(thirdCoordinator.didbackRoot,"back to first screen")

    }
}
