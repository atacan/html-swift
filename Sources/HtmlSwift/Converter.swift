// https://github.com/atacan/
// 28.05.22

// Based on https://github.com/vapor-community/HTMLKit/blob/main/Sources/HTMLKit/Internal/Features/Conversion/Converter.swift
// // rewritten func decode(element: XMLNode) -> String
// // indentation removed and SwiftFormat is used

import Foundation
#if canImport(FoundationXML)
import FoundationXML
#endif

import SwiftFormat
import SwiftHtml

@available(macOS 11.0, *)
public class Converter {
    public enum Extension: String {
        case html
        case leaf
    }
    
    public enum Output: String {
        case print
        case file
    }
    
    public enum Errors: Error {
        case rootNotFound
    }
    
    public static let `default` = Converter()
    
    private init() {}
    
    /// The whole html string needs to be inside a tag.
    /// For example, multiple `div`s will give an error. They need to be inside another `div`.
    public func convert(html: String) throws -> String {
        let document = try XMLDocument(xmlString: html, options: [.documentIncludeContentTypeDeclaration])
        guard let root = document.rootElement() else {
            throw Errors.rootNotFound
        }
        
        var content = Converter.default.decode(element: root)
        content = try format(content) // SwiftFormat library
        return content
    }
    
    @StringBuilder private func decode(attribute: XMLNode) -> String {
        switch attribute.localName {
        // MARK: - Bool

        case "async", "autocomplete", "checked", "contenteditable":
            ValueBasicTypeProperty<Bool>(node: attribute).build()
        case "spellcheck":
            ValueBasicTypeProperty<Bool>(node: attribute).build()
        
        // MARK: - Int

        case "cols", "colspan", "high", "low", "optimum", "rows", "rowspan", "size", "span", "step", "tabindex":
            ValueBasicTypeProperty<Int>(node: attribute).build()
        
        // MARK: - Double

        case "height", "width":
            ValueBasicTypeProperty<Double>(node: attribute).build()
        
        // MARK: - No Value

        case "autofocus", "autoplay", "controls", "default", "defer", "disabled", "download", "hidden", "ismap", "loop", "multiple", "muted", "novalidate", "readonly", "required", "selected":
            EmptyProperty(node: attribute).build()
        
        // MARK: - Custom Type

        case "autocapitalize":
            TypeProperty<Capitalization>(node: attribute).build()
        case "dir":
            TypeProperty<TextDirection>(node: attribute).build()
        case "draggable":
            TypeProperty<Draggable>(node: attribute).build()
        case "enctype":
            TypeProperty<Enctype>(node: attribute).build()
        case "http-equiv":
            TypeProperty<SwiftHtml.Meta.HttpEquiv>(node: attribute).build()
        case "kind":
            TypeProperty<Track.Kind>(node: attribute).build()
        case "method":
            TypeProperty<SwiftHtml.Method>(node: attribute).build()
        case "name":
            if let parent = attribute.parent {
                switch parent.localName {
                case "meta":
                    TypeProperty<Meta.Name>(node: attribute).build()
                default:
                    ValueProperty(node: attribute).build()
                }
            }
        case "preload":
            TypeProperty<Audio.Preload>(node: attribute).build()
        case "referrerpolicy":
            TypeProperty<RefererPolicy>(node: attribute).build()
        case "rel":
            TypeProperty<Link.Rel>(node: attribute).build()
        case "reversed":
            TypeProperty<Ol.`Type`>(node: attribute).build()
        case "sandbox":
            TypeProperty<IframeSandbox>(node: attribute).build()
        case "scope":
            TypeProperty<Th.Scope>(node: attribute).build()
        case "shape":
            TypeProperty<Area.Shape>(node: attribute).build()
        case "start":
            TypeProperty<Ol.`Type`>(node: attribute).build()
        case "target":
            TypeProperty<Target>(node: attribute).build()
        case "translate":
            TypeProperty<Translate>(node: attribute).build()
        case "type":
            if let parent = attribute.parent {
                switch parent.localName {
                case "input":
                    TypeProperty<Input.`Type`>(node: attribute).build()
                case "button":
                    TypeProperty<Button.`Type`>(node: attribute).build()
//                case "link":
//                    TypeProperty<Medias>(node: attribute).build()
//                case "script":
//                    TypeProperty<Medias>(node: attribute).build()
//                case "audio":
//                    TypeProperty<Medias>(node: attribute).build()
                default:
                    ValueProperty(node: attribute).build()
                }
            }
        case "wrap":
            TypeProperty<Textarea.Wrap>(node: attribute).build()
        
        // MARK: - String

        case "accesskey", "accept", "action", "alt", "cite", "class", "content", "data", "datetime", "for", "form", "formaction", "headers", "href", "hreflang", "id", "label", "lang", "list", "max", "media", "min", "open", "pattern", "ping", "placeholder", "poster", "sizes", "src", "style", "title", "value", "charset":
            ValueProperty(node: attribute).build()
        
        // TODO: list of doubles
        case "coords":
            ValueProperty(node: attribute).build()
        
        // TODO: doesn't exist
        case "enterkeyhint", "inputmode", "is", "itemid", "itemproperty", "itemref", "itemscope", "itemtype", "nonce", "part", "role", "slot", "property":
            ValueProperty(node: attribute).build()
        
        default:
            CustomProperty(node: attribute).build()
        }
    }
    
    @StringBuilder private func decode(element: XMLNode) -> String {
        switch element.kind {
        case .text:
            
            TextElement(node: element).build()
            
        case .comment:
            
            CommentElement(node: element).build()
            
        default:
            
            if let element = element as? XMLElement {
                switch element.localName {
                case "img":
                    ImageElement(element: element).build()
                case "link":
                    LinkElement(element: element).build()
                default:
                    if let children = element.children {
                        if children.first?.kind == .text {
                            ContentTextElement(element: element).build()
                        } else {
                            ContentElement(element: element).build()
                        }
                    } else {
                        EmptyElement(element: element).build()
                    }
                }
            }
        }
    }
}

@available(macOS 11.0, *)
extension Converter {
    private struct CommentElement {
        private var comment: String? {
            guard let comment = node.stringValue else {
                return nil
            }
            
            return comment
        }
        
        private let node: XMLNode
        
        internal init(node: XMLNode) {
            self.node = node
        }
        
        @StringBuilder internal func build() -> String {
            if let comment = comment {
                "Comment(\"\(comment)\")\n"
            }
        }
    }
    
    private struct TextElement {
        private var text: String? {
            guard let text = node.stringValue else {
                return nil
            }
            
            return text
        }
        
        private let node: XMLNode
        
        internal init(node: XMLNode) {
            self.node = node
        }
        
        @StringBuilder internal func build() -> String {
            if let text = text {
                if node.parent?.localName != "pre" {
                    let cleanText = text.trimmingCharacters(in: .whitespacesAndNewlines)
                        .condensingWhitespace()
                    if cleanText.contains("\"") {
                        "Text(#\"\(cleanText)\")#\n"
                    } else {
                        "Text(\"\(cleanText)\")\n"
                    }
                } else {
                    "Text(\"\"\"\n\(text)\"\"\")\n"
                }
            }
        }
    }
    
    private struct ArgumentElement {
        private var text: String? {
            guard let text = node.stringValue else {
                return nil
            }
            
            return text
        }
        
        private let node: XMLNode
        
        internal init(node: XMLNode) {
            self.node = node
        }
        
        @StringBuilder internal func build() -> String {
            if let text = text {
                if node.parent?.localName != "pre" {
                    let cleanText = text.trimmingCharacters(in: .whitespacesAndNewlines)
                        .condensingWhitespace()
                    if cleanText.contains("\"") {
                        "#\"\(cleanText)\"#\n"
                    } else {
                        "\"\(cleanText)\"\n"
                    }
                } else {
                    "\"\"\"\n\(text)\"\"\"\n"
                }
            }
        }
    }
    
    private struct ContentTextElement {
        private var name: String? {
            guard let name = element.name else {
                return nil
            }
            
            return name.capitalized
        }
        
        private var attributes: [String]? {
            guard let attributes = element.attributes else {
                return nil
            }
            
            return attributes.map { attribute in
                Converter.default.decode(attribute: attribute)
            }
        }
        
        private var content: [String]? {
            guard let children = element.children else {
                return nil
            }
            
            return children.compactMap { child in
                ArgumentElement(node: child).build()
            }
        }
        
        private var level: Int {
            return element.level
        }
        
        private let element: XMLElement
        
        internal init(element: XMLElement) {
            self.element = element
        }
        
        @StringBuilder internal func build() -> String {
            if let name = name {
                "\(name)("
                
                if let content = content {
                    content.joined().trimmingCharacters(in: .whitespacesAndNewlines)
                }
                
                ")\n"
                
                if let attributes = attributes {
                    "\(attributes.joined(separator: ""))"
                }
            }
        }
        
        @StringBuilder internal func build(verbatim: String? = nil) -> String {
            if let verbatim = verbatim {
                "\(verbatim) {\n"
                
                if let content = content {
                    content.joined()
                }
                
                "}\n"
                
                if let attributes = attributes {
                    "\(attributes.joined(separator: ""))"
                }
            }
        }
    }
    
    private struct ContentElement {
        private var name: String? {
            guard let name = element.name else {
                return nil
            }
            
            return name.capitalized
        }
        
        private var attributes: [String]? {
            guard let attributes = element.attributes else {
                return nil
            }
            
            return attributes.map { attribute in
                Converter.default.decode(attribute: attribute)
            }
        }
        
        private var content: [String]? {
            guard let children = element.children else {
                return nil
            }
            
            return children.map { child in
                Converter.default.decode(element: child)
            }
        }
        
        private var level: Int {
            return element.level
        }
        
        private let element: XMLElement
        
        internal init(element: XMLElement) {
            self.element = element
        }
        
        @StringBuilder internal func build() -> String {
            if let name = name {
                "\(name) {\n"
                
                if let content = content {
                    content.joined()
                }
                
                "}\n"
                
                if let attributes = attributes {
                    "\(attributes.joined(separator: ""))"
                }
            }
        }
        
        @StringBuilder internal func build(verbatim: String? = nil) -> String {
            if let verbatim = verbatim {
                "\(verbatim) {\n"
                
                if let content = content {
                    content.joined()
                }
                
                "}\n"
                
                if let attributes = attributes {
                    "\(attributes.joined(separator: ""))"
                }
            }
        }
    }
    
    private struct EmptyElement {
        private var name: String? {
            guard let name = element.name else {
                return nil
            }
            
            return name.capitalized
        }
        
        private var attributes: [String]? {
            guard let attributes = element.attributes else {
                return nil
            }
            
            return attributes.map { attribute in
                Converter.default.decode(attribute: attribute)
            }
        }
        
        private var level: Int {
            return element.level
        }
        
        private let element: XMLElement
        
        internal init(element: XMLElement) {
            self.element = element
        }
        
        @StringBuilder internal func build() -> String {
            if let name = name {
                "\(name)()\n"
                
                if let attributes = attributes {
                    "\t\(attributes.joined(separator: "\t"))"
                }
            }
        }
        
        @StringBuilder internal func build(verbatim: String? = nil) -> String {
            if let verbatim = verbatim {
                "\(verbatim)()\n"
                
                if let attributes = attributes {
                    "\t\(attributes.joined(separator: "\t"))"
                }
            }
        }
    }
    
    private struct ImageElement {
        private var name: String? {
            guard let name = element.name else {
                return nil
            }
            
            return name.capitalized
        }
        
        private var attributes: [XMLNode]? {
            guard let attributes = element.attributes else {
                return nil
            }
            
            return attributes
        }
        
        private var level: Int {
            return element.level
        }
        
        private let element: XMLElement
        
        internal init(element: XMLElement) {
            self.element = element
        }
        
        internal func build() -> String {
            if let name = name {
                if let attributes = attributes {
                    var output = name + "(src: \"?src?\", alt: \"?alt?\")"
                    for attribute in attributes {
                        if attribute.name == "src" {
                            output = output.replacingOccurrences(of: "?src?", with: attribute.stringValue!)
                        } else if attribute.name == "alt" {
                            output = output.replacingOccurrences(of: "?alt?", with: attribute.stringValue!)
                        } else {
                            output += "\n" + ValueProperty(node: attribute).build()
                        }
                    }
                    return output.replacingOccurrences(of: ", alt: \"?alt?\"", with: "")
                }
            }
            return ""
        }
    }
    
    private struct LinkElement {
        private var name: String? {
            guard let name = element.name else {
                return nil
            }
            
            return name.capitalized
        }
        
        private var attributes: [XMLNode]? {
            guard let attributes = element.attributes else {
                return nil
            }
            
            return attributes
        }
        
        private var level: Int {
            return element.level
        }
        
        private let element: XMLElement
        
        internal init(element: XMLElement) {
            self.element = element
        }
        
        internal func build() -> String {
            if let name = name {
                if let attributes = attributes {
                    var output = name + "(rel: ?rel?)"
                    for attribute in attributes {
                        if attribute.name == "rel" {
                            if let type = Link.Rel(rawValue: attribute.stringValue!.lowercased()) {
                                output = output.replacingOccurrences(of: "?rel?", with: ".\(type)")
                            }
                        } else {
                            output += "\n" + ValueProperty(node: attribute).build()
                        }
                    }
                    return output
                }
            }
            return ""
        }
    }
    
    private struct ValueBasicTypeProperty<T: HaveInit> {
        private var name: String? {
            guard let name = node.name else {
                return nil
            }
            
            return name
        }
        
        private var value: String? {
            guard let value = node.stringValue else {
                return nil
            }
            
            return value
        }
        
        private let node: XMLNode
        
        internal init(node: XMLNode) {
            self.node = node
        }
        
        @StringBuilder internal func build() -> String {
            if let name = name, let value = value {
                if let tValue = T(value) {
                    ".\(name)(\(tValue))\n"
                }
                
            } else if let name = name {
                ".\(name)()"
            }
        }
        
        @StringBuilder internal func build(verbatim: String? = nil) -> String {
            if let verbatim = verbatim, let value = value {
                ".\(verbatim)(\"\(value)\")\n"
                
            } else if let verbatim = verbatim {
                ".\(verbatim)()"
            }
        }
    }
    
    private struct ValueProperty {
        private var name: String? {
            guard let name = node.name else {
                return nil
            }
            
            return name
        }
        
        private var value: String? {
            guard let value = node.stringValue else {
                return nil
            }
            
            return value
        }
        
        private let node: XMLNode
        
        internal init(node: XMLNode) {
            self.node = node
        }
        
        @StringBuilder internal func build() -> String {
            if let name = name, let value = value {
                if value == "false" || value == "true" {
                    ".\(name)(\(value))\n"
                } else {
                    ".\(name)(\"\(value)\")\n"
                }
                
            } else if let name = name {
                ".\(name)()"
            }
        }
        
        @StringBuilder internal func build(verbatim: String? = nil) -> String {
            if let verbatim = verbatim, let value = value {
                ".\(verbatim)(\"\(value)\")\n"
                
            } else if let verbatim = verbatim {
                ".\(verbatim)()"
            }
        }
    }
    
    private struct EmptyProperty {
        private var name: String? {
            guard let name = node.name else {
                return nil
            }
            
            return name
        }
        
        private let node: XMLNode
        
        internal init(node: XMLNode) {
            self.node = node
        }
        
        @StringBuilder internal func build() -> String {
            if let name = name {
                ".\(name)()\n"
            }
        }
        
        @StringBuilder internal func build(verbatim: String? = nil) -> String {
            if let verbatim = verbatim {
                ".\(verbatim)()\n"
            }
        }
    }
    
    private struct TypeProperty<T: RawRepresentable> {
        private var name: String? {
            guard let name = node.name else {
                return nil
            }
            
            return name
        }
        
        private var value: String? {
            guard let value = node.stringValue else {
                return nil
            }
            
            if let type = T(rawValue: value.lowercased() as! T.RawValue) {
                return ".\(type)"
            }
            
            return ""
        }
        
        private let node: XMLNode
        
        internal init(node: XMLNode) {
            self.node = node
        }
        
        @StringBuilder internal func build() -> String {
            if let name = name, let value = value {
                ".\(name)(\(value))\n"
                
            } else if let name = name {
                ".\(name)()"
            }
        }
        
        @StringBuilder internal func build(verbatim: String? = nil) -> String {
            if let verbatim = verbatim, let value = value {
                ".\(verbatim)(\(value))\n"
                
            } else if let verbatim = verbatim {
                ".\(verbatim)()"
            }
        }
    }
    
    private struct CustomProperty {
        private var name: String? {
            guard let name = node.name else {
                return nil
            }
            
            return name
        }
        
        private var value: String? {
            guard let value = node.stringValue else {
                return nil
            }
            
            return value
        }
        
        private let node: XMLNode
        
        internal init(node: XMLNode) {
            self.node = node
        }
        
        @StringBuilder internal func build() -> String {
            if let name = name {
                ".custom(key: \"\(name)\", value: \"\(value ?? "")\")\n"
            }
        }
    }
}
