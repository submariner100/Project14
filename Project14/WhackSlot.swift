//
//  WhackSlot.swift
//  Project14
//
//  Created by Macbook on 18/04/2017.
//  Copyright © 2017 Chappy-App. All rights reserved.
//


import SpriteKit
import UIKit




class WhackSlot: SKNode {

     var charNode: SKSpriteNode!
     var isVisible = false
     var isHit = false


     func configure(at position: CGPoint) {
          self.position = position
          
          let sprite = SKSpriteNode(imageNamed: "whackHole")
          addChild(sprite)
          
          let cropNode = SKCropNode()
          cropNode.position = CGPoint(x: 0, y: 15)
          cropNode.zPosition = 1
          cropNode.maskNode = SKSpriteNode(imageNamed: "whackMask")
          
          charNode = SKSpriteNode(imageNamed: "penguingood")
          charNode.position = CGPoint(x: 0, y: -90)
          charNode.name = "character"
          cropNode.addChild(charNode)
          
          addChild(cropNode)
          
               
     }
     
     

}
