//
//  ViewController.swift
//  UIwebView
//
//  Created by Vanjo on 28/11/2018.
//  Copyright © 2018 Vanjo. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var WebView: UIWebView!
    
    
    
    @IBOutlet weak var goBackItem: UIBarButtonItem!
    @IBOutlet weak var goForwardItem: UIBarButtonItem!
    @IBOutlet weak var refreshItem: UIBarButtonItem!
    @IBOutlet weak var activityIndecator: UIActivityIndicatorView!
    
    
    let application = UIApplication.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        WebView.delegate = self
//        WebView.scalesPageToFit = true
        
        if let myUrl = URL(string: "https://kbp.by") {
            
        let request = URLRequest(url: myUrl)
        WebView.loadRequest(request)
        }
    }
    
    func isWorkIndicator(isAnimated: Bool, indicator: UIActivityIndicatorView) {
        application.isNetworkActivityIndicatorVisible = isAnimated
        
        if isAnimated {
            activityIndecator.startAnimating()
            activityIndecator.isHidden = false
        } else {
            activityIndecator.stopAnimating()
            activityIndecator.isHidden = true
        }
    }
    
    //Delegate
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        
        isWorkIndicator(isAnimated: true, indicator: activityIndecator)
        print("start Load")
        
        
        self.goBackItem.isEnabled = false
        self.goForwardItem.isEnabled = false
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        isWorkIndicator(isAnimated: false, indicator: activityIndecator)
        print("Did finish load")
        if webView.canGoBack {
            self.goBackItem.isEnabled = true
        }
        if webView.canGoForward {
            self.goForwardItem.isEnabled = true
        }
    }
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebView.NavigationType) -> Bool {
        return true
    }
    
    
    
    @IBAction func goBackAction(_ sender: Any) {
        if WebView.canGoBack {
            WebView.goBack()
        }
    }
    
    @IBAction func goForwardAction(_ sender: Any) {
        if WebView.canGoForward {
            WebView.goForward()
        }
    }
    
    @IBAction func refreshAction(_ sender: Any) {
        WebView.reload()
    }
    
    
    @IBAction func googleAction(_ sender: Any) {
        let request = URLRequest(url: URL(string: "https://google.com")!)
        WebView.loadRequest(request)
    }
    

}

