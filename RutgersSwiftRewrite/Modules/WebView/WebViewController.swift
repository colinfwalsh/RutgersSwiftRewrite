//
//  WebViewController.swift
//  RutgersSwiftRewrite
//
//  Created by Salman Fakhri on 2/7/18.
//  Copyright © 2018 Colin Walsh. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    @IBOutlet weak var progBar: UIProgressView!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var refreshButton: UIButton!
    @IBOutlet weak var forwardButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    var serviceURL = "https://google.com"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        forwardButton.isEnabled = false
        backButton.isEnabled = false
        webView.navigationDelegate = self
        
        progBar.progress = 0.0
        progBar.tintColor = UIColor.blue
        
        backButton.setBackgroundImage(#imageLiteral(resourceName: "backCarretDisabled"), for: .disabled)
        forwardButton.setBackgroundImage(#imageLiteral(resourceName: "forwardCarretDisabled"), for: .disabled)
        backButton.setBackgroundImage(#imageLiteral(resourceName: "backCarret"), for: .normal)
        forwardButton.setBackgroundImage(#imageLiteral(resourceName: "forwardCarret"), for: .normal)
        refreshButton.setBackgroundImage(#imageLiteral(resourceName: "refresh"), for: .normal)
        shareButton.setBackgroundImage(#imageLiteral(resourceName: "share"), for: .normal)
        
        webView.addObserver(self, forKeyPath: "estimatedProgress", options: NSKeyValueObservingOptions.new, context: nil)
        let url = URL(string: serviceURL)!
        let urlRequest = URLRequest(url: url)
        webView.load(urlRequest)
    }
    
    @IBAction func back(_ sender: Any) {
        print("attempting back")
        if webView.canGoBack {
            webView.goBack()
        }
    }
    
    @IBAction func forward(_ sender: Any) {
        if webView.canGoForward {
            webView.goForward()
        }
    }
    
    @IBAction func refresh(_ sender: Any) {
        let url = URL(string: serviceURL)!
        let urlRequest = URLRequest(url: url)
        webView.load(urlRequest)
    }
    
    @IBAction func share(_ sender: Any) {
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress" {
            self.progBar.alpha = 1.0
            progBar.setProgress(Float(webView.estimatedProgress), animated: true)
            if self.webView.estimatedProgress >= 1.0 {
                UIView.animate(withDuration: 0.3, delay: 0.1, options: UIViewAnimationOptions.curveEaseInOut, animations: { () -> Void in
                    self.progBar.alpha = 0.0
                    
                }, completion: { (finished: Bool) -> Void in
                    self.progBar.progress = 0
                })
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = true
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = false
        webView.removeObserver(self, forKeyPath: "estimatedProgress")
    }
}

extension WebViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        backButton.isEnabled = webView.canGoBack
        forwardButton.isEnabled = webView.canGoForward
    }
}
