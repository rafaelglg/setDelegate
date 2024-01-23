//
//  PDFViewController.swift
//  setDelegate
//
//  Created by Rafael Loggiodice on 19/1/24.
//

import UIKit
import PDFKit

class PDFViewController: UIViewController {
    
    var pdfView: PDFView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pdfView = PDFView(frame: view.bounds)
        pdfView.autoScales = true
        pdfView.delegate = self
        view.addSubview(pdfView)
        
        loadPDFDocument()
    }
    
    func loadPDFDocument() {
        guard let url = Bundle.main.url(forResource: "cv-ios", withExtension: "pdf") else {
            print("PDF file not found.")
            return
        }
        
        guard let document = PDFDocument(url: url) else {
            print("Unable to create PDF document.")
            return
        }
        
        pdfView.document = document
    }
}

extension PDFViewController: PDFViewDelegate {
    
    func pdfViewWillClick(onLink sender: PDFView, with url: URL) {
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}
