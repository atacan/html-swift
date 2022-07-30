//
// https://github.com/atacan
// 30.07.22

import SwiftSoup

protocol Attributing {
    var attribute: SwiftSoup.Attribute { get }
    var swiftCode: String { get }
    init(attribute: SwiftSoup.Attribute)
}

/// initiated with dotted method and a value as argument
struct PredefinedMethodAttribute: Attributing {
    let attribute: SwiftSoup.Attribute
    let swiftCode: String
    
    init(attribute: SwiftSoup.Attribute) {
        self.attribute = attribute
        let key: String = attribute.getKey() |> camelCased
        let value: String =  attribute.getValue() |> addQuote
        
        if key |> isOneOf("style", "onafterprint", "onbeforeprint", "onbeforeunload", "onerror", "onhashchange", "onload", "onmessage", "onoffline", "ononline", "onpagehide", "onpageshow", "onpopstate", "onresize", "onstorage", "onunload", "onblur", "onchange", "oncontextmenu", "onfocus", "oninput", "oninvalid", "onreset", "onsearch", "onselect", "onsubmit", "onkeydown", "onkeypress", "onkeyup", "onclick", "ondblclick", "onmousedown", "onmousemove", "onmouseout", "onmouseover", "onmouseup", "onwheel", "ondrag", "ondragend", "ondragenter", "ondragleave", "ondragover", "ondragstart", "ondrop", "onscroll", "oncopy", "oncut", "onpaste", "onabort", "oncanplay", "oncanplaythrough", "oncuechange", "ondurationchange", "onemptied", "onended", "onloadeddata", "onloadedmetadata", "onloadstart", "onpause", "onplay", "onplaying", "onprogress", "onratechange", "onseeked", "onseeking", "onstalled", "onsuspend", "ontimeupdate", "onvolumechange", "onwaiting", "ontoggle") {
            swiftCode = ".\(key)(unsafe: \(value))"
        }
        else {
            swiftCode = ".\(key)(\(value))"
        }
    }
}

/// has predefined values in an enum
struct EnumAttribute<T: RawRepresentable>: Attributing {
    var swiftCode: String
    let attribute: SwiftSoup.Attribute
    
    init(attribute: Attribute) {
        self.attribute = attribute
        swiftCode = ""
        let key: String = attribute.getKey() |> camelCased
        let value = value(of: attribute)
        
        if let value = value {
            swiftCode = ".\(key)(\(value))"
        } else {
            swiftCode = UndefinedAttribute(attribute: attribute).swiftCode
        }
        
    }
    
    func value(of attribute: SwiftSoup.Attribute) -> String? {
        let value = attribute.getValue()
        
        if let type = T(rawValue: value as! T.RawValue) {
            return ".\(type)"
        } else if let type = T(rawValue: value.lowercased() as! T.RawValue) {
            return ".\(type)"
        } else if let type = T(rawValue: value.uppercased() as! T.RawValue) {
            return ".\(type)"
        } else if let type = T(rawValue: "" as! T.RawValue) {
            return ".\(type)"
        } else {
            return nil
        }
    }
}

/// has Swift standard type values other than string
struct StandardTypeAttribute<T: HaveInitOptional>: Attributing {
    let attribute: SwiftSoup.Attribute
    let swiftCode: String
    
    init(attribute: Attribute) {
        self.attribute = attribute
        let key: String = attribute.getKey() |> camelCased
        let value: String
        
        let valueGet = attribute.getValue()
        if let typeValue = T(valueGet) {
            value = "\(typeValue)"
        } else {
            value = valueGet |> addQuote
        }
        
        swiftCode = ".\(key)(\(value))"
    }
}

/// has predefined values in static variables in a struct. initiliaser is like enum
struct StructAttribute: Attributing {
    let attribute: SwiftSoup.Attribute
    let swiftCode: String
    
    init(attribute: Attribute) {
        self.attribute = attribute
        
        let key = attribute.getKey() |> camelCased
        let value = ".init(rawValue: \(attribute.getValue() |> addQuote))"
        
        swiftCode = ".\(key)(\(value))"
    }
}

struct UndefinedAttribute: Attributing {
    let attribute: SwiftSoup.Attribute
    let swiftCode: String
    
    init(attribute: Attribute) {
        self.attribute = attribute
        let key = attribute.getKey() |> addQuote
        let value = attribute.getValue() |> addQuote
        // example: .init("sizes", "180x180"),
        swiftCode = ".init(\(key), \(value))"
    }
}

struct AttributeMediaType: Attributing {
    let attribute: SwiftSoup.Attribute
    let swiftCode: String
    
    init(attribute: Attribute) {
        self.attribute = attribute
        let value = attribute.getValue()
        let values = value.split(separator: "/")
        // example: .type(.application(.init(rawValue: "atom+xml")))
        swiftCode = ".type(.\(values[0])(.init(rawValue: \"\(values[1])\")))"
    }
}

struct FunctionArgumentAttribute: Attributing {
    let attribute: SwiftSoup.Attribute
    let swiftCode: String
    
    init(attribute: Attribute) {
        self.attribute = attribute
        let key = attribute.getKey() |> camelCased
        let value = attribute.getValue() |> addQuote
        swiftCode = "\(key): \(value)"
    }
}
