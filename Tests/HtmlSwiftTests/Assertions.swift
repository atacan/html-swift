//
// https://github.com/atacan
// 30.07.22

import Html
@testable import HtmlSwift
import XCTest

func assertEqualSwift(html: String, shouldBe swiftShould: String, component: HtmlOutputComponent = .onlyBody) {
    do {
        var swift = try convertToPointFree(html: html, component: component)
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

func assertEqualSwift_BinaryBirds(html: String, shouldBe swiftShould: String, component: HtmlOutputComponent = .onlyBody) {
    do {
        var swift = try convertToBinaryBirds(html: html, component: component)
        switch component {
        case .fullHtml:
            break
        case .onlyBody:
            swift = swift |> removeBody_BinaryBirds
        case .onlyHead:
            swift = swift |> removeHead_BinaryBirds
        }
        XCTAssertEqual(swift.removingWhitespace(), swiftShould.removingWhitespace())
//        XCTAssertEqual(swift.condensingWhitespace(), swiftShould.condensingWhitespace())
//        XCTAssertEqual(swift, swiftShould)
    } catch {
        XCTFail("error in conversion \(error.localizedDescription)")
    }
}
