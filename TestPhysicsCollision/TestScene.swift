//
//  TestScene.swift
//

import Foundation
import SpriteKit

class TestScene:SKScene {
    
    //現在シーン設定時の呼び出しメソッド
    override func didMoveToView(view: SKView) {
        
        //観測しやすくするため重力を少し弱くする。
        self.physicsWorld.gravity = CGVector(dx:0, dy:-5.0)
        
        //画面端に物理ボディを設定する。
        self.physicsBody = SKPhysicsBody(edgeLoopFromRect: self.frame)
        
        //背景画像のノードを作成する。
        let backNode = SKSpriteNode(imageNamed: "night")
        backNode.size = self.frame.size
        backNode.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
        
        //鳥のノードを作成する。
        let birdBrown = SKSpriteNode(imageNamed: "bird_brown")
        let birdRed = SKSpriteNode(imageNamed: "bird_red")
        let birdBlue = SKSpriteNode(imageNamed: "bird_blue")
        
        //鳥の位置を設定する。
        birdBrown.position = CGPointMake(CGRectGetMidX(self.frame), self.frame.height-100)
        birdRed.position = CGPointMake(CGRectGetMidX(self.frame)-35, self.frame.height-250)
        birdBlue.position = CGPointMake(CGRectGetMidX(self.frame)+35, self.frame.height-350)

        //物理ボディを設定する。
        birdBrown.physicsBody = SKPhysicsBody(texture: birdBrown.texture!, size: birdBrown.size)
        birdRed.physicsBody = SKPhysicsBody(texture: birdRed.texture!, size: birdRed.size)
        birdBlue.physicsBody = SKPhysicsBody(texture: birdBlue.texture!, size: birdBlue.size)
        
        //カテゴリのビットマスクを設定する。
        birdBrown.physicsBody?.categoryBitMask = 1
        birdRed.physicsBody?.categoryBitMask = 1
        birdBlue.physicsBody?.categoryBitMask = 1

        //衝突するカテゴリのビットマスクを設定する。
        birdBrown.physicsBody?.collisionBitMask = 1
        birdRed.physicsBody?.collisionBitMask = 1
        birdBlue.physicsBody?.collisionBitMask = 1

        //他ノードに衝突されても動かなくする。
        birdBrown.physicsBody!.dynamic = false
        birdRed.physicsBody!.dynamic = false
        birdBlue.physicsBody!.dynamic = false
        
        //ノードをシーンに追加する。
        self.addChild(backNode)
        self.addChild(birdBrown)
        self.addChild(birdRed)
        self.addChild(birdBlue)
    }
    
    
    
    //画面タッチ時の呼び出しメソッド
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        //タッチした座標のノードを取得する。
        let location = touches.first!.locationInNode(self)
        let node = nodeAtPoint(location) as! SKSpriteNode
        
        if(node.physicsBody != nil) {        
            //タッチしたノードを落とす。
            node.physicsBody!.dynamic = true
        }

    }
    
}
