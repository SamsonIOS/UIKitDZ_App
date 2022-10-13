//
//  WKWebViewController.swift
//  UIKitDZ_App
//
//  Created by coder on 11.10.2022.
//

import UIKit
import WebKit

/// webView
final class WebViewController: UIViewController {
    
    // MARK: Visual Components
    private enum Constants {
        static let backButtonItem = UIBarButtonItem(systemItem: .rewind)
        static let forwardButtonItem = UIBarButtonItem(systemItem: .fastForward)
        static let spacer = UIBarButtonItem(systemItem: .flexibleSpace)
        static let refreshButtonItem = UIBarButtonItem(systemItem: .refresh)
        static let shareButtonItem = UIBarButtonItem(systemItem: .action)
    }
    
    // MARK: Public properties
    let loadProgressView: UIProgressView = {
            let progress = UIProgressView()
            progress.progressTintColor = .systemBlue
            progress.tintColor = .tertiaryLabel
            progress.setProgress(0.0, animated: false)
            return progress
        }()
    
    var url = String()
    
    // MARK: Private properties
    private lazy var toolbar: UIToolbar = {
        var toolbar = UIToolbar(frame: CGRect(
            x: 0, y: 760, width: self.view.bounds.width, height: 50))
        toolbar.backgroundColor = .systemGray
        return toolbar
    }()
    
    private lazy var webView: WKWebView = {
        let web = WKWebView(frame: CGRect(
            x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height))
        return web
    }()
    
    private var activityIndicatorContain = UIView()
    private var activityIndicator = UIActivityIndicatorView()
    private var myProgressView = UIProgressView(progressViewStyle: .default)
    private var observation: NSKeyValueObservation?
    private var loadingTimer: Timer?
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }
    
    // MARK: @Objc private action
    @objc private func backAction() {
        guard webView.canGoBack else { return }
        webView.goBack()
    }
    
    @objc private func forwardAction() {
        guard webView.canGoForward else { return }
        webView.goForward()
    }
    
    @objc private func refreshAction() {
        webView.reload()
    }
    
    @objc private func sharedAction() {
        guard let url = webView.url else { return }
        let text = "\(url)"
        let activityViewControler = UIActivityViewController(activityItems: [text], applicationActivities: nil)
        present(activityViewControler, animated: true)
    }
    
    @objc private func loadProgressAction() {
            loadProgressView.progress += 0.0005
        }
    
    // MARK: Private Methods
    private func setView() {
        view.addSubview(webView)
        view.addSubview(toolbar)
        loadRequest()
        setToolBar()
        webView.navigationDelegate = self
        createProgressView()
        createUI()
    }
    
    private func createActivityIndicator() {
        activityIndicatorContain = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        activityIndicatorContain.center.x = webView.center.x
        activityIndicatorContain.center.y = webView.center.y - 43
        activityIndicatorContain.backgroundColor = .none
        activityIndicatorContain.alpha = 0.3
        activityIndicatorContain.layer.cornerRadius = 18
        
        activityIndicator = UIActivityIndicatorView()
        activityIndicator.center.x = 35
        activityIndicator.center.y = 35
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = UIActivityIndicatorView.Style.large
        activityIndicatorContain.addSubview(activityIndicator)
        webView.addSubview(activityIndicatorContain)
    }
    
    private func showActivityIndicator(show: Bool) {
        
        if show {
            activityIndicator.startAnimating()
        } else {
            activityIndicator.stopAnimating()
            activityIndicatorContain.isHidden = true
        }
    }
    
    private func loadRequest() {
        guard let newUrl = URL(string: url) else { return }
        
        let urlRequest = URLRequest(url: newUrl)
        
        webView.load(urlRequest)
    }
    
    private func createProgressView() {
        myProgressView.setProgress(0.5, animated: false)
        observation = webView.observe(\.estimatedProgress, options: [.new]) { [weak self] _, _ in
            guard let self = self else { return }
            self.myProgressView.progress = Float(self.webView.estimatedProgress)
            if self.myProgressView.progress == 1.0 {
                self.myProgressView.isHidden = true
            }
        }
    }
    
    private func setToolBar() {
        toolbar.items = [
            Constants.backButtonItem, Constants.forwardButtonItem,
            Constants.spacer, Constants.shareButtonItem, Constants.refreshButtonItem]
        
        Constants.backButtonItem.action = #selector(backAction)
        Constants.forwardButtonItem.action = #selector(forwardAction)
        Constants.refreshButtonItem.action = #selector(refreshAction)
        Constants.shareButtonItem.action = #selector(sharedAction)
    }
    
    private func createUI() {
           
           webView.navigationDelegate = self
           
           webView.translatesAutoresizingMaskIntoConstraints = false
           
           loadProgressView.frame = CGRect(x: 0, y: 10, width: 200, height: 32)
           loadProgressView.center.x = toolbar.center.x
           toolbar.addSubview(loadProgressView)
           
           loadingTimer = Timer.scheduledTimer(timeInterval: 0.01,
                                                target: self,
                                                selector: #selector(loadProgressAction),
                                                userInfo: nil,
                                                repeats: true)
       }
}

// MARK: Extension - WebViewController + WKNavigationDelegate
extension WebViewController: WKNavigationDelegate {
    
    func webView(
        _ webView: WKWebView,
        decidePolicyFor navigationAction: WKNavigationAction,
        decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
            decisionHandler(.allow)
        }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        Constants.backButtonItem.isEnabled = webView.canGoBack
        Constants.forwardButtonItem.isEnabled = webView.canGoForward
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        showActivityIndicator(show: false)
        loadProgressView.progress += 1.0
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        createActivityIndicator()
        showActivityIndicator(show: true)
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        showActivityIndicator(show: false)
    }
}
