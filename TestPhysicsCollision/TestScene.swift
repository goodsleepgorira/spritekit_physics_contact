//
//  TestScene.swift
//

import Foundation
import SpriteKit

class TestScene:SKScene {
    
    var birdBrown:SKSpriteNode!
    var testLabel:SKLabelNode!
    
    //現在シーン設定時の呼び出しメソッド
    override func didMoveToView(view: SKView) {
        
        //背景画像のノードを作成する。
        let backNode = SKSpriteNode(imageNamed: "night")
        backNode.size = self.frame.size
        backNode.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
        
        //ラベルノードを作成する。
        testLabel = SKLabelNode(text: "テスト開始")
        testLabel.position = CGPointMake(CGRectGetMidX(self.frame), self.frame.height-50)
        
        //鳥のノードを作成する。
        birdBrown = SKSpriteNode(imageNamed: "bird_brown")
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
        birdBrown.physicsBody?.categoryBitMask = 0b0001
        birdRed.physicsBody?.categoryBitMask = 0b0010
        birdBlue.physicsBody?.categoryBitMask = 0b0100

        //重力の影響を受けないようにする。
        birdBrown.physicsBody!.affectedByGravity = false
        birdRed.physicsBody!.affectedByGravity = false
        birdBlue.physicsBody!.affectedByGravity = false
        
        //ノードをシーンに追加する。
        self.addChild(backNode)
        self.addChild(testLabel)
        self.addChild(birdBrown)
        self.addChild(birdRed)
        self.addChild(birdBlue)
    }
    
    
    
    //画面タッチ時の呼び出しメソッド
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        //画面をタッチした座標に移動するアクションを作成する。
        let location = touches.first!.locationInNode(self)
        let action = SKAction.moveTo(CGPoint(x:location.x, y:location.y), duration:0.1)

        //アクションを実行する。
        birdBrown.runAction(action)
    }

}
