//
//  imagenews.swift
//  vkontakte
//
//  Created by Аня on 01.04.2022.
//

import Foundation
import UIKit

class imagenews: UICollectionViewCell, UIGestureRecognizerDelegate {
    
    
    @IBOutlet weak var Imagenews: UIImageView!
    
    func imagepost (Image: UIImage?) {
    self.Imagenews.image = Image
   }
   
    
}
