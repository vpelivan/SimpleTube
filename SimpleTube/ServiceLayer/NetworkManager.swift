//
//  NetworkManager.swift
//  SimpleTube
//
//  Created by Victor Pelivan on 20.07.2020.
//  Copyright © 2020 Viktor Pelivan. All rights reserved.
//

import Foundation

class NetworkManager {

    //MARK: - Variables
    
    private let mainAdress = "https://www.googleapis.com/youtube/v3/"
    private let apiKeyParam = "&key="
    public var apiKey: ApiKey?
//    public var apiKey = "AIzaSyC3FGPq3bQwnjR4JwZdZJSV1h2LunqLLTw"
    
    //MARK: - External Dependencies
    
    let networkService = NetworkService()
    
    func validateApiKey(from string: String?, completion: @escaping (Bool, RequestError?) -> ()) {
        
        guard let string = string,
              let url = URL(string: "\(mainAdress)channels?forUsername=YouTube&key=\(string)")
        else {
            completion(false, nil)
            return
        }
        networkService.getData(from: url) { (data, error) in
            if let data = data {
                self.networkService.decodeData(from: data, into: ValidApiKeyRequest.self) { (smallRequest) in
                    guard let smallRequest = smallRequest else { return }
                    print(smallRequest)
                    self.apiKey = ApiKey.init(key: string)
                    completion(true, nil)
                }
            } else if let error = error {
                completion(false, error)
            } else {
                completion(false, nil)
                return
            }
        }
    }
}
