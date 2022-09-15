//
//  NewsDetailViewController.swift
//  Homework2
//
//  Created by Mehmet Dolasan on 14.09.2022.
//

import UIKit

class NewsDetailViewController: UIViewController {
  
  @IBOutlet weak var newsImage: UIImageView!
  @IBOutlet weak var newsNameLabel: UILabel!
  @IBOutlet weak var newsDescriptionLabel: UILabel!
  
  var incomingNews: NewsModel?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setThePage()
  }
  
  @IBAction func detailButtonTapped(_ sender: Any) {
    let destVC = self.storyboard?.instantiateViewController(withIdentifier: "newsWebKitViewController") as! NewsWebKitViewController
    present(destVC, animated: true)
  }
  
  func setThePage(){
    if let name = incomingNews?.name, let image = incomingNews?.image, let description = incomingNews?.description{
      newsImage.image = UIImage(named: image)
      newsNameLabel.text = name
      newsDescriptionLabel.text = description
    }
  }
  
}

extension NewsDetailViewController: FeedViewControllerToNewsDetailViewControllerProtocol {
  func sendNews(news: NewsModel) {
    incomingNews = news
  }
}
