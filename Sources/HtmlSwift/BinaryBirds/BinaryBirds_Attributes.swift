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
