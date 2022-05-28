// https://github.com/atacan/
// 28.05.22
    

extension String {
    /// keep the single space, while removing whitespaces. Because CharacterSet.whitespaces includes also the single space
    func condensingWhitespace() -> String {
        return self.components(separatedBy: .whitespacesAndNewlines)
            .filter { !$0.isEmpty }
            .joined(separator: " ")
    }
}
