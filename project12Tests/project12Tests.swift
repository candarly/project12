
import XCTest
@testable import project12

final class project12Tests: XCTestCase {
    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }
    
    func testIsValidNumberTrue () {
        XCTAssertTrue(ValidationNumber.isNumberValid("1234567898"))
    }
    func testIsValidNumberFalse () {
        XCTAssertFalse(ValidationNumber.isNumberValid("123dsdsdssd"))
    }
    func testExample() throws {

    }

    func testPerformanceExample() throws {
        self.measure {
        }
    }

}
