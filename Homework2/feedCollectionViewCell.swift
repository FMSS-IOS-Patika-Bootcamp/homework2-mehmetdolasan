//
//  FeedCollectionViewCell.swift
//  Homework2
//
//  Created by Mehmet Dolasan on 14.09.2022.
//

import UIKit

class FeedCollectionViewCell: UICollectionViewCell {
  
  
  @IBOutlet weak var newsImage: UIImageView!
  @IBOutlet weak var newsNameLabel: UILabel!
  @IBOutlet weak var newsDescriptionLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
  }
  
}
