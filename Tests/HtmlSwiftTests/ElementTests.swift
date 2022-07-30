//
// https://github.com/atacan
// 30.07.22
	

import XCTest
@testable import HtmlSwift
import Html

final class ElementTests: XCTestCase {
    func testA() {
        let html = #"""
        <a href="url">link text</a>
        """#
        let swift = ##"""
            .a(
                attributes: [.href("url")], "link text"
            )
        """##
        assertEqualSwift(html: html, shouldBe: swift)
    }
    func testAbbr() {
        let html = #"""
        <p>The <abbr title="Amazing Inc.">AI</abbr> was founded in 1945.</p>
        """#
        let swift = #"""
        .p(
            "The",
            .abbr(
                attributes: [.title("Amazing Inc.")], "AI"
            ), "was founded in 1945."
        )
        """#
        assertEqualSwift(html: html, shouldBe: swift)
    }
    func testAddress() {
        let html = #"""
        <address>
        Written by <a href="mailto:webmaster@example.com">Jon Doe</a>.<br>
        Visit us at:<br>
        Example.com<br>
        Box 564, Disneyland<br>
        USA
        </address>
        """#
        let swift = #"""
        .address(
            "Written by",
            .a(
                attributes: [.href("mailto:webmaster@example.com")], "Jon Doe"
            ), ".", .br, "Visit us at:", .br, "Example.com", .br, "Box 564, Disneyland", .br, "USA"
        )
        """#
        assertEqualSwift(html: html, shouldBe: swift)
    }
    func testArea() {
        let html = #"""
        <br>
        """#
        let swift = #"""
        .br
        """#
        assertEqualSwift(html: html, shouldBe: swift)
    }
    func testArticle() {
        let html = #"""
        <br>
        """#
        let swift = #"""
        .br
        """#
        assertEqualSwift(html: html, shouldBe: swift)
    }
    func testAside() {
        let html = #"""
        <br>
        """#
        let swift = #"""
        .br
        """#
        assertEqualSwift(html: html, shouldBe: swift)
    }
    func testAudio() {
        let html = #"""
        <br>
        """#
        let swift = #"""
        .br
        """#
        assertEqualSwift(html: html, shouldBe: swift)
    }
    func testB() {
        let html = #"""
        <br>
        """#
        let swift = #"""
        .br
        """#
        assertEqualSwift(html: html, shouldBe: swift)
    }
    func testBase() {
        let html = #"""
        <br>
        """#
        let swift = #"""
        .br
        """#
        assertEqualSwift(html: html, shouldBe: swift)
    }
    func testBdi() {
        let html = #"""
        <br>
        """#
        let swift = #"""
        .br
        """#
        assertEqualSwift(html: html, shouldBe: swift)
    }
    func testBdo() {
        let html = #"""
        <br>
        """#
        let swift = #"""
        .br
        """#
        assertEqualSwift(html: html, shouldBe: swift)
    }
    func testBlockquote() {
        let html = #"""
        <br>
        """#
        let swift = #"""
        .br
        """#
        assertEqualSwift(html: html, shouldBe: swift)
    }
    func testBody() {
        let html = #"""
        <br>
        """#
        let swift = #"""
        .br
        """#
        assertEqualSwift(html: html, shouldBe: swift)
    }
    func testButton() {
        let html = #"""
        <br>
        """#
        let swift = #"""
        .br
        """#
        assertEqualSwift(html: html, shouldBe: swift)
    }
    func testCanvas() {
        let html = #"""
        <br>
        """#
        let swift = #"""
        .br
        """#
        assertEqualSwift(html: html, shouldBe: swift)
    }
    func testCaption() {
        let html = #"""
        <br>
        """#
        let swift = #"""
        .br
        """#
        assertEqualSwift(html: html, shouldBe: swift)
    }
    func testCite() {
        let html = #"""
        <br>
        """#
        let swift = #"""
        .br
        """#
        assertEqualSwift(html: html, shouldBe: swift)
    }
    func testCode() {
        let html = #"""
        <br>
        """#
        let swift = #"""
        .br
        """#
        assertEqualSwift(html: html, shouldBe: swift)
    }
    func testCol() {
        let html = #"""
        <br>
        """#
        let swift = #"""
        .br
        """#
        assertEqualSwift(html: html, shouldBe: swift)
    }
    func testColgroup() {
        let html = #"""
        <br>
        """#
        let swift = #"""
        .br
        """#
        assertEqualSwift(html: html, shouldBe: swift)
    }
    func testDd() {
        let html = #"""
        <br>
        """#
        let swift = #"""
        .br
        """#
        assertEqualSwift(html: html, shouldBe: swift)
    }
    func testDel() {
        let html = #"""
        <br>
        """#
        let swift = #"""
        .br
        """#
        assertEqualSwift(html: html, shouldBe: swift)
    }
    func testDetails() {
        let html = #"""
        <br>
        """#
        let swift = #"""
        .br
        """#
        assertEqualSwift(html: html, shouldBe: swift)
    }
    func testDfn() {
        let html = #"""
        <br>
        """#
        let swift = #"""
        .br
        """#
        assertEqualSwift(html: html, shouldBe: swift)
    }
    func testDiv() {
        let html = #"""
        <br>
        """#
        let swift = #"""
        .br
        """#
        assertEqualSwift(html: html, shouldBe: swift)
    }
    func testDl() {
        let html = #"""
        <br>
        """#
        let swift = #"""
        .br
        """#
        assertEqualSwift(html: html, shouldBe: swift)
    }
    func testDt() {
        let html = #"""
        <br>
        """#
        let swift = #"""
        .br
        """#
        assertEqualSwift(html: html, shouldBe: swift)
    }
    func testEm() {
        let html = #"""
        <br>
        """#
        let swift = #"""
        .br
        """#
        assertEqualSwift(html: html, shouldBe: swift)
    }
    func testEmbed() {
        let html = #"""
        <br>
        """#
        let swift = #"""
        .br
        """#
        assertEqualSwift(html: html, shouldBe: swift)
    }
    func testFieldset() {
        let html = #"""
        <br>
        """#
        let swift = #"""
        .br
        """#
        assertEqualSwift(html: html, shouldBe: swift)
    }
    func testFigcaption() {
        let html = #"""
        <br>
        """#
        let swift = #"""
        .br
        """#
        assertEqualSwift(html: html, shouldBe: swift)
    }
    func testFigure() {
        let html = #"""
        <br>
        """#
        let swift = #"""
        .br
        """#
        assertEqualSwift(html: html, shouldBe: swift)
    }
    func testFooter() {
        let html = #"""
        <br>
        """#
        let swift = #"""
        .br
        """#
        assertEqualSwift(html: html, shouldBe: swift)
    }
    func testForm() {
        let html = #"""
        <br>
        """#
        let swift = #"""
        .br
        """#
        assertEqualSwift(html: html, shouldBe: swift)
    }
    func testH1() {
        let html = #"""
        <br>
        """#
        let swift = #"""
        .br
        """#
        assertEqualSwift(html: html, shouldBe: swift)
    }
    func testH2() {
        let html = #"""
        <br>
        """#
        let swift = #"""
        .br
        """#
        assertEqualSwift(html: html, shouldBe: swift)
    }
    func testH3() {
        let html = #"""
        <br>
        """#
        let swift = #"""
        .br
        """#
        assertEqualSwift(html: html, shouldBe: swift)
    }
    func testH4() {
        let html = #"""
        <br>
        """#
        let swift = #"""
        .br
        """#
        assertEqualSwift(html: html, shouldBe: swift)
    }
    func testH5() {
        let html = #"""
        <br>
        """#
        let swift = #"""
        .br
        """#
        assertEqualSwift(html: html, shouldBe: swift)
    }
    func testH6() {
        let html = #"""
        <br>
        """#
        let swift = #"""
        .br
        """#
        assertEqualSwift(html: html, shouldBe: swift)
    }
    func testHead() {
        let html = #"""
        <br>
        """#
        let swift = #"""
        .br
        """#
        assertEqualSwift(html: html, shouldBe: swift)
    }
    func testHeader() {
        let html = #"""
        <br>
        """#
        let swift = #"""
        .br
        """#
        assertEqualSwift(html: html, shouldBe: swift)
    }
    func testHr() {
        let html = #"""
        <br>
        """#
        let swift = #"""
        .br
        """#
        assertEqualSwift(html: html, shouldBe: swift)
    }
    func testHtml() {
        let html = #"""
        <br>
        """#
        let swift = #"""
        .br
        """#
        assertEqualSwift(html: html, shouldBe: swift)
    }
    func testI() {
        let html = #"""
        <br>
        """#
        let swift = #"""
        .br
        """#
        assertEqualSwift(html: html, shouldBe: swift)
    }
    func testIframe() {
        let html = #"""
        <br>
        """#
        let swift = #"""
        .br
        """#
        assertEqualSwift(html: html, shouldBe: swift)
    }
    func testImg() {
        let html = #"""
        <br>
        """#
        let swift = #"""
        .br
        """#
        assertEqualSwift(html: html, shouldBe: swift)
    }
    func testInput() {
        let html = #"""
        <br>
        """#
        let swift = #"""
        .br
        """#
        assertEqualSwift(html: html, shouldBe: swift)
    }
    func testIns() {
        let html = #"""
        <br>
        """#
        let swift = #"""
        .br
        """#
        assertEqualSwift(html: html, shouldBe: swift)
    }
    func testKbd() {
        let html = #"""
        <br>
        """#
        let swift = #"""
        .br
        """#
        assertEqualSwift(html: html, shouldBe: swift)
    }
    func testLabel() {
        let html = #"""
        <br>
        """#
        let swift = #"""
        .br
        """#
        assertEqualSwift(html: html, shouldBe: swift)
    }
    func testLegend() {
        let html = #"""
        <br>
        """#
        let swift = #"""
        .br
        """#
        assertEqualSwift(html: html, shouldBe: swift)
    }
    func testLi() {
        let html = #"""
        <br>
        """#
        let swift = #"""
        .br
        """#
        assertEqualSwift(html: html, shouldBe: swift)
    }
    func testLink() {
        let html = #"""
        <br>
        """#
        let swift = #"""
        .br
        """#
        assertEqualSwift(html: html, shouldBe: swift)
    }
    func testMain() {
        let html = #"""
        <br>
        """#
        let swift = #"""
        .br
        """#
        assertEqualSwift(html: html, shouldBe: swift)
    }
    func testMark() {
        let html = #"""
        <br>
        """#
        let swift = #"""
        .br
        """#
        assertEqualSwift(html: html, shouldBe: swift)
    }
    func testMap() {
        let html = #"""
        <br>
        """#
        let swift = #"""
        .br
        """#
        assertEqualSwift(html: html, shouldBe: swift)
    }
    func testMeta() {
        let html = #"""
        <head>
          <meta charset="UTF-8">
          <meta name="description" content="Free Web tutorials">
          <meta name="keywords" content="HTML, CSS, JavaScript">
          <meta content="John Doe" name="author" >
          <meta name="viewport" content="width=device-width, initial-scale=1.0">
        </head>
        """#
        let swift = #"""
        .head(
            .meta(
                attributes: [.charset(.init(rawValue: "UTF-8"))]
            ),
            .meta(
                name: "description", content: "Free Web tutorials"
            ),
            .meta(
                name: "keywords", content: "HTML, CSS, JavaScript"
            ),
            .meta(
                name: "author", content: "John Doe"
            ),
            .meta(
                name: "viewport", content: "width=device-width, initial-scale=1.0"
            )
        )
        """#
        assertEqualSwift(html: html, shouldBe: swift, component: .onlyHead)
    }
    func testMeter() {
        let html = #"""
        <br>
        """#
        let swift = #"""
        .br
        """#
        assertEqualSwift(html: html, shouldBe: swift)
    }
    func testNav() {
        let html = #"""
        <br>
        """#
        let swift = #"""
        .br
        """#
        assertEqualSwift(html: html, shouldBe: swift)
    }
    func testObject() {
        let html = #"""
        <br>
        """#
        let swift = #"""
        .br
        """#
        assertEqualSwift(html: html, shouldBe: swift)
    }
    func testOl() {
        let html = #"""
        <br>
        """#
        let swift = #"""
        .br
        """#
        assertEqualSwift(html: html, shouldBe: swift)
    }
    func testOptgroup() {
        let html = #"""
        <br>
        """#
        let swift = #"""
        .br
        """#
        assertEqualSwift(html: html, shouldBe: swift)
    }
    func testOption() {
        let html = #"""
        <br>
        """#
        let swift = #"""
        .br
        """#
        assertEqualSwift(html: html, shouldBe: swift)
    }
    func testOutput() {
        let html = #"""
        <br>
        """#
        let swift = #"""
        .br
        """#
        assertEqualSwift(html: html, shouldBe: swift)
    }
    func testP() {
        let html = #"""
        <br>
        """#
        let swift = #"""
        .br
        """#
        assertEqualSwift(html: html, shouldBe: swift)
    }
    func testParam() {
        let html = #"""
        <br>
        """#
        let swift = #"""
        .br
        """#
        assertEqualSwift(html: html, shouldBe: swift)
    }
    func testPicture() {
        let html = #"""
        <br>
        """#
        let swift = #"""
        .br
        """#
        assertEqualSwift(html: html, shouldBe: swift)
    }
    func testPre() {
        let html = #"""
        <br>
        """#
        let swift = #"""
        .br
        """#
        assertEqualSwift(html: html, shouldBe: swift)
    }
    func testProgress() {
        let html = #"""
        <br>
        """#
        let swift = #"""
        .br
        """#
        assertEqualSwift(html: html, shouldBe: swift)
    }
    func testQ() {
        let html = #"""
        <br>
        """#
        let swift = #"""
        .br
        """#
        assertEqualSwift(html: html, shouldBe: swift)
    }
    func testRp() {
        let html = #"""
        <br>
        """#
        let swift = #"""
        .br
        """#
        assertEqualSwift(html: html, shouldBe: swift)
    }
    func testRt() {
        let html = #"""
        <br>
        """#
        let swift = #"""
        .br
        """#
        assertEqualSwift(html: html, shouldBe: swift)
    }
    func testRuby() {
        let html = #"""
        <br>
        """#
        let swift = #"""
        .br
        """#
        assertEqualSwift(html: html, shouldBe: swift)
    }
    func testS() {
        let html = #"""
        <br>
        """#
        let swift = #"""
        .br
        """#
        assertEqualSwift(html: html, shouldBe: swift)
    }
    func testSamp() {
        let html = #"""
        <br>
        """#
        let swift = #"""
        .br
        """#
        assertEqualSwift(html: html, shouldBe: swift)
    }
    func testScript() {
        let html = #"""
        <br>
        """#
        let swift = #"""
        .br
        """#
        assertEqualSwift(html: html, shouldBe: swift)
    }
    func testSection() {
        let html = #"""
        <br>
        """#
        let swift = #"""
        .br
        """#
        assertEqualSwift(html: html, shouldBe: swift)
    }
    func testSelect() {
        let html = #"""
        <br>
        """#
        let swift = #"""
        .br
        """#
        assertEqualSwift(html: html, shouldBe: swift)
    }
    func testSmall() {
        let html = #"""
        <br>
        """#
        let swift = #"""
        .br
        """#
        assertEqualSwift(html: html, shouldBe: swift)
    }
    func testSource() {
        let html = #"""
        <br>
        """#
        let swift = #"""
        .br
        """#
        assertEqualSwift(html: html, shouldBe: swift)
    }
    func testSpan() {
        let html = #"""
        <br>
        """#
        let swift = #"""
        .br
        """#
        assertEqualSwift(html: html, shouldBe: swift)
    }
    func testStrong() {
        let html = #"""
        <br>
        """#
        let swift = #"""
        .br
        """#
        assertEqualSwift(html: html, shouldBe: swift)
    }
    func testStyle() {
        let html = #"""
        <br>
        """#
        let swift = #"""
        .br
        """#
        assertEqualSwift(html: html, shouldBe: swift)
    }
    func testSub() {
        let html = #"""
        <br>
        """#
        let swift = #"""
        .br
        """#
        assertEqualSwift(html: html, shouldBe: swift)
    }
    func testSummary() {
        let html = #"""
        <br>
        """#
        let swift = #"""
        .br
        """#
        assertEqualSwift(html: html, shouldBe: swift)
    }
    func testSup() {
        let html = #"""
        <br>
        """#
        let swift = #"""
        .br
        """#
        assertEqualSwift(html: html, shouldBe: swift)
    }
    func testSvg() {
        let html = #"""
        <br>
        """#
        let swift = #"""
        .br
        """#
        assertEqualSwift(html: html, shouldBe: swift)
    }
    func testTable() {
        let html = #"""
        <br>
        """#
        let swift = #"""
        .br
        """#
        assertEqualSwift(html: html, shouldBe: swift)
    }
    func testTbody() {
        let html = #"""
        <br>
        """#
        let swift = #"""
        .br
        """#
        assertEqualSwift(html: html, shouldBe: swift)
    }
    func testTd() {
        let html = #"""
        <br>
        """#
        let swift = #"""
        .br
        """#
        assertEqualSwift(html: html, shouldBe: swift)
    }
    func testTemplate() {
        let html = #"""
        <br>
        """#
        let swift = #"""
        .br
        """#
        assertEqualSwift(html: html, shouldBe: swift)
    }
    func testTextarea() {
        let html = #"""
        <br>
        """#
        let swift = #"""
        .br
        """#
        assertEqualSwift(html: html, shouldBe: swift)
    }
    func testTfoot() {
        let html = #"""
        <br>
        """#
        let swift = #"""
        .br
        """#
        assertEqualSwift(html: html, shouldBe: swift)
    }
    func testTime() {
        let html = #"""
        <br>
        """#
        let swift = #"""
        .br
        """#
        assertEqualSwift(html: html, shouldBe: swift)
    }
    func testTrack() {
        let html = #"""
        <br>
        """#
        let swift = #"""
        .br
        """#
        assertEqualSwift(html: html, shouldBe: swift)
    }
    func testTh() {
        let html = #"""
        <br>
        """#
        let swift = #"""
        .br
        """#
        assertEqualSwift(html: html, shouldBe: swift)
    }
    func testThead() {
        let html = #"""
        <br>
        """#
        let swift = #"""
        .br
        """#
        assertEqualSwift(html: html, shouldBe: swift)
    }
    func testTr() {
        let html = #"""
        <br>
        """#
        let swift = #"""
        .br
        """#
        assertEqualSwift(html: html, shouldBe: swift)
    }
    func testU() {
        let html = #"""
        <br>
        """#
        let swift = #"""
        .br
        """#
        assertEqualSwift(html: html, shouldBe: swift)
    }
    func testUl() {
        let html = #"""
        <br>
        """#
        let swift = #"""
        .br
        """#
        assertEqualSwift(html: html, shouldBe: swift)
    }
    func testVar() {
        let html = #"""
        <br>
        """#
        let swift = #"""
        .br
        """#
        assertEqualSwift(html: html, shouldBe: swift)
    }
    func testVideo() {
        let html = #"""
        <br>
        """#
        let swift = #"""
        .br
        """#
        assertEqualSwift(html: html, shouldBe: swift)
    }

}
