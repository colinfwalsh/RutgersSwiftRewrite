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
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var forwardButton: UIBarButtonItem!
    @IBOutlet weak var shareButton: UIBarButtonItem!
    @IBOutlet weak var refreshButton: UIBarButtonItem!
    var obs: NSKeyValueObservation?
    var serviceURL = "https://google.com"
    override func viewDidLoad() {
        super.viewDidLoad()
        forwardButton.isEnabled = false
        backButton.isEnabled = false
        webView.navigationDelegate = self
        progBar.progress = 0.0
        progBar.tintColor = UIColor.blue
        self.obs = webView.observe(\.estimatedProgress, options: [.new]) {(webView, _) in
            self.progBar.alpha = 1.0
            self.progBar.setProgress(Float(webView.estimatedProgress), animated: true)
            if webView.estimatedProgress >= 1.0 {
                UIView.animate(withDuration: 0.3,
                               delay: 0.1,
                               options: UIViewAnimationOptions.curveEaseInOut,
                               animations: { () -> Void in
                                self.progBar.alpha = 0.0
                }, completion: { _ in
                    self.progBar.progress = 0
                })
            }
        }
        loadPageWithUrl(urlString: serviceURL)
    }
    func loadPageWithUrl(urlString: String) {
        guard let url = URL(string: urlString) else {return}
        let urlRequest = URLRequest(url: url)
        webView.load(urlRequest)
    }
    @IBAction func back(_ sender: Any) {
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
        loadPageWithUrl(urlString: serviceURL)
    }
    @IBAction func share(_ sender: Any) {
    }
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = false
        // Do not remove observer here!  This is not safe!
        // webView.removeObserver(self, forKeyPath: "estimatedProgress")
    }
    deinit {
        self.obs?.invalidate()
    }
}

extension WebViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        backButton.isEnabled = webView.canGoBack
        forwardButton.isEnabled = webView.canGoForward
    }
}
