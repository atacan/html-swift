// https://github.com/atacan/
// 28.05.22

// Based on https://github.com/vapor-community/HTMLKit/blob/main/Sources/HTMLKit/Internal/Features/Conversion/Converter.swift
// // rewritten func decode(element: XMLNode) -> String
// // indentation removed and SwiftFormat is used

import Foundation
#if canImport(FoundationXML)
import FoundationXML
#endif

import SwiftHtml
import SwiftFormat

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
        case "accesskey":
            ValueProperty(node: attribute).build()
        case "accept":
            ValueProperty(node: attribute).build()
        case "action":
            ValueProperty(node: attribute).build()
        case "alt":
            ValueProperty(node: attribute).build()
        case "async":
            EmptyProperty(node: attribute).build()
        case "autocapitalize":
            TypeProperty<Capitalization>(node: attribute).build()
        case "autocomplete":
            ValueProperty(node: attribute).build()
        case "autofocus":
            EmptyProperty(node: attribute).build()
        case "autoplay":
            EmptyProperty(node: attribute).build()
        case "checked":
            EmptyProperty(node: attribute).build()
        case "cite":
            ValueProperty(node: attribute).build()
        case "class":
            ValueProperty(node: attribute).build()
        case "cols":
            ValueProperty(node: attribute).build()
        case "colspan":
            ValueIntegerProperty(node: attribute).build()
        case "content":
            ValueProperty(node: attribute).build()
        case "contenteditable":
            ValueProperty(node: attribute).build()
        case "controls":
            EmptyProperty(node: attribute).build()
        case "coords":
            ValueProperty(node: attribute).build()
        case "data":
            ValueProperty(node: attribute).build()
        case "datetime":
            ValueProperty(node: attribute).build()
        case "default":
            EmptyProperty(node: attribute).build()
        case "defer":
            EmptyProperty(node: attribute).build()
        case "dir":
            TypeProperty<Direction>(node: attribute).build()
        case "disabled":
            EmptyProperty(node: attribute).build()
        case "download":
            EmptyProperty(node: attribute).build()
        case "draggable":
            ValueProperty(node: attribute).build()
        case "enctype":
            TypeProperty<Encoding>(node: attribute).build()
        case "enterkeyhint":
            TypeProperty<Hint>(node: attribute).build()
        case "for":
            ValueProperty(node: attribute).build()
        case "form":
            ValueProperty(node: attribute).build()
        case "formaction":
            ValueProperty(node: attribute).build()
        case "headers":
            ValueProperty(node: attribute).build()
        case "height":
            ValueProperty(node: attribute).build()
        case "hidden":
            EmptyProperty(node: attribute).build()
        case "high":
            ValueProperty(node: attribute).build()
        case "href":
            ValueProperty(node: attribute).build()
        case "hreflang":
            TypeProperty<Language>(node: attribute).build()
        case "id":
            ValueProperty(node: attribute).build()
        case "ismap":
            EmptyProperty(node: attribute).build()
        case "inputmode":
            ValueProperty(node: attribute).build()
        case "is":
            ValueProperty(node: attribute).build()
        case "itemid":
            ValueProperty(node: attribute).build()
        case "itemproperty":
            ValueProperty(node: attribute).build()
        case "itemref":
            ValueProperty(node: attribute).build()
        case "itemscope":
            ValueProperty(node: attribute).build()
        case "itemtype":
            ValueProperty(node: attribute).build()
        case "kind":
            ValueProperty(node: attribute).build()
        case "label":
            ValueProperty(node: attribute).build()
        case "lang":
            TypeProperty<Language>(node: attribute).build()
        case "list":
            ValueProperty(node: attribute).build()
        case "loop":
            EmptyProperty(node: attribute).build()
        case "low":
            ValueProperty(node: attribute).build()
        case "max":
            ValueProperty(node: attribute).build()
        case "media":
            ValueProperty(node: attribute).build()
        case "method":
            TypeProperty<Method>(node: attribute).build()
        case "min":
            ValueProperty(node: attribute).build()
        case "multiple":
            EmptyProperty(node: attribute).build()
        case "muted":
            EmptyProperty(node: attribute).build()
        case "name":
            
            if let parent = attribute.parent {
                
                switch parent.localName {
                case "meta":
//                    TypeProperty<Names>(node: attribute).build()
                    TypeProperty<Meta.Name>(node: attribute).build()
                default:
                    ValueProperty(node: attribute).build()
                }
            }
            
        case "nonce":
            ValueProperty(node: attribute).build()
        case "novalidate":
            EmptyProperty(node: attribute).build()
        case "open":
            ValueProperty(node: attribute).build()
        case "optimum":
            ValueProperty(node: attribute).build()
        case "pattern":
            ValueProperty(node: attribute).build()
        case "part":
            ValueProperty(node: attribute).build()
        case "ping":
            ValueProperty(node: attribute).build()
        case "placeholder":
            ValueProperty(node: attribute).build()
        case "poster":
            ValueProperty(node: attribute).build()
        case "preload":
            ValueProperty(node: attribute).build()
        case "readonly":
            EmptyProperty(node: attribute).build()
        case "referrerpolicy":
            TypeProperty<Policy>(node: attribute).build()
        case "rel":
            TypeProperty<Relation>(node: attribute).build()
        case "required":
            EmptyProperty(node: attribute).build()
        case "reversed":
            EmptyProperty(node: attribute).build()
        case "role":
            TypeProperty<Roles>(node: attribute).build()
        case "rows":
            ValueProperty(node: attribute).build()
        case "rowspan":
            ValueProperty(node: attribute).build()
        case "sandbox":
            EmptyProperty(node: attribute).build()
        case "scope":
            TypeProperty<Scope>(node: attribute).build()
        case "shape":
            TypeProperty<Shape>(node: attribute).build()
        case "size":
            ValueProperty(node: attribute).build()
        case "sizes":
            ValueProperty(node: attribute).build()
        case "slot":
            ValueProperty(node: attribute).build()
        case "span":
            ValueProperty(node: attribute).build()
        case "spellcheck":
            ValueProperty(node: attribute).build()
        case "src":
            ValueProperty(node: attribute).build()
        case "start":
            ValueProperty(node: attribute).build()
        case "step":
            ValueProperty(node: attribute).build()
        case "style":
            ValueProperty(node: attribute).build()
        case "tabindex":
            ValueProperty(node: attribute).build()
        case "target":
            TypeProperty<Target>(node: attribute).build()
        case "title":
            ValueProperty(node: attribute).build()
        case "translate":
            ValueProperty(node: attribute).build()
        case "type":
            
            if let parent = attribute.parent {
                
                switch parent.localName {
                case "input":
                    TypeProperty<Inputs>(node: attribute).build()
                case "button":
                    TypeProperty<Buttons>(node: attribute).build()
                case "link":
                    TypeProperty<Medias>(node: attribute).build()
                case "script":
                    TypeProperty<Medias>(node: attribute).build()
                case "audio":
                    TypeProperty<Medias>(node: attribute).build()
                default:
                    ValueProperty(node: attribute).build()
                }
            }
            
        case "value":
            ValueProperty(node: attribute).build()
        case "width":
            ValueProperty(node: attribute).build()
        case "wrap":
            TypeProperty<Wrapping>(node: attribute).build()
        case "property":
            TypeProperty<Graphs>(node: attribute).build()
        case "charset":
            //            TypeProperty<Charset>(node: attribute).build()
            ValueProperty(node: attribute).build()
        case "http-equiv":
            TypeProperty<Equivalent>(node: attribute).build()
        case "selected":
            EmptyProperty(node: attribute).build()
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
            
            
            
            if let comment = comment
            {
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
                return Converter.default.decode(attribute: attribute)
            }
        }
        
        private var content: [String]? {
            
            guard let children = element.children else {
                return nil
            }
            
            return children.map { child in
                return Converter.default.decode(element: child)
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
                return Converter.default.decode(attribute: attribute)
            }
        }
        
        private var content: [String]? {
            
            guard let children = element.children else {
                return nil
            }
            
            return children.map { child in
                return Converter.default.decode(element: child)
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
                return Converter.default.decode(attribute: attribute)
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
                        if attribute.name == "src"  {
                            output = output.replacingOccurrences(of: "?src?", with: attribute.stringValue!)
                        } else if attribute.name == "alt"  {
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
                        if attribute.name == "rel"  {
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
    
    private struct ValueIntegerProperty{
        
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
                if let intValue = Int(value){
                    ".\(name)(\(intValue))\n"
                }
                
            } else if let name = name{
                
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
    
    private struct ValueProperty{
        
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
                
            } else if let name = name{
                
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
    
    private struct TypeProperty<T: RawRepresentable>{
        
        private var name: String? {
            
            guard let name = node.name else {
                return nil
            }
            
            return name
        }
        
        private var value: String? {
            
            guard let value = node.stringValue  else {
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
                
            } else if let name = name{
                
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

