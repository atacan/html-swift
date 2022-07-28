import HtmlSwift
import SwiftSoup
import SwiftFormat


func content(of element: Element) -> [String] {
    let children = element.getChildNodes()
    var output = [String]()
    for child in children {
        if let n = child as? DataNode {
            let data = n.getWholeData() |> addQuote
            output.append(data)
        }
        if let n = child as? TextNode {
            let text = n.text() |> addQuote
            output.append(text)
        }
        if let n = child as? Element {
            let nextElement = BasicElement(element: n)
            output.append(nextElement.swiftCode)
        }
    }
    return output
}


/// most common element in swift-html syntax
/// `.name(attributes : [.key("value"), .key("value")], "text node text", children-repeat)`
struct BasicElement {
    let element: SwiftSoup.Element
    var swiftContent: [String] = []
    var swiftCode: String = ""
    
    init(element: Element) {
        self.element = element
        
        swiftContent.append(attributesArgument)
        
        childrenCode()
        
        let content = swiftContent
            .filter { !$0.isEmpty}
            .joined(separator: ", ")
        
        self.swiftCode = nameStart + content + nameEnd
    }
    
    var nameStart: String {
        "\n.\(element.nodeName())(\n"
    }
    
    var nameEnd: String {
        "\n)"
    }
    
    var attributesArgument: String {
        if let attributes = element.getAttributes(),
           attributes.size() > 0 {
            let attributeList = attributes.map { attribute in
                let key = attribute.getKey()
                let value = attribute.getValue() |> addQuote
                return ".\(key)(\(value))"
            }
                .joined(separator: ", ")
            return "attributes: [\(attributeList)]"
        }
        return ""
    }
    
    mutating func childrenCode() {
        let childContent = content(of: element)
        swiftContent.append(contentsOf: childContent)
    }
    
}

//let html = #"<div><p>The <abbr title="Amazing Inc.">AI</abbr> was founded in 1945.</p></div>"#
let html = #"<div><p>The <abbr title="Amazing Inc.">AI</abbr> was founded in 1945.</p><a href="url">link text</a></div>"#
let soup = try SwiftSoup.parse(html)
let element = soup.child(0)//.child(1).child(0).child(0).child(0)
let swiftCode = BasicElement(element: element).swiftCode
//print(swiftCode)
print(try SwiftFormat.format(swiftCode, rules: FormatRules.default,
                             options: FormatOptions(
                                 wrapArguments: .beforeFirst,
                                 wrapCollections: .beforeFirst
                             ),
                             lineRange: nil))
