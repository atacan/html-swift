import HtmlSwift
import SwiftSoup
import SwiftFormat
import Html


//let html = #"<div><p>The <abbr title="Amazing Inc.">AI</abbr> was founded in 1945.</p></div>"#
//let html = #"<div><h1>Heading One where</h1><p>The <abbr title="Amazing Inc.">AI</abbr> was founded in 1945.</p><br><a href="url">link text</a><fieldset disabled name="blob"></fieldset></div>"#
let html = #"""
<head>
  <meta charset="UTF-8">
  <meta name="description" content="Free Web tutorials">
  <meta name="keywords" content="HTML, CSS, JavaScript">
  <meta content="John Doe" name="author" >
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
"""#
//let html = """
//        <address>
//        Written by <a href="mailto:webmaster@example.com">Jon Doe</a>.<br>
//        Visit us at:<br>
//        Example.com<br>
//        Box 564, Disneyland<br>
//        USA
//        </address>
//"""

let soup = try SwiftSoup.parse(html)
let element = soup.child(0)//.child(1).child(0).child(0).child(0)
let swiftCode = try convertToPointFree(html: html, component: .onlyHead)
print(swiftCode)
try "import Cool; let hello = \"World\" " |> swiftFormat
"".isEmpty

let pointFree: Html.Node = .document(
    .html(
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
        ),
        .body(
        )
    )
)

print(render(pointFree))
