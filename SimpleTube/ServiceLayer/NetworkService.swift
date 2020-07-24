//
//  NetworkService.swift
//  SimpleTube
//
//  Created by Victor Pelivan on 20.07.2020.
//  Copyright © 2020 Viktor Pelivan. All rights reserved.
//

import Foundation
import UIKit


protocol NetworkServiceProtocol {
    //    func getData<T: Decodable>(into type: T.Type, from url: URL, completion: @escaping (T?) -> ())
    //    func getImage(from url: URL, completion: @escaping (UIImage?)->())
}

class NetworkService: NetworkServiceProtocol {
    
    //MARK: - Variables
    public var imageCache = NSCache<NSString, UIImage>() //Image Cache Class
    
    //MARK: - Public Methods
    
    public func getData(from url: URL, completion: @escaping (Data?, RequestError?) -> ()) {
        var request = URLRequest(url: url,
                                 cachePolicy: URLRequest.CachePolicy.returnCacheDataElseLoad,
                                 timeoutInterval: 15)
        request.httpMethod = "GET"
        let session = URLSession.shared
        let task = session.dataTask(with: request) {
            (data, response, error) in
            DispatchQueue.main.async {
                guard let httpResponse = response as? HTTPURLResponse else {
                    completion(nil, nil)
                    return
                }
                print("Status code: ", httpResponse.statusCode)
                if (200...299).contains(httpResponse.statusCode) {
                    completion(data, nil)
                } else {
                    self.decodeData(from: data, into: RequestError.self) { (requestError) in
                        completion(nil, requestError)
                        return
                    }
                }
            }
        }
        task.resume()
    }
    
    public func decodeData<T: Decodable>(from data: Data?, into type: T.Type, completion: (T?) -> ()) {
        do {
            guard let data = data else { return }
            let decodedData = try JSONDecoder().decode(type.self, from: data)
            completion(decodedData)
        } catch let error {
            completion(nil)
            print(error.localizedDescription)
        }
    }
    
    /* Next method performs image load request in case if it is not cached already, and if it is cached, it just pulls it from cache. It also handles right status codes and errors */
    public func getImage(from url: URL, completion: @escaping (UIImage?)->()) {
        
        if let cachedImage = imageCache.object(forKey: url.absoluteString as NSString) { // Checking if an image is already cached
            completion(cachedImage)
        } else { // if an image is not cached, we perform request
            var request = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad, timeoutInterval: 10)
            request.httpMethod = "GET"
            URLSession.shared.dataTask(with: request) {
                (data, response, error) in
                DispatchQueue.main.async {
                    guard let response = (response as? HTTPURLResponse), (200...299).contains(response.statusCode), error == nil, let data = data, let image = UIImage(data: data) else {
                        print("Image Request Error: ", error?.localizedDescription ?? "")
                        completion(nil)
                        return
                    }
                    self.imageCache.setObject(image, forKey: url.absoluteString as NSString)
                    completion(image)
                }
            }.resume()
        }
    }
}
