//
//  SafariWebView.swift
//  PortafolioSwiftUI
//
//  Created by Hugo Villagra on 2023-07-05.
//

import Foundation
import SwiftUI
import SafariServices

struct SafariWebView: UIViewControllerRepresentable {
    let url: URL
    
    func makeUIViewController(context: Context) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {
        
    }
}
