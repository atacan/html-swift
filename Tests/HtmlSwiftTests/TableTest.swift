// https://github.com/atacan/
// 29.05.22
//
    

import XCTest
@testable import HtmlSwift

final class TestTable: XCTestCase {
    func testTablewithAttributes() throws {
        
        let htmlCode = #"""
<!DOCTYPE html>
<table class="table">
    <thead>
        <tr>
            <th scope="col">#</th>
            <th scope="col">First</th>
            <th scope="col">Last</th>
            <th scope="col">Handle</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <th scope="row">1</th>
            <td>Mark</td>
            <td>Otto</td>
            <td>@mdo</td>
        </tr>
        <tr>
            <th scope="row">2</th>
            <td>Jacob</td>
            <td>Thornton</td>
            <td>@fat</td>
        </tr>
        <tr>
            <th scope="row">3</th>
            <td colspan="2">Larry the Bird</td>
            <td>@twitter</td>
        </tr>
    </tbody>
</table>
"""#
        
        let targetSwiftCode = #"""
Table {
    Thead {
        Tr {
            Th("#")
                .scope(.col)
            Th("First")
                .scope(.col)
            Th("Last")
                .scope(.col)
            Th("Handle")
                .scope(.col)
        }
    }
    Tbody {
        Tr {
            Th("1")
                .scope(.row)
            Td("Mark")
            Td("Otto")
            Td("@mdo")
        }
        Tr {
            Th("2")
                .scope(.row)
            Td("Jacob")
            Td("Thornton")
            Td("@fat")
        }
        Tr {
            Th("3")
                .scope(.row)
            Td("Larry the Bird")
                .colspan(2)
            Td("@twitter")
        }
    }
}
.class("table")
"""#
        
        let outputSwiftCode = try Converter.default.convert(html: htmlCode)
        XCTAssertEqual(outputSwiftCode.condensingWhitespace(), targetSwiftCode.condensingWhitespace())
    }
}
