// https://github.com/atacan/
// 29.05.22
//

@testable import HtmlSwift
import XCTest

final class TestSpecialCharacters: XCTestCase {
    func testSpecialCharacters() throws {
        let htmlCode = #"""
        <body>
            <img src="https://images.unsplash.com/photo-1654124803514-a192f4dad82e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=3636&q=80"
                class="card-img-top" alt="...">
        </body>
        """#
        
        XCTAssertNoThrow(try Converter.default.convert(html: htmlCode))
        XCTAssertNoThrow(try Converter.default.convert(html: htmlCode.condensingWhitespace()))
    }
}
