//
// https://github.com/atacan
// 30.07.22
	

import XCTest
@testable import HtmlSwift
import Html

final class BinaryBirdBasicTests: XCTestCase {
    func testReadMe() {
        let html = #"""
        <!DOCTYPE html>
        <html>
          <head>
            <title>Hello Swift HTML DSL</title>
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <link rel="stylesheet" href="./css/style.css">
          </head>
          <body>
            <main class="container">
              <div>
                <section>
                  <img src="./images/swift.png" alt="Swift Logo" title="Picture of the Swift Logo">
                  <h1 class="red">Lorem ipsum</h1>
                  <p class="green blue" spellcheck="false">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                </section>
                <a href="https://github.com/binarybirds/swift-html/" target="_blank" download>Download SwiftHtml now!</a>
                <abbr title="Do What The Fuck You Want To Public License">WTFPL</abbr>
              </div>
            </main>
            <script src="./js/main.js" async></script>
          </body>
        </html>
        """#
        
        let swift = ##"""
        Html {
            Head {
                Title("Hello Swift HTML DSL")
                
                Meta().charset("utf-8")
                Meta().name(.viewport).content("width=device-width, initial-scale=1")

                Link(rel: .stylesheet).href("./css/style.css")
            }
            Body {
                Main {
                    Div {
                        Section {
                            Img(src: "./images/swift.png", alt: "Swift Logo")
                                .title("Picture of the Swift Logo")
                            H1("Lorem ipsum")
                                .class("red")
                            P("Lorem ipsum dolor sit amet, consectetur adipiscing elit.")
                                .class("green blue")
                                .spellcheck(false)
                        }

                        A("Download SwiftHtml now!")
                            .href("https://github.com/binarybirds/swift-html/")
                            .target(.blank)
                            .download()
                            
                        Abbr("WTFPL")
                            .title("Do What The Fuck You Want To Public License")
                    }
                }
                .class("container")

                Script().src("./js/main.js").async()
            }
        }
        """##
        assertEqualSwift_BinaryBirds(html: html, shouldBe: swift, component: .fullHtml)
    }
}
