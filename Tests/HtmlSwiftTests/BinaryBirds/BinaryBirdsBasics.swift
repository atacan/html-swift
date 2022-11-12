//
// https://github.com/atacan
// 30.07.22
	
import Html
@testable import HtmlSwift
import XCTest

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
    
    func testTablewithAttributes() throws {
        let html = #"""
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">Number</th>
                    <th scope="col">First</th>
                    <th scope="col">Last</th>
                    <th scope="col">Handle</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th scope="row">1</th>
                    <td>Mark</td>
                    <td>Otto</td>
                    <td>@mdo</td>
                </tr>
                <tr>
                    <th scope="row">2</th>
                    <td>Jacob</td>
                    <td>Thornton</td>
                    <td>@fat</td>
                </tr>
                <tr>
                    <th scope="row">3</th>
                    <td colspan="2">Larry the Bird</td>
                    <td>@twitter</td>
                </tr>
            </tbody>
        </table>
        """#
            
        let swift = #"""
        Table {
            Thead {
                Tr {
                    Th("Number")
                        .scope(.col)
                    Th("First")
                        .scope(.col)
                    Th("Last")
                        .scope(.col)
                    Th("Handle")
                        .scope(.col)
                }
            }
            Tbody {
                Tr {
                    Th("1")
                        .scope(.row)
                    Td("Mark")
                    Td("Otto")
                    Td("@mdo")
                }
                Tr {
                    Th("2")
                        .scope(.row)
                    Td("Jacob")
                    Td("Thornton")
                    Td("@fat")
                }
                Tr {
                    Th("3")
                        .scope(.row)
                    Td("Larry the Bird")
                        .colspan(2)
                    Td("@twitter")
                }
            }
        }
        .class("table")
        """#
            
        assertEqualSwift_BinaryBirds(html: html, shouldBe: swift, component: .onlyBody)
    }
    
    func testStyleElement() throws {
        let html = #"""
        <style>
        body{margin:0}
        h1{font-size:2em;margin:.67em 0}
        </style>
        """#
        let swift = #"Style("""body{margin:0} h1{font-size:2em;margin:.67em 0}""")"#
        assertEqualSwift_BinaryBirds(html: html, shouldBe: swift, component: .onlyHead)
    }

}
