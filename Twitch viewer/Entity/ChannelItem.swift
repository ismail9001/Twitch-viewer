//
//  ChannelItem.swift
//  Twitch viewer
//
//  Created by macbook on 21.07.2021.
//

import Foundation

struct ChannelItem: Codable {
    var channels: Int
    var viewers: Int
    var game: GameItem
}
