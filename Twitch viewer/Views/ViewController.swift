//
//  ViewController.swift
//  Twitch viewer
//
//  Created by macbook on 21.07.2021.
//

import UIKit
import Kingfisher
import Network


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITableViewDataSourcePrefetching {
    
    @IBOutlet var streamTableView: UITableView!
    let networkService = NetworkService()
    let monitor = NWPathMonitor()
    var channels: [ChannelItem] = []
    let limit = 20
    var offset = 0
    var isLoading = false

    override func viewDidLoad() {
        super.viewDidLoad()
        streamTableView.delegate = self
        streamTableView.dataSource = self
        streamTableView.prefetchDataSource = self
        self.title = "Каналы"
        getData()
        let queue = DispatchQueue(label: "Monitor")
        monitor.start(queue: queue)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        channels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "channelCell", for: indexPath as IndexPath) as! ChannelTableViewCell
        let channel = channels[indexPath.row]
        cell.gameLabel.text = channel.game.name
        cell.viewersLabel.text = "\(channel.viewers) зрителей"
        cell.channelsLabel.text = "\(channel.channels) каналов"
        cell.boxImage.kf.setImage(with: URL(string: channel.game.box.large), placeholder: UIImage(named: "272x380.png"), options: nil, progressBlock: nil, completionHandler: nil)
        return cell
    }
    
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        guard let maxRow = indexPaths.map({ $0.row }).max() else { return }
        if maxRow > channels.count - 3 && !isLoading {
            getData()
        }
    }
    
    func getData() {
        monitor.pathUpdateHandler = { [self] path in
            if path.status == .satisfied {
                isLoading = true
                networkService.sendData(limit: limit, offset: offset) { [weak self] channels in
                    DispatchQueue.main.async {
                        self?.channels = channels
                        self?.streamTableView.reloadData()
                        self?.offset += self?.limit ?? 20
                        self?.isLoading = false
                        guard let savingData = self?.channels else { return }
                        CasheService.setData(channels: savingData)
                    }
                }
            } else {
                channels = CasheService.getData()
                DispatchQueue.main.async {
                    streamTableView.reloadData()
                }
            }
        }
    }
}

