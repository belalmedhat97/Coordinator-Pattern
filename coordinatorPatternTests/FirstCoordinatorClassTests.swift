//
//  FirstCoordinatorClassTests.swift
//  FirstCoordinatorClassTests
//
//  Created by belal medhat on 24/01/2023.
//

import XCTest

@testable import coordinatorPattern
final class FirstCoordinatorClassTests: XCTestCase {

    private var sut: FirstViewController!
    private var firstCoordinator: firstCoordinatorMock!
    override func setUp()  {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = FirstViewController()
        let navigationController
            = UINavigationController(rootViewController: UIViewController())
        firstCoordinator = firstCoordinatorMock(navigationController: navigationController)
        sut.coordinator = firstCoordinator
        navigationController.pushViewController(sut, animated: false)
    }

    override func tearDown()  {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        firstCoordinator = nil
        super.tearDown()

    }
    func testPushView(){
        sut.coordinator?.pushView(data: nil, view: FirstViewController(), animation: true)
        XCTAssertTrue(firstCoordinator.didNavigate,"first vc navigated successfully")
    }


}
extension FirstCoordinatorClassTests:PassDataBackProtocols{
    func returnData(data: Any) {
        if let stringData = data as? String {
            XCTAssertEqual(stringData, "return first screen")
        }
    }
}
