//
//  GameItem.swift
//  Twitch viewer
//
//  Created by macbook on 21.07.2021.
//

import Foundation

struct GameItem: Codable {
    var id: Int
    var box: BoxItem
    var giantbombId: Int
    var logo: LogoItem
    var name: String
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case box
        case giantbombId = "giantbomb_id"
        case logo
        case name
    }
}
