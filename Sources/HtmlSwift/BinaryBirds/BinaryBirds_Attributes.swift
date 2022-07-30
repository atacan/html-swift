//
// https://github.com/atacan
// 30.07.22

import SwiftSoup

struct PredefinedMethodAttribute_BinaryBirds: Attributing {
    let attribute: SwiftSoup.Attribute
    let swiftCode: String

    init(attribute: SwiftSoup.Attribute) {
        self.attribute = attribute
        let key: String = attribute.getKey() |> camelCased
        let value: String = attribute.getValue() |> addQuote

        swiftCode = "\n.\(key)(\(value))"
    }
}

struct UndefinedAttribute_BinaryBirds: Attributing {
    let attribute: SwiftSoup.Attribute
    let swiftCode: String
    
    init(attribute: Attribute) {
        self.attribute = attribute
        let key = attribute.getKey() |> addQuote
        let value = attribute.getValue() |> addQuote
        swiftCode = "\n.attribute(\(key), \(value))"
    }
}

struct EmptyAttribute_BinaryBirds: Attributing {
    let attribute: SwiftSoup.Attribute
    let swiftCode: String
    
    init(attribute: Attribute) {
        self.attribute = attribute
        let key = attribute.getKey()
//        let value = attribute.getValue() |> addQuote
        swiftCode = "\n.\(key)()"
    }
}

/// has predefined values in an enum
struct EnumAttribute_BinaryBirds<T: RawRepresentable>: Attributing {
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
            swiftCode = UndefinedAttribute_BinaryBirds(attribute: attribute).swiftCode
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
