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
  //gelecek veriyi karşılayan nesne
  var incomingNews: NewsModel?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setThePage()
  }
  
  @IBAction func detailButtonTapped(_ sender: Any) {
    //detay butonuna tıklandığında yapılacaklar
    let destVC = self.storyboard?.instantiateViewController(withIdentifier: "newsWebKitViewController") as! NewsWebKitViewController
    //bu viewdan sadece link verisi gönderiliyor
    if let link = incomingNews?.link {
      //buradaki link webviewdaki link değişkenine set ediliyor
      destVC.incomingLink = link
    }
    //present modally görünümle geçiş için yazılan kod
    present(destVC, animated: true)
  }
  
  func setThePage(){
    //gelen nesnenin kontrollü şekilde alınması
    if let name = incomingNews?.name, let image = incomingNews?.image, let description = incomingNews?.description{
      newsImage.image = UIImage(named: image)
      newsNameLabel.text = name
      newsDescriptionLabel.text = description
      self.title = name
    }
  }
}

