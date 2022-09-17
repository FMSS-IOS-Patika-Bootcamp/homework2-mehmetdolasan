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
  //gelecek link verisini karşılayan değişken
  var incomingLink: String?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    //webview yapılandırması
    if let link = incomingLink {
      if let url = URL.init(string: link){
        let urlRequest = URLRequest.init(url: url)
        webView.load(urlRequest)
      }
    }
  }
}

