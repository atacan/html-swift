//
// https://github.com/atacan
// 28.07.22

import Foundation
import Html
import SwiftFormat
	
// MARK: Generic Functions
infix operator <|: infixr0
infix operator |>: infixl1

precedencegroup infixl0 {
  associativity: left
  higherThan: AssignmentPrecedence
}
precedencegroup infixr0 {
  associativity: right
  higherThan: infixl0
}
precedencegroup infixl1 {
  associativity: left
  higherThan: infixr0
}

public func <| <A, B> (f: (A) -> B, a: A) -> B {
  return f(a)
}

public func |> <A, B> (a: A, f: (A) -> B) -> B {
  return f(a)
}

public func |> <A, B> (a: A, f: (A) throws -> B) throws -> B {
  return try f(a)
}

// MARK: String Functions

public func addQuote(_ input: String) -> String {
    var output: String
    if input.contains(where: \.isNewline) {
        output = "\"\"\"\n\(input)\n\"\"\""
    } else {
        output = "\"\(input)\""
    }
    
    if input.contains("\"") || input.contains("\\") || input.contains("#") {
        return "###\(output)###"
    } else {
        return output
    }
}

public func isOneOf<A: Equatable>(_ look: A...) -> (A) -> Bool {
    return { (a: A) -> Bool in
        for value in look {
            if a == value {
                return true
            }
        }
        return false
    }
}

public func camelCased(_ input: String) -> String {
    let separator: Character
    if input.contains("-") {
        separator = "-"
    } else if input.contains("_") {
        separator = "_"
    } else {
        return input
    }
    return input.lowercased()
        .split(separator: separator)
        .enumerated()
        .map { $0.offset > 0 ? $0.element.capitalized : $0.element.lowercased() }
        .joined()
}

public func removeBody(_ input: String) -> String {
    return input
        .trimmingCharacters(in: .whitespacesAndNewlines)
        .removingPrefix(".body(")
        .removingSuffix(")")
}

public func removeBody_BinaryBirds(_ input: String) -> String {
    return input
        .trimmingCharacters(in: .whitespacesAndNewlines)
        .removingPrefix("Body {")
        .removingPrefix("Body{")
        .removingSuffix("}")
}

public func removeHead_BinaryBirds(_ input: String) -> String {
    return input
        .trimmingCharacters(in: .whitespacesAndNewlines)
        .removingPrefix("Head {")
        .removingPrefix("Head{")
        .removingSuffix("}")
}

public func removeHead(_ input: String) -> String {
    return input
        .trimmingCharacters(in: .whitespacesAndNewlines)
        .removingPrefix(".head(")
        .removingSuffix(")")
}

public func swiftFormat(_ input: String) throws -> String {
    let result = try SwiftFormat.format(
        input,
        rules: FormatRules.default,
        options: FormatOptions(
            wrapArguments: .beforeFirst,
            wrapCollections: .beforeFirst
        ),
        lineRange: nil
    )
    return result.output
}

enum ConvertError: Error {
    case soupParse(String)
}

// MARK: String Extensions

public extension String {
    func removingPrefix(_ prefix: String) -> String {
        guard hasPrefix(prefix) else { return self }
        return String(dropFirst(prefix.count))
    }
    
    func removingSuffix(_ suffix: String) -> String {
        guard hasSuffix(suffix) else { return self }
        return String(dropLast(suffix.count))
    }
    
    /// keep the single space, while removing whitespaces. Because CharacterSet.whitespaces includes also the single space
    func condensingWhitespace() -> String {
        return self.components(separatedBy: .whitespacesAndNewlines)
            .filter { !$0.isEmpty }
            .joined(separator: " ")
    }
    
    func removingWhitespace() -> String {
        return self.components(separatedBy: .whitespacesAndNewlines)
            .joined(separator: "")
    }
}

// MARK: Protocols

protocol HaveInitOptional {
    init?(_ : String)
}

extension Int: HaveInitOptional {}
extension Double: HaveInitOptional {}
extension Bool: HaveInitOptional {}

struct DefaultedBool: HaveInitOptional, CustomStringConvertible {
    var description: String {
        "\(state)"
    }
    
    let state: Bool
    init?(_ value: String) {
        switch value {
        case "true":
            state = true
        case "false":
            state = false
        default:
            state = true
        }
    }
}

extension Date: HaveInitOptional {
    init?(_: String) {
        self.init()
    }
}

struct AnyHasRel: HasRel {}
struct AnyHasCrossorigin: HasCrossorigin {}
struct AnyHasPreload: HasPreload {}
struct AnyHasTarget: HasTarget {}
struct AnyHasMediaType: HasMediaType {}
