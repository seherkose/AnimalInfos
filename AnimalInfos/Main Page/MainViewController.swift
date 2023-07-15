//
//  File.swift
//  AnimalInfos
//

import Foundation
import UIKit

import AVKit
import AVFoundation

class MainViewController: UIViewController{
    
    @IBOutlet weak var cheetahView: AnimalView!
    @IBOutlet weak var giraffeView: AnimalView!
    @IBOutlet weak var gorillaView: AnimalView!
    @IBOutlet weak var hippoView: AnimalView!
    @IBOutlet weak var lionView: AnimalView!
    @IBOutlet weak var ostrichView: AnimalView!
    @IBOutlet weak var zebraView: AnimalView!
    @IBOutlet weak var elephantView: AnimalView!
    
    
    @IBOutlet weak var cheetahImage: UIImageView!
    @IBOutlet weak var giraffeImage: UIImageView!
    @IBOutlet weak var gorillaImage: UIImageView!
    @IBOutlet weak var hippoImage: UIImageView!
    @IBOutlet weak var lionImage: UIImageView!
    @IBOutlet weak var ostrichImage: UIImageView!
    @IBOutlet weak var zebraImage: UIImageView!
    @IBOutlet weak var elephantImage: UIImageView!
    
    private var playerViewController: AVPlayerViewController?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Animals"
        setupMyViews()
        
        cheetahImage.layer.cornerRadius = 25
        giraffeImage.layer.cornerRadius = 25
        gorillaImage.layer.cornerRadius = 25
        hippoImage.layer.cornerRadius = 25
        lionImage.layer.cornerRadius = 25
        ostrichImage.layer.cornerRadius = 25
        zebraImage.layer.cornerRadius = 25
        elephantImage.layer.cornerRadius = 25

    }
    
    private func setupMyViews(){
        cheetahView.webLink = "https://en.wikipedia.org/wiki/Cheetah"
        giraffeView.webLink = "https://en.wikipedia.org/wiki/Giraffe"
        gorillaView.webLink = "https://en.wikipedia.org/wiki/Gorilla"
        hippoView.webLink = "https://en.wikipedia.org/wiki/Hippopotamus"
        lionView.webLink = "https://en.wikipedia.org/wiki/Lion"
        ostrichView.webLink = "https://en.wikipedia.org/wiki/Common_ostrich"
        zebraView.webLink = "https://en.wikipedia.org/wiki/Zebra"
        elephantView.webLink = "https://en.wikipedia.org/wiki/Elephant"
        
        cheetahView.openWebAction = routeWebVC()
        giraffeView.openWebAction = routeWebVC()
        gorillaView.openWebAction = routeWebVC()
        hippoView.openWebAction = routeWebVC()
        lionView.openWebAction = routeWebVC()
        ostrichView.openWebAction = routeWebVC()
        zebraView.openWebAction = routeWebVC()
        elephantView.openWebAction = routeWebVC()
        
        cheetahView.videoId = "cheetah"
        giraffeView.videoId = "giraffe"
        gorillaView.videoId = "gorilla"
        hippoView.videoId = "hippo"
        lionView.videoId = "lion"
        ostrichView.videoId = "ostrich"
        zebraView.videoId = "zebra"
        elephantView.videoId = "elephant"
        
        cheetahView.watchVideoAction = routeVideoLink()
        giraffeView.watchVideoAction = routeVideoLink()
        gorillaView.watchVideoAction = routeVideoLink()
        hippoView.watchVideoAction = routeVideoLink()
        lionView.watchVideoAction = routeVideoLink()
        ostrichView.watchVideoAction = routeVideoLink()
        zebraView.watchVideoAction = routeVideoLink()
        elephantView.watchVideoAction = routeVideoLink()
        
    }
    
    func routeWebVC() -> (String) -> (){
        return { urlString in
            let storyboard = UIStoryboard(name: "WebViewController", bundle: nil)
            if let webVC = storyboard.instantiateViewController(withIdentifier: "WebViewController") as? WebViewController {
                webVC.urlString = urlString
                self.navigationController?.pushViewController(webVC, animated: true)
            }
        }
        
    }
    
    func routeVideoLink() -> (String) -> (){
        
        return { [weak self] videoName in
            guard let self = self else { return }
            
            guard let videoURL = Bundle.main.url(forResource: videoName, withExtension: "mp4") else {
                print("Video file not found")
                return
            }
            self.playerViewController = AVPlayerViewController()
            let player = AVPlayer(url: videoURL)
            self.playerViewController?.player = player
            
            if let playerViewController = self.playerViewController {
                self.present(playerViewController, animated: true) {
                    player.play()
                }
                
            }
        }
    }
}
