//
//  HttpRequest.swift
//  PortafolioSwiftUI
//
//  Created by Hugo Villagra on 2023-07-02.
//

import Foundation
import Alamofire
import SwiftUI

// MARK: Se le asigna alias a dictionario de json.
typealias JSON = [String:Any]


/*
 Los actors en Swift son un tipo de objetos de referencia (reference type) que forma parte del modelo de concurrencia avanzado. Su función principal es evitar carreras de datos (data race) y garantizar el acceso seguro al estado mutable compartido en entornos de programación concurrentes. Principalmente es una clase que restringe acceso a sus propiedades sin dejar de formar carreras de datos.

 Los actors en Swift son entidades que encapsulan el estado y el comportamiento relacionado, garantizando que solo un hilo de ejecución pueda acceder a ese estado a la vez. Además proporcionan exclusión mutua implícita, lo que significa que no necesitas preocuparte por problemas comunes de concurrencia como las condiciones de carrera y los bloqueos.

 Para definir un actor en Swift, necesitas utilizar la palabra clave actor, seguida del nombre del actor y sus métodos y propiedades.
 */

/*
 Los actores tienen los siguientes características:

     - Se crean utilizando la palabra clave actor. Este es un tipo de objetos en Swift, como estructuras, clases y enumeraciones.
     - Al igual que las clases, los actores son tipos de referencia. Esto los hace útiles para compartir el estado.
     - Tienen muchas características de las clases: puede tener propiedades, métodos (asíncronos o no), inicializadores y subíndices, pueden implementar protocolos y pueden ser genéricos.
     - Los actores no admiten la herencia, por lo que no pueden tener inicializadores de conveniencia y no admiten las palabras claves como final ni override.
     - Todos los actores implementan automáticamente el protocolo Actor, que ningún otro tipo puede utilizar. Esto le permite escribir código restringido para trabajar solo con actores.
 */

//Esto es de tipo actor, porque el mismo trabaja en segundo plano.
actor HttpRequest : GlobalActor{
    static public let shared = HttpRequest()
    
    
    /// Sirve para hacer una llamada a un servicio, usando alamofire. Este soporta utiliza cualquier clase de tenga de padre la clase Codable.
    /// - Parameters:
    ///   - urlString: la url de la cual se va a hacer la llamada
    ///   - parameters: los parametros que se van a ir en el body
    ///   - headers: los parametros que se van a ir en el header
    /// - Returns: el resultado de la llamada (un objeto de tipo Codable)
    func requestCodable<T : Codable>(urlString : String,parameters : Parameters?,headers : HTTPHeaders?) async throws -> T {
        
        /*
         El withCheckedThrowingContinuation es una versión avanzada del uso del DispatchQueue.main.async. Con el mismo, le permite crear una continuación comprobada que puede manejar errores de lanzamiento. Esto es particularmente útil para integrar las API basadas en callback con async/await. Cuando utilizas esta función, envuelve una API basada en llamadas en una función async, permitiendo un código más limpio y más legible y manejo de errores más fácil. Para entender esto, tenemos que saber las continuaciones.
         
         Una continuación es un mecanismo que permite que el código asincrónico haga una pausa y reanude. Con el withCheckedThrowingContinuation obtienes un objeto de continuación que puedes reanudar con un valor o un error. Esto es particularmente útil para integrar API basadas en devoluciones de llamadas con async/await. Cuando se utiliza esta función, se envuelve de manera efectiva una API basada en devoluciones de llamadas en una función async, lo que permite un código más claro y legible y un manejo más sencillo de los errores.
         
         En resumen, conviertes una función en una función asincrona, que tenes mejor control de obtener resultados cuando la ejecución se pausa.
         
         */
        return try await withCheckedThrowingContinuation { continuation in
            AF.request(urlString,parameters: parameters,headers: headers).responseDecodable(of:T.self) { response in
    
                print("RESULT CALL: ************************")
                print(response.debugDescription)
                print("************************")
    
                switch(response.result) {
                    case .success(let result):
                    //Retorna el valor obtenido de la llamada
                    continuation.resume(returning: result)
                        break
                    case .failure(let error):
                        print(error.localizedDescription)
                        //Lanza el error para que atrape en do catch
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
