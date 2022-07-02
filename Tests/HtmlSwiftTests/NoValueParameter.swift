//
// https://github.com/atacan
// 03.07.22
	

@testable import HtmlSwift
import XCTest

final class TestNoValueParameters: XCTestCase {
    func testNoValueParameters() throws {
        let htmlCode = #"""
        <html>
        <head>
            <script async src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
                crossorigin="anonymous"></script>
            <title>Document</title>
        </head>
        <body>
            <div mynonexistent="valueIn">Test Div</div>
            <script src='https://www.google-analytics.com/analytics.js' async></script>
        </body>
        </html>
        """#

        XCTAssertNoThrow(try Converter.default.convert(html: htmlCode))
        XCTAssertNoThrow(try Converter.default.convert(html: htmlCode.condensingWhitespace()))
    }
}
