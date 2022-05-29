// https://github.com/atacan/
// 29.05.22
//
    

import XCTest
@testable import HtmlSwift

final class TestText: XCTestCase {
    func testDataCellIconText() throws {
        
        let htmlCode = #"""
<td>
    <i class="folder icon"></i> Test
</td>
"""#
        
        let targetSwiftCode = #"""
Td {
    I().class("folder icon")
    Text("Test")
}
"""#
        
        let outputSwiftCode = try Converter.default.convert(html: htmlCode)
        XCTAssertEqual(outputSwiftCode.removingWhitespace(), targetSwiftCode.removingWhitespace())
    }
}
