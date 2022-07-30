//
// https://github.com/atacan
// 30.07.22
	

import XCTest
@testable import HtmlSwift
import Html

func assertEqualSwift(html: String, shouldBe swiftShould: String, component: HtmlOutputComponent = .onlyBody) {
    do {
        var swift = try convert(html: html, component: component)
        switch component {
        case .fullHtml:
            break
        case .onlyBody:
            swift = swift |> removeBody
        case .onlyHead:
            break
        }
        XCTAssertEqual(swift.removingWhitespace(), swiftShould.removingWhitespace())
//        XCTAssertEqual(swift.condensingWhitespace(), swiftShould.condensingWhitespace())
    } catch {
        XCTFail("error in conversion \(error.localizedDescription)")
    }
}
