//
// https://github.com/atacan
// 04.06.23
	
public enum SwiftDSL: String, CaseIterable, Identifiable {
    public var id: Self { self }
    case pointFree = "Point-Free Co."
    case binaryBirds = "Binary Birds (Feather)"
}

public func htmlToSwift(_ html: String, for dsl: SwiftDSL, component: HtmlOutputComponent) throws -> String {
    switch dsl {
    case .binaryBirds:
        return try convertToBinaryBirds(html: html, component: component)
    case .pointFree:
        return try convertToPointFree(html: html, component: component)
    }
}
