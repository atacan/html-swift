//
// https://github.com/atacan
// 30.07.22
	

import SwiftSoup
import SwiftFormat

public func convertToBinaryBirds(html: String, component: HtmlOutputComponent = .fullHtml) throws -> String {
    let doc: SwiftSoup.Document = try SwiftSoup.parse(html)
    let root: SwiftSoup.Element?
    let decoded: String
    
    // where to start
    switch component {
    case .fullHtml:
        root = doc.child(0)
    case .onlyBody:
        root = doc.body()
    case .onlyHead:
        root = doc.head()
    }
    
    // if SwiftSoup could parse
    if let root = root {
        decoded = BinaryBasicElement(element: root).swiftCode
    } else {
        throw ConvertError.soupParse("SwiftSoup no root element found")
    }
    
    return try decoded |> swiftFormat
}
