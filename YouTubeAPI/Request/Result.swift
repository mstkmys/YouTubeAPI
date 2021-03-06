//
//  Result.swift
//  YouTubeAPI
//
//  Created by Miyoshi Masataka on 2018/02/10.
//  Copyright © 2018年 Masataka Miyoshi. All rights reserved.
//

import Foundation

enum Result<T, Error: Swift.Error> {
    
    case success(T)
    case failure(Error)
    
    init(value: T) {
        
        self = .success(value)
        
    }
    
    init(error: Error) {
        
        self = .failure(error)
        
    }
    
}












