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
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    feedCollectionView.register(.init(nibName: feedCellIdentifier, bundle: nil), forCellWithReuseIdentifier: feedCellIdentifier)
    
    feedCollectionView.delegate = self
    feedCollectionView.dataSource = self
    
  }
}

extension FeedViewController: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    print("\(indexPath.row)")
  }
}

extension FeedViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 10
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = feedCollectionView.dequeueReusableCell(withReuseIdentifier: feedCellIdentifier, for: indexPath) as! FeedCollectionViewCell
    //cell.backgroundColor = UIColor.init(red: 0.971, green: 0.747, blue: 0.365, alpha: 1.0)
    cell.layer.cornerRadius = 10
    return cell
  }
}

extension FeedViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    .init(width: (collectionView.frame.width-30)/2 , height: (collectionView.frame.height)/4)
    
  }
}

