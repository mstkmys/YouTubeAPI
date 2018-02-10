//
//  YouTubeClient.swift
//  YouTubeAPI
//
//  Created by Miyoshi Masataka on 2018/02/10.
//  Copyright © 2018年 Masataka Miyoshi. All rights reserved.
//

import Foundation

struct YouTubeClient {
    
    // MARK: Properties
    
    private let session: URLSession = {
        
        let configuration = URLSessionConfiguration.default
        
        let session = URLSession(configuration: configuration)
        
        return session
        
    }()
    
    // MARK: Methods
    
    func send<Request: YouTubeRequest>( request: Request, completion: @escaping (Result<Request.Response, YouTubeClientError> ) -> Void ) {
    
        let urlRequest = request.buildURLRequest()
        
        let task = session.dataTask(with: urlRequest) { data, response, error in
            
            switch (data, response, error) {
                
            case (_, _, let error?):
                
                completion(Result(error: .connectionError(error)))
                
            case (let data?, let response?, _):
                
                do {
                    
                    let response = try request.response(from: data, urlResponse: response)
                    
                    completion(Result(value: response))
                    
                } catch let error as YouTubeAPIError {
                    
                    completion(Result(error: .apiError(error)))
                    
                } catch {
                    
                    completion(Result(error: .responseParseError(error)))
                    
                }
                
            default:
                
                fatalError("invalid response combination data, response, error.")
                
            }
            
        }
        
        task.resume()
    
    }
    
}
















