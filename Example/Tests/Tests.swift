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
        XCTAssertEqual("Now this is a &#x1F4D6; all about how my life got &#x1F501;&#x2B06;&#xFE0F;&#x2B07;&#xFE0F; now I&#x27;d like to take a &#x231B;&#xFE0F; just &#x1F4BA; &#x1F449; I&#x27;ll tell ya how I became the &#x1F451; of a &#x1F3E0;&#x1F3E1;&#x1F3E1;&#x1F3E0;&#x1F3E0;&#x1F3E1; called &#x1F514;&#x1F4A8;".stringByDecodingHTMLEntities, "Now this is a 📖 all about how my life got 🔁⬆️⬇️ now I'd like to take a ⌛️ just 💺 👉 I'll tell ya how I became the 👑 of a 🏠🏡🏡🏠🏠🏡 called 🔔💨")
        XCTAssertEqual("&#x2200;(x, y &#x2208; A &#x222A; B; x &#x2260; y) x&#xB2; &#x2212; y&#xB2; &#x2265; 0. For all (x, y :- A u B; x != y) x^2 - y^2 &#x3E;= 0".stringByDecodingHTMLEntities, "∀(x, y ∈ A ∪ B; x ≠ y) x² − y² ≥ 0. For all (x, y :- A u B; x != y) x^2 - y^2 >= 0")
    }
    
    func testDecodingTags() {
        // This is an example of a functional test case.
        XCTAssertEqual("<a href=\"mailto:foo@foo.com\">email</a>".stringByStrippingHTMLTags, "email")
        XCTAssertEqual("<h2>Try stripping <b>my</b> <a href=''><i>html</i></a> tags!</h2>".stringByStrippingHTMLTags, "Try stripping my html tags!")
        XCTAssertEqual("<!DOCTYPE html><html><body><h1>My First Heading</h1> <p>My first paragraph.</p></body></html>".stringByStrippingHTMLTags, "My First Heading My first paragraph.")
        XCTAssertEqual("The microblogging site <acronym title=\"Founded in 2006\">Twitter</acronym> has recently struggled with downtimes.".stringByStrippingHTMLTags, "The microblogging site Twitter has recently struggled with downtimes.")
        XCTAssertEqual("<label for=\"username\">Username</label><input id=\"username\" type=\"text\" />".stringByStrippingHTMLTags, "Username")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure() {
            // Put the code you want to measure the time of here.
        }
    }
    
}
