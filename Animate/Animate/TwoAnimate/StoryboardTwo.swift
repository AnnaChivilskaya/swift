//
//  Two.swift
//  Animate
//
//  Created by Аня on 03.10.2021.
//

import UIKit

class MainTwo : UIView {
    
    var Layer: CAShapeLayer?
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let path = UIBezierPath(ovalIn: .init(x: 0, y: 0, width: 100, height: 100))
        path.close()
        path.stroke()
        self.addlayer(path: path)
    }
    func ANimate() {
        let animat = CABasicAnimation(keyPath: "strokeEnd")
        animat.fromValue = 0
        animat.toValue = 1
        animat.duration = 1.5
        animat.repeatCount = .infinity
        animat.timingFunction = .some(.init(controlPoints: 0.1, 0.67, 0.3,  0.9))
        self.Layer?.add(animat, forKey: nil)
    }
    private func addlayer(path: UIBezierPath) {
        let layer = CAShapeLayer()
        layer.path = path.cgPath
        layer.strokeColor = UIColor.blue.cgColor
        layer.fillColor = nil
        layer.strokeStart = 0
        layer.strokeEnd = 0
        layer.lineWidth = 5
        self.layer.addSublayer(layer)
        self.Layer = layer
    }
}
