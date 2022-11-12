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
//let html = ###"<html><head><title>Hello Swift HTML DSL</title><meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1"><link rel="stylesheet" href="./css/style.css"></head><body><main class="container"><div><section><img src="./images/swift.png" alt="Swift Logo" title="Picture of the Swift Logo"><h1 class="red">Lorem ipsum</h1><p class="green blue" spellcheck="false">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p></section><a href="https://github.com/binarybirds/swift-html/" target="_blank" download>Download SwiftHtml now!</a><abbr title="Do What The Fuck You Want To Public License">WTFPL</abbr></div></main><script src="./js/main.js" async></script></body></html>"###
//let html = """
//<a href="https://twitter.com/intent/tweet?text=Introducing%20XCTUnimplemented&amp;url=https://www.pointfree.co/blog/posts/77-introducing-xctunimplemented&amp;via=pointfreeco" onclick="window.open(
//  &quot;https://twitter.com/intent/tweet?text=Introducing%20XCTUnimplemented&amp;url=https://www.pointfree.co/blog/posts/77-introducing-xctunimplemented&amp;via=pointfreeco&quot;,
//  &quot;newwindow&quot;,
//  &quot;width=500,height=500&quot;
//);" target="_blank" rel="noopener noreferrer" class="lh-1 relative medium inline-block align-top" style="-webkit-box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing:border-box;-o-box-sizing:border-box;box-sizing:border-box;color:#ffffff;background-color:#0c7abf;height:20px;padding-top:1px;padding-right:8px;padding-bottom:1px;padding-left:6px;border-top-left-radius:3px;border-top-right-radius:3px;border-bottom-right-radius:3px;border-bottom-left-radius:3px;font-size:16px"><img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCA3MiA3MiI+PHBhdGggZmlsbD0ibm9uZSIgZD0iTTAgMGg3MnY3MkgweiIvPjxwYXRoIGNsYXNzPSJpY29uIiBmaWxsPSIjZmZmIiBkPSJNNjguODEyIDE1LjE0Yy0yLjM0OCAxLjA0LTQuODcgMS43NDQtNy41MiAyLjA2IDIuNzA0LTEuNjIgNC43OC00LjE4NiA1Ljc1Ny03LjI0My0yLjUzIDEuNS01LjMzIDIuNTkyLTguMzE0IDMuMTc2QzU2LjM1IDEwLjU5IDUyLjk0OCA5IDQ5LjE4MiA5Yy03LjIzIDAtMTMuMDkyIDUuODYtMTMuMDkyIDEzLjA5MyAwIDEuMDI2LjExOCAyLjAyLjMzOCAyLjk4QzI1LjU0MyAyNC41MjcgMTUuOSAxOS4zMTggOS40NCAxMS4zOTZjLTEuMTI1IDEuOTM2LTEuNzcgNC4xODQtMS43NyA2LjU4IDAgNC41NDMgMi4zMTIgOC41NTIgNS44MjQgMTAuOS0yLjE0Ni0uMDctNC4xNjUtLjY1OC01LjkzLTEuNjQtLjAwMi4wNTYtLjAwMi4xMS0uMDAyLjE2MyAwIDYuMzQ1IDQuNTEzIDExLjYzOCAxMC41MDQgMTIuODQtMS4xLjI5OC0yLjI1Ni40NTctMy40NS40NTctLjg0NSAwLTEuNjY2LS4wNzgtMi40NjQtLjIzIDEuNjY3IDUuMiA2LjUgOC45ODUgMTIuMjMgOS4wOS00LjQ4MiAzLjUxLTEwLjEzIDUuNjA1LTE2LjI2IDUuNjA1LTEuMDU1IDAtMi4wOTYtLjA2LTMuMTIyLS4xODQgNS43OTQgMy43MTcgMTIuNjc2IDUuODgyIDIwLjA2NyA1Ljg4MiAyNC4wODMgMCAzNy4yNS0xOS45NSAzNy4yNS0zNy4yNSAwLS41NjUtLjAxMy0xLjEzMy0uMDM4LTEuNjkzIDIuNTU4LTEuODQ3IDQuNzc4LTQuMTUgNi41MzItNi43NzR6Ii8+PC9zdmc+" alt="" style="width:14px;height:14px;font-size:16px;top:1px" class="relative inline-block"><span style="font-family:'Helvetica Neue',Arial,sans-serif;font-size:11px;line-height:18px;margin-left:3px" class="inline-block align-top">Tweet</span></a>
//"""
let html = """
<a href="url">link text</a>
<br>
"""

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

let birds = DocumentRenderer(minify: false, indent: 2).render(doc)
print(birds)


//: [Next](@next)
