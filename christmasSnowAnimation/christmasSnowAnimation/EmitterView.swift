//
//  EmitterView.swift
//  christmasSnowAnimation
//
//  Created by Sachin Daingade on 14/12/21.
//

import Foundation
import SwiftUI

public struct EmitterView: UIViewRepresentable {
    
    public func makeUIView(context: Context) ->  UIView {
        let view = UIView()
        view.backgroundColor = .clear
        
        //emitter layer
        let emitterLayer = CAEmitterLayer()
        emitterLayer.emitterShape = .line
        emitterLayer.emitterCells = createEmitterCell()
        // possition
        emitterLayer.emitterSize = CGSize(width: getRect().width , height: 1)
        emitterLayer.emitterPosition = CGPoint(x: getRect().width / 2, y: 0)
        
        view.layer.addSublayer(emitterLayer)
        
        return view
    }
    
    public func updateUIView(_ view: UIView, context: Context) {
        
    }
    
    private func createEmitterCell() -> [CAEmitterCell] {
       
        var arrCell: [CAEmitterCell] = []
        
        for index in 1...12 {
            let cell = CAEmitterCell()
            cell.contents = UIImage(named: getImages(index: index))?.cgImage
            cell.color = getColor().cgColor
            cell.birthRate = 2.5
            cell.lifetime = 15
            cell.velocity = 120
            cell.scale = 0.25
            cell.emissionLatitude = .pi
            
            cell.emissionRange = 0.5
            cell.spin = 1.5
            cell.spinRange = 1
            arrCell.append(cell)
        }
        return arrCell
    }
    
    private func getImages (index: Int) -> String {
        if index < 3 {
            return "snow123"
        }else if index > 4 && index < 6 {
            return "snowflake"
        }else if index > 6 && index < 8 {
            return "snow123"
        }else {
            return "leaf"
        }
    }
    
    private func getColor() -> UIColor {
        let colors: [UIColor] = [.white,.orange,.systemTeal  ]
        return colors.randomElement()!
    }
    
  private func getRect() -> CGRect {
        return UIScreen.main.bounds
    }
}
