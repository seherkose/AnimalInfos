//
//  WebViewController.swift
//  AnimalInfos
//
//

import Foundation
import UIKit
import WebKit

class WebViewController: UIViewController{
    @IBOutlet weak var webView: WKWebView!
    
    var urlString:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.load(URLRequest(url: URL(string:urlString!)!))
    }
}
