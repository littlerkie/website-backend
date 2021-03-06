import XCTest

///
/// NOTE: This file was generated by generate_linux_tests.py
///
/// Do NOT edit this file directly as it will be regenerated automatically when needed.
///

extension BlogCategoryCollectionTests {

    @available(*, deprecated, message: "not actually deprecated. Just deprecated to allow deprecated tests (which test deprecated functionality) without warnings")
    static var allTests: [(String, (BlogCategoryCollectionTests) -> () throws -> Void)] {
        return [
            ("testCreate", testCreate),
            ("testCreateWithDuplicateName", testCreateWithDuplicateName),
            ("testCreateWithoutName", testCreateWithoutName),
            ("testQueryWithIDThatDoesNotExsit", testQueryWithIDThatDoesNotExsit),
            ("testQueryWithID", testQueryWithID),
            ("testQueryAll", testQueryAll),
            ("testUpdate", testUpdate),
            ("testDeleteWithIDThatDoesNotExsit", testDeleteWithIDThatDoesNotExsit),
            ("testDeleteWithID", testDeleteWithID),
        ]
    }
}
