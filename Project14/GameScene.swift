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


class GameScene: SKScene {

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
          
        
     }
     
     
        
     override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
     
     }
        
   }
