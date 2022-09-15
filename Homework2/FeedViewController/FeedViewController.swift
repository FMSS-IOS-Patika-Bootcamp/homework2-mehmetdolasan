//
//  ViewController.swift
//  Homework2
//
//  Created by Mehmet Dolasan on 13.09.2022.
//

import UIKit

class FeedViewController: UIViewController {
  
  @IBOutlet weak var feedCollectionView: UICollectionView!
  
  private let feedCellIdentifier = "FeedCollectionViewCell"
  
  var delegate: FeedViewControllerToNewsDetailViewControllerProtocol?
  var news:[NewsModel] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    feedCollectionView.register(.init(nibName: feedCellIdentifier, bundle: nil), forCellWithReuseIdentifier: feedCellIdentifier)
    
    feedCollectionView.delegate = self
    feedCollectionView.dataSource = self
    
    let news1: NewsModel = NewsModel(name: "Vakıfbank iOS Bootcamp", image: "vakifbank", description: "Lorem Ipsum", link: "https://www.patika.dev/bootcamp/vakifbank-ios-swift-bootcamp")
    let news2: NewsModel = NewsModel(name: "Solid Electron Angular Practicum", image: "solidElectron", description: "Lorem Ipsum", link: "https://www.patika.dev/bootcamp/solid-electron-angular-practicum")
    let news3: NewsModel = NewsModel(name: "A101 Test Otomasyon Practicum", image: "a101", description: "Lorem Ipsum", link: "https://www.patika.dev/bootcamp/a101-test-otomasyon-practicum")
    let news4: NewsModel = NewsModel(name: "Vitra & GoLive SAP Bootcamp", image: "vitra", description: "Lorem Ipsum", link: "https://www.patika.dev/bootcamp/vitra-golive-sap-bootcamp")
    let news5: NewsModel = NewsModel(name: "Papara.Net Core Bootcamp", image: "papara", description: "Lorem Ipsum", link: "https://www.patika.dev/bootcamp/papara-net-core-bootcamp")
    
    news.append(news1)
    news.append(news2)
    news.append(news3)
    news.append(news4)
    news.append(news5)
    
  }
}

extension FeedViewController: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    print("\(indexPath.row)")
    
    let destVC = self.storyboard?.instantiateViewController(withIdentifier: "newsDetailViewController") as! NewsDetailViewController
    self.delegate = destVC
    let news = self.news[indexPath.row]
    
    self.delegate?.sendNews(news: news)
    navigationController?.pushViewController(destVC, animated: true)
  }
}

extension FeedViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return news.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = feedCollectionView.dequeueReusableCell(withReuseIdentifier: feedCellIdentifier, for: indexPath) as! FeedCollectionViewCell
    let news = self.news[indexPath.row]
    
    cell.newsNameLabel.text = news.name
    cell.newsImage.image = UIImage(named: news.image)
    cell.newsDescriptionLabel.text = news.description
    
    cell.layer.cornerRadius = 10
    
    return cell
  }
}

extension FeedViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    .init(width: (collectionView.frame.width-30)/2 , height: (collectionView.frame.height)/4)
    
  }
}

