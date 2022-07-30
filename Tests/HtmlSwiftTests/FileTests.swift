//
// https://github.com/atacan
// 30.07.22


//import XCTest
//@testable import HtmlSwift
//
//final class FileTests: XCTestCase {
//
//    var directory: URL?
//
//    override func setUp() {
//        super.setUp()
//        let currentFile = URL(fileURLWithPath: #file).deletingLastPathComponent()
//        self.directory = currentFile.appendingPathComponent("HtmlFiles")
//    }
//
//    func testFiles() throws {
//        let fileExtension = "html"
//        let fm = FileManager.default
//
//
//        let files = try fm.contentsOfDirectory(at: directory!, includingPropertiesForKeys: nil, options: [.skipsHiddenFiles])
//
//        for file in files {
//            guard file.pathExtension == fileExtension else {
//                continue
//            }
//            guard let content = try? String(contentsOf: file) else {
//                return XCTFail("File couldn't be read.")
//            }
//            XCTAssertNoThrow(try convert(html: content), file.lastPathComponent)
//        }
//    }
//}

