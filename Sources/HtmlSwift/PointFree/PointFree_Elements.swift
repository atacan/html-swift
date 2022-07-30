//
// https://github.com/atacan
// 28.07.22
	
import SwiftSoup

/// most common element in swift-html syntax
/// `.nodename(attributes : [.key("value"), .key("value")], "text node text", children-repeat)`
struct BasicElement {
    let element: SwiftSoup.Element
    var swiftCode: String = ""
    
    init(element: Element) {
        self.element = element
        self.swiftCode = swiftCodeOf(element: element, with: attributesArgument)
    }
    
    var attributesArgument: String {
        if let attributes = element.getAttributes(),
           attributes.size() > 0
        {
            let attributeList = attributes.map { attribute in
                codeOfAttribute(attribute, of: element)
            }
            .joined(separator: ", ")
            return "attributes: [\(attributeList)]"
        }
        return ""
    }
}

struct MetaElement {
    let element: SwiftSoup.Element
    var swiftCode: String = ""
    
    init(element: Element) {
        self.element = element
        self.swiftCode = swiftCodeOf(element: element, with: attributesArgument)
    }
    
    var attributesArgument: String {
        if let attributes = element.getAttributes(), attributes.size() > 0 {
            var attributeDict = [String: String]()
            
            attributes.forEach { attribute in
                attributeDict[attribute.getKey()] = codeOfAttribute(attribute, of: element)
            }
            
            var attributeList = [String]()
            
            // name has to precede content
            if attributeDict.keys.contains("name"), attributeDict.keys.contains("content") {
                if let nameAttribute = attributeDict["name"], let contentAttribute = attributeDict["content"] {
                    attributeList.append(nameAttribute)
                    attributeList.append(contentAttribute)
                    let attributeCode = attributeList.joined(separator: ", ")
                    return "\(attributeCode)"
                }
            } else {
                let attributeCode = attributeDict.values.joined(separator: ", ")
                return "attributes: [\(attributeCode)]"
            }
        }
        return ""
    }
}

private func nameStart(_ element: Element) -> String {
    "\n.\(element.nodeName())(\n"
}

private func nameEnd(_ element: Element) -> String {
    "\n)"
}

private func swiftCodeOf(element: Element, with attributesArgument: String) -> String {
    var swiftContent = [String]()
    
    swiftContent.append(attributesArgument)
    
    let childContent = content(of: element)
    swiftContent.append(contentsOf: childContent)
    
    let content = swiftContent
        .filter { !$0.isEmpty }
        .joined(separator: ", ")
    
    return nameStart(element) + content + nameEnd(element)
}

private func content(of element: Element) -> [String] {
    let children = element.getChildNodes()
    var output = [String]()
    for child in children {
        if let n = child as? DataNode {
            let data = n.getWholeData() |> addQuote
            output.append(data)
        }
        if let n = child as? TextNode {
            let text = n.text().trimmingCharacters(in: .whitespacesAndNewlines)
            if text.isEmpty {
                output.append(String())
            } else {
                output.append(text |> addQuote)
            }
        }
        if let n = child as? Element {
            switch n.nodeName() {
            case "br":
                output.append(".br")
            case "meta":
                output.append(MetaElement(element: n).swiftCode)
            default:
                output.append(BasicElement(element: n).swiftCode)
            }
        }
    }
    return output
}
