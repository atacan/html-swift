# HtmlSwiftPointFree

Input an Html code and get the Swift code for the following DSLs 
* <a href="https://github.com/pointfreeco/swift-html">pointfreeco/swift-html</a> 
* <a href="https://github.com/BinaryBirds/swift-html">BinaryBirds/swift-html</a>  

to generate that Html code.
## How to Use it
### Mac App
https://github.com/atacan/Dime-a-Dozen
### Package
```swift
import HtmlSwiftPointFree
let htmlInput = """
<a href="url">link text</a>
<br>
"""
let swiftOutput = try convertToPointFree(html: htmlInput)
```
->
```swift
.html(
    .head(
    ),
    .body(
        .a(
            attributes: [
                .href("url"),
            ],
            "link text"
        ),
        .br
    )
)
```
## Use Cases
* You have an html code base, maybe with a templating language, but you want to switch to pure Swift DSL.
* You are using a CSS framework such as Bootstrap, and you copy paste the ready-made components you find.   
  
Without a converter, the only way to switch to the DSL world is to look at your html code on one side and type the Swift code for it on the other side.
## Contribution
* Tests are incomplete. We need to test all the elements and attributes
* The code has a lot of repeated components. Those can be put in functions maybe.
