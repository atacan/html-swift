// https://github.com/atacan/
// 28.05.22
    

extension String {
    /// keep the single space, while removing whitespaces. Because CharacterSet.whitespaces includes also the single space
    func condensingWhitespace() -> String {
        return self.components(separatedBy: .whitespacesAndNewlines)
            .filter { !$0.isEmpty }
            .joined(separator: " ")
    }
    
    func removeWhitespace() -> String {
        return self.components(separatedBy: .whitespacesAndNewlines)
            .joined(separator: "")
    }
}

@resultBuilder public class StringBuilder {
    
    public static func buildBlock(_ component: String...) -> String {
        return component.joined()
    }
    
    public static func buildOptional(_ component: String?) -> String {
        return component ?? ""
    }
    
    public static func buildEither(first component: String) -> String {
        return component
    }
    
    public static func buildEither(second component: String) -> String {
        return component
    }
    
    public static func buildArray(_ components: [String]) -> String {
        return components.joined()
    }
}
