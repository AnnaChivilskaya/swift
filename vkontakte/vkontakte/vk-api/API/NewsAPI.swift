//
//  NewsAPI.swift
//  vkontakte
//
//  Created by Аня on 30.03.2022.
//

import Foundation
import UIKit

struct NewsAPI {
    
    let group: Groups
    let time: String
    let text: String?
    let images: [UIImage]?
    var youliked: Bool?
    var allike: Int?
    var numbercomment: Int?
    var numberviews: Int?
    
    init(group: Groups, time:  String, text: String?, images: [UIImage]?, youliked: Bool?, allike: Int?, numbercomment: Int?, numberviews: Int?) {
          
        self.youliked = youliked  ??  nil
        self.allike = allike ?? nil
        self.numbercomment = numbercomment ?? nil
        self.numberviews = numberviews ?? nil
        self.group = group
        self.time = time
        self.text = text
        self.images = images ?? nil
        
    }
}

