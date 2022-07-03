// https://github.com/atacan/
// 29.05.22
//

@testable import HtmlSwift
import XCTest

final class TestUnclosedTags: XCTestCase {
    func testUnclosedTags() throws {
        let htmlCode = #"""
        <html>
        <head>
            <link rel="stylesheet" href="./css/style.css"/>
            <link href="./css/style.css" rel="stylesheet"/>
            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <!-- CSS only -->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin>

            <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css"
                integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp" crossorigin="anonymous"/>
            <!-- JavaScript Bundle with Popper -->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
                crossorigin="anonymous"></script>
            <title>Document</title>
        </head>
        <body>
            <img class="avatar-img rounded border border-white border-3" src="https://social.webestica.com/assets/images/avatar/07.jpg" alt="">
            <img src="https://social.webestica.com/assets/images/avatar/07.jpg" alt=""/>
            <img src="https://social.webestica.com/assets/images/avatar/07.jpg" alt="">
            <hr style="width:50%;text-align:left;margin-left:0">
            <p>To force<br> line breaks<br> in a text,<br> use the br<br> element.</p>
            <map name="yourMap">
            <area shape="poly" coords="150,0,150,177,0,260" href="https://www.tutorialstonight.com/html/html-introduction.php" target="_blank" alt="HTML Tutorial">
            <area shape="poly" coords="0,260,150,178,300,260" href="https://www.tutorialstonight.com/css/css-introduction.php" target="_blank" alt="CSS Tutorial">
            <area shape="poly" coords="151,0,151,177,300,260" href="https://www.tutorialstonight.com/js/" target="_blank" alt="JavaScript Tutorial">
            </map>
            <img src="image.png" alt="image" usemap="#yourMap">
        </body>
        </html>
        """#

        XCTAssertNoThrow(try Converter.default.convert(html: htmlCode))
        XCTAssertNoThrow(try Converter.default.convert(html: htmlCode.condensingWhitespace()))
    }
}
