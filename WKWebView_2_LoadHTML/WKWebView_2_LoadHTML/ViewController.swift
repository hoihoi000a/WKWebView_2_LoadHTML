//
//  ViewController.swift
//  WKWebView_2_LoadHTML
//
//  Created by allion on 2020/3/18.
//  Copyright © 2020 Newman. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var mWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        loadHTMLURL()
//        loadHTMLString()
    }

    private func loadHTMLURL(){
        mWebView.navigationDelegate = self

         let url = Bundle.main.url(forResource: "index", withExtension: "html", subdirectory: "web")!
         mWebView.loadFileURL(url, allowingReadAccessTo: url)
    }
    
    private func loadHTMLString(){
        mWebView.navigationDelegate = self
        let HTML = try! String(contentsOfFile: Bundle.main.path(forResource: "demo", ofType: "html",inDirectory:"web")!, encoding: String.Encoding.utf8)
        mWebView.loadHTMLString(HTML, baseURL: nil)
        self.view.addSubview(mWebView)
    }

}

extension ViewController: WKNavigationDelegate{
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        print(error.localizedDescription)
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("start")
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("finish")
    }
}
