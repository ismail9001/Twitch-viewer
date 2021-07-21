//
//  CashService.swift
//  Twitch viewer
//
//  Created by macbook on 21.07.2021.
//
import Foundation

class CasheService {
    
    static func setData(channels: [ChannelItem]) {
        UserDefaults.standard.set(try? PropertyListEncoder().encode(channels), forKey: "channels")
    }
    
    static func getData() -> [ChannelItem] {
        guard let data = UserDefaults.standard.value(forKey: "channels") as? Data else { return [] }
        let list = try? PropertyListDecoder().decode([ChannelItem].self, from: data)
        return list ?? []
    }
}
