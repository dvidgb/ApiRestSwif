//
//  DataDecoder.swift
//  Networking
//
//  Created by David Bueno on 5/5/21.
//

import Foundation

final class DateDecoder: JSONDecoder{
    
    let dateFormatter = DateFormatter()
    
    override init() {
        super.init()
       // "2021-05-05T03:50:05.368+05:30",
        
                                    //Se corresponde al formato de la
                                    //fecha de arriba
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSXXX"
        dateDecodingStrategy = .formatted(dateFormatter)
        
    }
}
