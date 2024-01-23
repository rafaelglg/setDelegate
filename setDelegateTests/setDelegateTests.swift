//
//  setDelegateTests.swift
//  setDelegateTests
//
//  Created by Rafael Loggiodice on 23/1/24.
//

import XCTest
import PDFKit

@testable import setDelegate

final class setDelegateTests: XCTestCase {
    
    var pdfViewTest: PDFView?


    override func setUpWithError() throws {
        pdfViewTest = PDFView()
    }

    override func tearDownWithError() throws {
        pdfViewTest = nil
    }

    func testPDFViewIsNotNil() {
        
        let pdfViewController = PDFViewController()
        pdfViewController.pdfView = pdfViewTest
        pdfViewController.loadViewIfNeeded()
        
        XCTAssertNotNil(pdfViewTest, "PDFView should not be nil after loading the view")
    }

}
