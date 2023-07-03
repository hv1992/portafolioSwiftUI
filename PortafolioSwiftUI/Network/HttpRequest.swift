//
//  HttpRequest.swift
//  PortafolioSwiftUI
//
//  Created by Hugo Villagra on 2023-07-02.
//

import Foundation
import Alamofire

class HttpRequest {
    public let shared = HttpRequest()
    
    func requestCodable<T : Codable>(urlString : String,parameters : Parameters,headers : HTTPHeaders,onSuccess: @escaping ((T?) -> Void),onError: ((AFError) -> Void)?) {
        
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
}
