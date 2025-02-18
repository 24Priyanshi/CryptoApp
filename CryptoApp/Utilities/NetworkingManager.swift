//
//  NetworkingManager.swift
//  CryptoApp
//
//  Created by Jai  on 07/09/23.
//

import Foundation
import Combine
class NetworkingManager {
    
    enum NetworkingError:LocalizedError{
        case badURLResponse(url:URL)
        case unknown
        
        var errorDescription: String? {
            switch self {
            case .badURLResponse(url: let url): return "[🔥] Bad Response From URL:\(url)"
            case .unknown: return "[😒]Unknown error Occured "
                 
            }
        }
    }
    
    
    
    
    
    static func download(url:URL) -> AnyPublisher<Data, any Error>
 {
        return  URLSession.shared.dataTaskPublisher(for: url)
             .subscribe(on: DispatchQueue.global(qos: .default))
             .tryMap({ try handleURLResponse(output: $0, url: url)})
             .receive(on: DispatchQueue.main)
             .eraseToAnyPublisher()
    }
    
    
    static func handleURLResponse(output:URLSession.DataTaskPublisher.Output,url:URL ) throws -> Data{
        guard let response = output.response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300 else {
            throw NetworkingError.badURLResponse(url: url)     }
        return output.data
    }
    
    
    
    
    static func handleCompletition(completion: Subscribers.Completion<Error>){
        switch completion {
        case .finished:
            break
        case .failure(let error):
            print(error.localizedDescription)
            
        } 
    }
}
