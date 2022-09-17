//
//  ViewController.swift
//  Homework2
//
//  Created by Mehmet Dolasan on 13.09.2022.
//

import UIKit

class FeedViewController: UIViewController {
  // MARK: - Değişkenler
  //eklediğimiz collection view ile ilgili işlemler için oluşturuldu.
  @IBOutlet weak var feedCollectionView: UICollectionView!
  //collection view ile view controller bağlantsı için unique identifier değişkeni
  private let feedCellIdentifier = "FeedCollectionViewCell"
  //dummy dataları bir listede tutmak için oluşturulan değişken
  var news:[NewsModel] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    feedCollectionView.register(.init(nibName: feedCellIdentifier, bundle: nil), forCellWithReuseIdentifier: feedCellIdentifier)
    //MARK: - Delegeler
    //collection view delegeleri
    feedCollectionView.delegate = self
    feedCollectionView.dataSource = self
    //MARK: - Dummy Data Oluşturulması
    let news1: NewsModel = NewsModel(name: "Vakıfbank iOS Bootcamp", image: "vakifbank", description: "Lorem Ipsum", link: "https://www.patika.dev/bootcamp/vakifbank-ios-swift-bootcamp")
    let news2: NewsModel = NewsModel(name: "Solid Electron Angular Practicum", image: "solidElectron", description: "Lorem Ipsum", link: "https://www.patika.dev/bootcamp/solid-electron-angular-practicum")
    let news3: NewsModel = NewsModel(name: "A101 Test Otomasyon Practicum", image: "a101", description: "Lorem Ipsum", link: "https://www.patika.dev/bootcamp/a101-test-otomasyon-practicum")
    let news4: NewsModel = NewsModel(name: "Vitra & GoLive SAP Bootcamp", image: "vitra", description: "Lorem Ipsum", link: "https://www.patika.dev/bootcamp/vitra-golive-sap-bootcamp")
    let news5: NewsModel = NewsModel(name: "Papara.Net Core Bootcamp", image: "papara", description: "Lorem Ipsum", link: "https://www.patika.dev/bootcamp/papara-net-core-bootcamp")
    //Oluşturulan dummy dataların listeye eklenme işlemi
    news.append(news1)
    news.append(news2)
    news.append(news3)
    news.append(news4)
    news.append(news5)
    
  }
}

extension FeedViewController: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    //MARK: - CollectionView'de Item Tıklandığında Yapılacaklar
    //verinin gideceği view controller tipinde bir değişken oluşturuldu.
    let destVC = self.storyboard?.instantiateViewController(withIdentifier: "newsDetailViewController") as! NewsDetailViewController
    let news = self.news[indexPath.row]
    //gidilecek view controllerdaki nesneye set etme işlemi
    destVC.incomingNews = news
    //detay view controller'a geçiş yapma işlemi
    navigationController?.pushViewController(destVC, animated: true)
  }
}

extension FeedViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    //dizinin sayısı kadar item gözükmesi için
    return news.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    //her cell için yapılacaklar
    let cell = feedCollectionView.dequeueReusableCell(withReuseIdentifier: feedCellIdentifier, for: indexPath) as! FeedCollectionViewCell
    let news = self.news[indexPath.row]
    
    cell.newsNameLabel.text = news.name
    cell.newsImage.image = UIImage(named: news.image)
    cell.newsDescriptionLabel.text = news.description
    
    return cell
  }
}

extension FeedViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    //her cell için size yapılandırması 
    .init(width: (collectionView.frame.width-30)/2 , height: (collectionView.frame.height - 75)/3)
  }
}

