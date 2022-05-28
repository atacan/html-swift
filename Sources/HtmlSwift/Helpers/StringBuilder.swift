// https://github.com/atacan/
// 28.05.22
    

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
