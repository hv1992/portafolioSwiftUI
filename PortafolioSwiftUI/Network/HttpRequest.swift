//
//  HttpRequest.swift
//  PortafolioSwiftUI
//
//  Created by Hugo Villagra on 2023-07-02.
//

import Foundation
import Alamofire
import SwiftUI


//Esto es de tipo actor, porque el mismo trabaja en segundo plano.
actor HttpRequest : GlobalActor{
    static public let shared = HttpRequest()
    
    func requestCodable<T : Codable>(urlString : String,parameters : Parameters?,headers : HTTPHeaders?) async throws -> T {
        return try await withCheckedThrowingContinuation { continuation in
            AF.request(urlString,parameters: parameters,headers: headers).responseDecodable(of:T.self) { response in
    
                print("RESULT CALL: ************************")
                print(response.debugDescription)
                print("************************")
    
                switch(response.result) {
                    case .success(let result):
                    continuation.resume(returning: result)
                        break
                    case .failure(let error):
                        print(error.localizedDescription)
                        continuation.resume(throwing: self.handleError(error: error))
                        break
                }
            }
        }
    }
    
    private func handleError(error: AFError) -> Error {
        if let underlyingError = error.underlyingError {
            let nserror = underlyingError as NSError
            let code = nserror.code
            if code == NSURLErrorNotConnectedToInternet ||
                code == NSURLErrorTimedOut ||
                code == NSURLErrorInternationalRoamingOff ||
                code == NSURLErrorDataNotAllowed ||
                code == NSURLErrorCannotFindHost ||
                code == NSURLErrorCannotConnectToHost ||
                code == NSURLErrorNetworkConnectionLost
            {
                var userInfo = nserror.userInfo
                userInfo[NSLocalizedDescriptionKey] = "Unable to connect to the server"
                let currentError = NSError(
                    domain: nserror.domain,
                    code: code,
                    userInfo: userInfo
                )
                return currentError
            }
        }
        return error
    }
    
    func downloadImage(urlString : String,parameters : Parameters? = nil,headers : HTTPHeaders? = nil) async throws -> Image {
        
        return try await withCheckedThrowingContinuation { continuation in
            AF.request(urlString,parameters: parameters,headers: headers).responseData { response in
                print("RESULT CALL: ************************")
                print(response.debugDescription)
                print("************************")
                
                switch(response.result) {
                    case .success(let result):
                        if let image = Image.createImageFromData(result) {
                            continuation.resume(returning: image)
                        }
                        break
                    case .failure(let error):
                        print(error.localizedDescription)
                        continuation.resume(throwing: self.handleError(error: error))
                        break
                }
            }
        }
        
    }
    
    func requestData(urlString : String,parameters : Parameters? = nil,headers : HTTPHeaders? = nil) async throws -> Data {
        return try await withCheckedThrowingContinuation { continuation in
            AF.request(urlString,parameters: parameters,headers: headers).responseData { response in
                print("RESULT CALL: ************************")
                print(response.debugDescription)
                print("************************")
                
                switch(response.result) {
                    case .success(let result):
                        continuation.resume(returning: result)
                        break
                    case .failure(let error):
                        print(error.localizedDescription)
                        continuation.resume(throwing: self.handleError(error: error))
                        break
                }
            }
        }
    }
}
