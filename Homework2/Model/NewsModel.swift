//
//  NewsModel.swift
//  Homework2
//
//  Created by Mehmet Dolasan on 14.09.2022.
//

import Foundation

struct NewsModel {
  var name:String
  var image:String
  var description:String
  var link:String
  
  init(name:String,
       image:String,
       description:String,
       link:String){
    
    self.name = name
    self.image = image
    self.description = description
    self.link = link
  }
}
