import UIKit
import XCTest
import StringExtensionHTML

class Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testDecodingEntities() {
        // This is an example of a functional test case.
        XCTAssertEqual("Foo &#xA9; bar &#x1D306; baz &#x2603; qux".stringByDecodingHTMLEntities, "Foo © bar 𝌆 baz ☃ qux")
        XCTAssertEqual("&#x22;That&#x27;s your d&#xE6;mon, Lyra.&#x22;".stringByDecodingHTMLEntities, "\"That's your dæmon, Lyra.\"")
        XCTAssertEqual("&lt;a href=&quot;mailto:foo@foo.com&quot;&gt;email&lt;/a&gt;".stringByDecodingHTMLEntities, "<a href=\"mailto:foo@foo.com\">email</a>")
    }
    
    func testDecodingTags() {
        // This is an example of a functional test case.
        XCTAssertEqual("<a href=\"mailto:foo@foo.com\">email</a>".stringByStrippingHTMLTags, "email")
        XCTAssertEqual("<h2>Try stripping <b>my</b> <a href=''><i>html</i></a> tags!</h2>".stringByStrippingHTMLTags, "Try stripping my html tags!")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure() {
            // Put the code you want to measure the time of here.
        }
    }
    
}
