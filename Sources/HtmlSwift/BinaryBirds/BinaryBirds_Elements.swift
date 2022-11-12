//
// https://github.com/atacan
// 30.07.22

import SwiftHtml
import SwiftSoup

/// if the only child is a text node, then use normal parenthesis
/// `H1("Lorem ipsum")`
struct BinaryBasicElement {
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
                codeOfAttributeBinaryBirds(attribute, of: element)
            }
            .joined()
            return "\(attributeList)"
        }
        return ""
    }
}

/// if the only child is a text node, then use normal parenthesis
/// `H1("Lorem ipsum")`
struct ParentOfOnlyText {
    let element: SwiftSoup.Element
    var swiftCode: String = ""

    init(element: Element) {
        self.element = element
        self.swiftCode = nameStart(element, brace: .rounded)
        + ((element.ownText() + element.data()) |> addQuote)
            + nameEnd(element, brace: .rounded)
            + attributesArgument
    }

    var attributesArgument: String {
        if let attributes = element.getAttributes(),
           attributes.size() > 0
        {
            let attributeList = attributes.map { attribute in
                codeOfAttributeBinaryBirds(attribute, of: element)
            }
            .joined()
            return "\(attributeList)"
        }
        return ""
    }
}

/// if the only child is a text node, then use normal parenthesis
/// `H1("Lorem ipsum")`
struct Childless {
    let element: SwiftSoup.Element
    var swiftCode: String = ""

    init(element: Element) {
        self.element = element
        self.swiftCode = swiftCodeOf(element: element, with: attributesArgument, brace: .rounded)
    }

    var attributesArgument: String {
        if let attributes = element.getAttributes(),
           attributes.size() > 0
        {
            let attributeList = attributes.map { attribute in
                codeOfAttributeBinaryBirds(attribute, of: element)
            }
            .joined()
            return "\(attributeList)"
        }
        return ""
    }
}

/// <link> element attribute structure is different
/// `Link(rel: .stylesheet).href("./css/style.css")`
struct LinkElement {
    let element: SwiftSoup.Element
    var swiftCode: String = ""
    var relArgument: String = ""

    init(element: Element) {
        self.element = element
        let attributes = attributesArgument()
        self.swiftCode = nameStart(element, brace: .rounded)
            + "rel: \(relArgument)"
            + nameEnd(element, brace: .rounded)
            + attributes
    }

    mutating func attributesArgument() -> String {
        if let attributes = element.getAttributes(),
           attributes.size() > 0
        {
            let attributeList = attributes.map { attribute in
                guard attribute.getKey() != "rel" else {
                    relArgument = EnumAttribute<SwiftHtml.Link.Rel>(attribute: attribute).value(of: attribute) ?? (attribute.getValue() |> addQuote)
                    return String()
                }
                return codeOfAttributeBinaryBirds(attribute, of: element)
            }
            .filter { !$0.isEmpty }
            .joined()
            return "\(attributeList)"
        }
        return ""
    }
}

/// <img> element attribute structure is different
/// `Img(src: "./images/swift.png", alt: "Swift Logo")`
struct ImageElement {
    let element: SwiftSoup.Element
    var swiftCode: String = ""
    var srcArgument: String = ""
    var altArgument: String = ""

    init(element: Element) {
        self.element = element
        let attributes = attributesArgument()
        self.swiftCode = nameStart(element, brace: .rounded)
            + [srcArgument, altArgument].joined(separator: ", ")
            + nameEnd(element, brace: .rounded)
            + attributes
    }

    mutating func attributesArgument() -> String {
        if let attributes = element.getAttributes(),
           attributes.size() > 0
        {
            let attributeList = attributes.map { attribute in
                guard attribute.getKey() != "src" else {
                    srcArgument = FunctionArgumentAttribute(attribute: attribute).swiftCode
                    return String()
                }
                guard attribute.getKey() != "alt" else {
                    altArgument = FunctionArgumentAttribute(attribute: attribute).swiftCode
                    return String()
                }
                return codeOfAttributeBinaryBirds(attribute, of: element)
            }
            .filter { !$0.isEmpty }
            .joined()
            return "\(attributeList)"
        }
        return ""
    }
}

enum BraceType {
    case rounded
    case curly
}

private func nameStart(_ element: Element, brace: BraceType = .curly) -> String {
    let myBrace = brace == .rounded ? "(" : "{\n"
    return "\(element.nodeName().capitalized)\(myBrace)"
}

private func nameEnd(_ element: Element, brace: BraceType = .curly) -> String {
    let myBrace = brace == .rounded ? ")" : "\n}"
    return "\(myBrace)"
}

private func swiftCodeOf(element: Element, with attributesArgument: String, brace: BraceType = .curly) -> String {
    var swiftContent = [String]()

    let childContent = content(of: element)
    swiftContent.append(contentsOf: childContent)

    let content = swiftContent
        .filter { !$0.isEmpty }
        .joined(separator: "\n")

    return nameStart(element, brace: brace)
        + content
        + nameEnd(element, brace: brace)
        + attributesArgument
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
            var start = "Text("
            let text = n.text().trimmingCharacters(in: .whitespacesAndNewlines)
            var end = ")"

            if n.parent()?.getChildNodes().count == 1 {
                start = ""
                end = ""
            }

            if text.isEmpty {
                output.append(String())
            } else {
                output.append("\(start)\(text |> addQuote)\(end)")
            }
        }

        if let n = child as? Element {
            let grandChildren = n.getChildNodes()
            // if the element doesn't have any childred
            if n.nodeName() == "link" {
                output.append(LinkElement(element: n).swiftCode)
            } else if n.nodeName() == "img" {
                output.append(ImageElement(element: n).swiftCode)
            } else if grandChildren.count == 0 {
                output.append(Childless(element: n).swiftCode)
                // if the only child is a text node, syntax is different
            } else if grandChildren.count == 1 {
                if grandChildren[0] is TextNode || grandChildren[0] is DataNode {
                    output.append(ParentOfOnlyText(element: n).swiftCode)
                } else {
                    output.append(BinaryBasicElement(element: n).swiftCode)
                }
            } else {
                output.append(BinaryBasicElement(element: n).swiftCode)
            }
        }
    }
    return output
}
