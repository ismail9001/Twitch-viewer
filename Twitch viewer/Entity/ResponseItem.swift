//
//  ResponseItem.swift
//  Twitch viewer
//
//  Created by macbook on 21.07.2021.
//

import Foundation

struct ResponseItem: Codable {
    var total: Int
    var top: [ChannelItem]
    
    enum CodingKeys: String, CodingKey {
        case total = "_total"
        case top
    }
}
