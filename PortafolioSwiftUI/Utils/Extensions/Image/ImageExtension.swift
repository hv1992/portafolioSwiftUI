//
//  ImageExtension.swift
//  PortafolioSwiftUI
//
//  Created by Hugo Villagra on 2023-07-03.
//

import Foundation
import SwiftUI
import UIKit

extension Image {
    
    
    /// Convert data image to Image View
    /// - Parameter value: data image
    /// - Returns: image view
    static func createImageFromData(_ value: Data) -> Image? {
        #if canImport(UIKit)
            let imageResult: UIImage = UIImage(data: value) ?? UIImage()
            return Image(uiImage: imageResult)
        #elseif canImport(AppKit)
            let songArtwork: NSImage = NSImage(data: value) ?? NSImage()
            return Image(nsImage: songArtwork)
        #else
            return nil
        #endif
    }
}
