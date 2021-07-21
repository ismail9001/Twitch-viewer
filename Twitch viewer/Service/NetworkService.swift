//
//  NetworkService.swift
//  Twitch viewer
//
//  Created by macbook on 21.07.2021.
//

import Foundation
import Alamofire

class NetworkService {
    func sendData(limit: Int, offset: Int, completion: @escaping ([ChannelItem]) -> Void) {
        let url = "https://api.twitch.tv/kraken/games/top"
        let headers: HTTPHeaders = {
            return ["Client-ID": "ahuoi1tl0qmqbyi8jo8nitbmuaad7w",
                    "Accept": "application/vnd.twitchtv.v5+json"]
        }()
        let params: Parameters = ["limit": limit, "offset": offset]
        AF.request(url, method: .get, parameters: params, headers: headers).responseJSON { response in
            do {
                let responseData = try JSONDecoder().decode(ResponseItem.self, from: response.data!)
                completion(responseData.top)
            } catch {
                completion([])
                print(error)
            }
        }
    }
}
