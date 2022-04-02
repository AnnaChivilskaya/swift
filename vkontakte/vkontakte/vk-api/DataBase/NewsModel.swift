//
//  NewsModel.swift
//  vkontakte
//
//  Created by Аня on 30.03.2022.
//

import Foundation
import UIKit

struct NewsModel {
    
    let group: Groups
    let time: String
    let text: String?
    let image: UIImage?
    
    var isLiked: Bool?
    var likesCounter: Int?
    var commentCounter: Bool?
    var shareCounter: Int?
    

    init (group: Groups, time: String, text: String?, image: UIImage?,  isLiked: Bool?, likesCounter: Int?, commentCounter: Bool?, shareCounter: Int?){
        self.group = group
        self.time = time
        self.text = text ?? nil
        self.image = image ??  nil
        self.isLiked = isLiked ?? false
        self.likesCounter = likesCounter ?? nil
        self.commentCounter = commentCounter ?? false
        self.shareCounter = shareCounter ?? nil
    }
    
}



