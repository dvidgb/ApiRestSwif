//
//  NetworkingProvider.swift
//  Networking
//
//  Created by David Bueno on 5/5/21.
//

import Foundation
import Alamofire


//Vamos a tratarla como una instancia de tipo singleton
//poseremos una única instacia de esta clase para llamarla donde
//queramos de nuestra aplicación

final class NetworkingProvider{
    
    //constate estática shared esto es un estándar en swift
    //es una instancia compartida durante toda la apliación
    //que será igual a nuestra clase
    
    static let shared = NetworkingProvider()
    
    //constante privada de la parte de la url que no cambia
    //la url va a ser un String
    //MUY IMPORTANTE EL ÚLTIMO SLASH /
    private let kBaseUrl = "https://gorest.co.in/public-api/"
    private let kStatusOk = 200...299
    
    
    
    func getUser(id: Int, succes: @escaping (_ user: User) -> (), failure: @escaping (_ error: Error?) -> ())    {
        
        let url = "\(kBaseUrl)users/\(id)"
        
        AF.request(url, method: .get).validate(statusCode: kStatusOk).responseDecodable (of: UserReponse.self,decoder: DateDecoder()) {
           response in
            
            //comprobación de si la respuesta es correcta
            if let user = response.value?.data {
                succes(user)
            }else{
                failure(response.error)
            }
            
        }
    }
    //función para obtener los datos de un usuario
}

