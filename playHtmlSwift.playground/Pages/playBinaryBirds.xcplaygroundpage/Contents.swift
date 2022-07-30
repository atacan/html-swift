//: [Previous](@previous)
import HtmlSwift
import SwiftSoup
import SwiftFormat
import SwiftHtml

//let html = #"<abbr title="Amazing Inc.">AI</abbr>"#
//let html = #"<div><p>The <abbr title="Amazing Inc.">AI</abbr> was founded in 1945.</p></div>"#
//let html = #"<div><h1>Heading One where</h1><p>The <abbr title="Amazing Inc.">AI</abbr> was founded in 1945.</p><br><a href="url">link text</a><fieldset name="blob" disabled></fieldset></div>"#
//let html = #"""
//<head>
//  <meta charset="UTF-8">
//  <meta name="description" content="Free Web tutorials">
//  <meta name="keywords" content="HTML, CSS, JavaScript">
//  <meta content="John Doe" name="author" >
//  <meta name="viewport" content="width=device-width, initial-scale=1.0">
//</head>
//"""#
//let html = """
//        <address>
//        Written by <a href="mailto:webmaster@example.com">Jon Doe</a>.<br>
//        Visit us at:<br>
//        Example.com<br>
//        Box 564, Disneyland<br>
//        USA
//        </address>
//"""
let html = ###"<html><head><title>Hello Swift HTML DSL</title><meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1"><link rel="stylesheet" href="./css/style.css"></head><body><main class="container"><div><section><img src="./images/swift.png" alt="Swift Logo" title="Picture of the Swift Logo"><h1 class="red">Lorem ipsum</h1><p class="green blue" spellcheck="false">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p></section><a href="https://github.com/binarybirds/swift-html/" target="_blank" download>Download SwiftHtml now!</a><abbr title="Do What The Fuck You Want To Public License">WTFPL</abbr></div></main><script src="./js/main.js" async></script></body></html>"###

let soup = try SwiftSoup.parse(html)
let swiftCode = try convertToBinaryBirds(html: html, component: .fullHtml)
print(swiftCode)
//print(element.description)

let doc = Document(.html) {
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
}

let birds = DocumentRenderer(minify: true, indent: 2).render(doc)
print(birds)


//: [Next](@next)
