//
//  SecondCoordinatorClassTests.swift
//  coordinatorClassTests
//
//  Created by belal medhat on 24/01/2023.
//

import XCTest
@testable import coordinatorPattern
final class SecondCoordinatorClassTests: XCTestCase {
    private var sut: SecondViewController!
    private var secondCoordinator: SecondCoordinatorMock!
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        sut = SecondViewController()
        let navigationController
            = UINavigationController(rootViewController: UIViewController())
        secondCoordinator = SecondCoordinatorMock(navigationController: navigationController)
        sut.coordinator = secondCoordinator
        navigationController.pushViewController(sut, animated: false)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        secondCoordinator = nil
        super.tearDown()
        
    }
    func testPushView(){
        sut.coordinator?.pushView(data: "test navigation", view: SecondViewController(), animation: true)
        XCTAssertTrue(secondCoordinator.didNavigate,"second vc navigated successfully")
        XCTAssertEqual(secondCoordinator.dataPassed, "test navigation")
    }
    func testPopView(){
        sut.delegate = FirstCoordinatorClassTests()
        sut.delegate?.returnData(data: "return first screen")
        sut.coordinator?.popView(animation: true)
        
    }
    

}
extension SecondCoordinatorClassTests:PassDataBackProtocols{
    func returnData(data: Any) {
        if let stringData = data as? String {
            XCTAssertEqual(stringData, "return second screen")
        }
    }
    
    
}
