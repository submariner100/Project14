//
//  GameScene.swift
//  Project14
//
//  Created by Macbook on 18/04/2017.
//  Copyright © 2017 Chappy-App. All rights reserved.
//  Delete Actions.sks.
//  Open GameScene.sks and delete the "Hello World" label
//  Change the scene's anchor point to X:0, Y:0 its width to 1024 and its height to 768.
//  Open Assets.xcassets and delete the Spaceship image.
//  Delete all boiler code as per below.


import SpriteKit
import GameplayKit


class GameScene: SKScene {

     var popupTime = 0.85
     var slots = [WhackSlot]()
     var gameScore: SKLabelNode!
     var score: Int = 0 {
          didSet {
               gameScore.text = "Score: \(score)"
               
          }
     }
     
     func createSlot(at position: CGPoint) {
          let slot = WhackSlot()
          slot.configure(at: position)
          addChild(slot)
          slots.append(slot)
     
     }
     
     func createEnemy() {
          popupTime *= 0.991
          
          slots = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: slots) as! [WhackSlot]
          slots[0].show(hideTime: popupTime)
          
          if RandomInt(min: 0, max: 12) > 4 { slots[1].show(hideTime: popupTime) }
          if RandomInt(min: 0, max: 12) > 8 { slots[2].show(hideTime: popupTime) }
          if RandomInt(min: 0, max: 12) > 11 { slots[3].show(hideTime: popupTime) }
          if RandomInt(min: 0, max: 12) > 12 { slots[4].show(hideTime: popupTime) }
          
          let minDelay = popupTime / 2.0
          let maxDelay = popupTime * 2
          let delay = RandomDouble(min: minDelay, max: maxDelay)
          
          DispatchQueue.main.asyncAfter(deadline: .now() + delay) { [unowned self] in
               self.createEnemy()
           }
          }

     
     
     override func didMove(to view: SKView) {
     
          let background = SKSpriteNode(imageNamed: "whackBackground")
          background.position = CGPoint(x: 512, y: 384)
          background.blendMode = .replace
          background.zPosition = -1
          addChild(background)
          
          gameScore = SKLabelNode(fontNamed: "Chalkduster")
          gameScore.text = "Score: 0"
          gameScore.position = CGPoint(x: 8, y: 8)
          gameScore.horizontalAlignmentMode = .left
          gameScore.fontSize = 48
          addChild(gameScore)
          
          for i in 0 ..< 5 { createSlot(at: CGPoint(x: 100 + (i * 170), y: 410)) }
          for i in 0 ..< 4 { createSlot(at: CGPoint(x: 180 + (i * 170), y: 320)) }
          for i in 0 ..< 5 { createSlot(at: CGPoint(x: 100 + (i * 170), y: 230)) }
          for i in 0 ..< 4 { createSlot(at: CGPoint(x: 180 + (i * 170), y: 140)) }
          
          
          DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [unowned self] in
               self.createEnemy()
        
          }
     
     }
     
     
        
     override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
     
     }
        
   }
