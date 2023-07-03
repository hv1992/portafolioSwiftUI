//
//  HttpRequest.swift
//  PortafolioSwiftUI
//
//  Created by Hugo Villagra on 2023-07-02.
//

import Foundation
import Alamofire
import SwiftUI

class HttpRequest {
    static public let shared = HttpRequest()
    
    func requestCodable<T : Codable>(urlString : String,parameters : Parameters?,headers : HTTPHeaders?,onSuccess: @escaping ((T) -> Void),onError: ((AFError) -> Void)?) {
        
        AF.request(urlString,parameters: parameters,headers: headers).responseDecodable(of:T.self) { response in
            
            print("RESULT CALL: ************************")
            print(response.debugDescription)
            print("************************")
            
            switch(response.result) {
                case .success(let result):
                    onSuccess(result)
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                    onError?(error)
                    break
            }
        }
    }
    
    func downloadImage(urlString : String,parameters : Parameters? = nil,headers : HTTPHeaders? = nil,onSuccess: @escaping ((Image) -> Void),onError: ((AFError) -> Void)? = nil) {
        
        AF.request(urlString,parameters: parameters,headers: headers).responseData { response in
            print("RESULT CALL: ************************")
            print(response.debugDescription)
            print("************************")
            
            switch(response.result) {
                case .success(let result):
                    if let image = self.createImage(result) {
                        onSuccess(image)
                    }
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                    onError?(error)
                    break
            }
        }
    }
    
    func createImage(_ value: Data) -> Image? {
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
