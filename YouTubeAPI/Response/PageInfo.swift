//
//  PageInfo.swift
//  YouTubeAPI
//
//  Created by Miyoshi Masataka on 2018/02/10.
//  Copyright © 2018年 Masataka Miyoshi. All rights reserved.
//

import Foundation

struct PageInfo: Decodable {
    
    // MARK: Properties
    
    let resultsPerPage: Int
    let totalResults: Int
    
}