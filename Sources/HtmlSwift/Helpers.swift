//
// https://github.com/atacan
// 28.07.22
	
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
