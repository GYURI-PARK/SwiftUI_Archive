//
//  ViewController.swift
//  SwiftSoupPractice
//
//  Created by GYURI PARK on 2023/06/24.
//

import UIKit
import WebKit

final class ViewController: UIViewController, WKNavigationDelegate {

    private let webView: WKWebView = {
        let prefs = WKPreferences()
        prefs.javaScriptEnabled = true
        let pagePrefs = WKWebpagePreferences()
        pagePrefs.allowsContentJavaScript = true
        let config = WKWebViewConfiguration()
        config.preferences = prefs
        config.defaultWebpagePreferences = pagePrefs
        let webview = WKWebView(frame: .zero,
                                configuration: config)
        webview.translatesAutoresizingMaskIntoConstraints = false
        return webview
    }()
    
    private let parser = HTMLParser()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //guard let url = URL(string: "https://techcrunch.com") else { return }
        guard let url = URL(string: "https://dive.hyundaicard.com/web/main.hdc") else { return }
        view.addSubview(webView)
        webView.navigationDelegate = self
        webView.load(URLRequest(url: url))
        
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            webView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            webView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            webView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        webView.evaluateJavaScript("document.body.innerHTML;") { [weak self] result, error in
            guard let html = result as? String, error == nil else {
                print("Failed to get HTML")
                return
            }
            
            self?.parser.parse(html: html)
        }
    }


}

