//
//  AnimalView.swift
//  AnimalInfos
//


import Foundation
import UIKit

class AnimalView: UIView{
    
    var webLink:String?
    var videoId:String?
    
    var openWebAction: ((_ urlString:String)->())?
    var watchVideoAction: ((_ videoName:String) -> ())?

    @IBOutlet weak var watchVideoButton: UIButton!
    
    @IBOutlet weak var openWebActButton: UIButton!
    
    
    override init(frame:CGRect){
        super.init(frame:frame)
        setupView()
    
    }
    required init?(coder:NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView(){
        if let viewForXib = Bundle.main.loadNibNamed("AnimalView", owner: self)?[0] as? UIView{
            viewForXib.frame = self.bounds
            viewForXib.layer.cornerRadius = 25
            addSubview(viewForXib)
            
            watchVideoButton.layer.cornerRadius = 10
            openWebActButton.layer.cornerRadius = 10
        }
        
    }
    
    @IBAction func watchVideoAct(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.1) {
                   sender.alpha = 1
               }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.15 ) {
                   UIView.animate(withDuration: 0.1) {
                    sender.alpha = 1
                   }
               }
        watchVideoAction?(videoId!)
    }
    
    @IBAction func openWebAct(_ sender: UIButton) {
        UIView.animate(withDuration: 0.1) {
                   sender.alpha = 1
            }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.15 ) {
                   UIView.animate(withDuration: 0.1) {
                    sender.alpha = 1.0
                   }
               }
        openWebAction?(webLink!)
    }
    
    
}
