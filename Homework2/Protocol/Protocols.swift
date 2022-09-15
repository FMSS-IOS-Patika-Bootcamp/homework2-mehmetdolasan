//
//  Protocols.swift
//  Homework2
//
//  Created by Mehmet Dolasan on 14.09.2022.
//

import Foundation

protocol FeedViewControllerToNewsDetailViewControllerProtocol {
  func sendNews(news: NewsModel)
}

protocol NewsDetailViewControllerToNewsWebKitViewControllerProtocol {
  func sendLink(link: String)
}
