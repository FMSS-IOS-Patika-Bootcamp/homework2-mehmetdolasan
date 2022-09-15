//
//  NewsWebKitViewController.swift
//  Homework2
//
//  Created by Mehmet Dolasan on 14.09.2022.
//

import UIKit
import WebKit

class NewsWebKitViewController: UIViewController {
  
  @IBOutlet weak var webView: WKWebView!
  
  var incomingLink: String?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    if let link = incomingLink {
      print("\(link)")
      
      if let url = URL.init(string: link){
        let urlRequest = URLRequest.init(url: url)
        webView.load(urlRequest)
      }
    }
  }
}

extension NewsWebKitViewController: NewsDetailViewControllerToNewsWebKitViewControllerProtocol {
  func sendLink(link: String) {
    incomingLink = link
  }
}
