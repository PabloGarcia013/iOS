//
//  GameScene.swift
//  App_CICEBird
//
//  Created by CICE on 14/3/16.
//  Copyright (c) 2016 CICE. All rights reserved.
//

import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    
    // MARK: - Sprites
    
    var bird = SKSpriteNode()
    var background = SKSpriteNode()
    var pipeFinal1 = SKSpriteNode()
    var pipeFinal2 = SKSpriteNode()
    var coin = SKSpriteNode()
    var scoreLabel = SKLabelNode()
    var gameOverLabel = SKSpriteNode()
    
    // MARK: - Nodes
    
    var limitLand = SKNode()
    var limitSky = SKNode()
    let movingGroup = SKNode()

    // Mark: - Timers
    var timer = NSTimer()
    var timerRotateBird = NSTimer()
    var timerCoin = NSTimer()
    
    // Mark: - Flags
    var gameOver = false
    var score = 0

    //MARK: - Groups
    let birdGroup : UInt32 =  1
    let objectsGroup : UInt32 = 2
    let gapGroup : UInt32 = 4
    let coinGroup : UInt32 = 5
    
    
    
    //MARK: - Setup your scene here
    
    override func didMoveToView(view: SKView) {
        
        self.physicsWorld.contactDelegate = self
        self.physicsWorld.gravity = CGVectorMake(0, -10)
        
        initGame()
    
    }
    
    func initGame(){
        score = 0
        gameOver = false;
        
        self.addChild(movingGroup)
        
        makeBottomLimit()
        makeTopLimit()
        makeBackground()
        makeBird()
        makeLoopRotateBird()
        makeLoopPie1AndPipe2()
        makeLoopCoin()
        makeLabel()
        

        movingGroup.speed = 1
    }
    
    func didBeginContact(contact: SKPhysicsContact) {
        
        if contact.bodyA.categoryBitMask == coinGroup || contact.bodyB.categoryBitMask == coinGroup{
            
        
        }else if contact.bodyA.categoryBitMask == gapGroup || contact.bodyB.categoryBitMask == gapGroup{
            
            score++
            scoreLabel.text = "\(score)"
            
        }else if !gameOver{
            
            animateDeadBird()
            
            gameOver = true
            movingGroup.speed = 0
            
            timer.invalidate()
            timerRotateBird.invalidate()
            timerCoin.invalidate()
            
            makeLableGameOverFinal()
        }

    }
    
    func animateDeadBird(){
        
        let birdDead = SKTexture (imageNamed: "flappy3.png")
        let animationBird = SKAction.animateWithTextures([birdDead, birdDead], timePerFrame: 0.3)
        let makeBirdForever = SKAction.repeatActionForever(animationBird)
        bird.runAction(makeBirdForever)

        bird.physicsBody?.applyImpulse(CGVectorMake(3, 0))
        bird.physicsBody?.allowsRotation = false
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        if (gameOver == false){

            bird.physicsBody?.velocity = CGVectorMake(0, 0)
            bird.physicsBody?.applyImpulse(CGVectorMake(0, 32))
            bird.zRotation = 1
            
        }else{
            
            resetGame()
            
        }
       
    }
   
    
    //MARK: -Called before each frame is rendered
    override func update(currentTime: CFTimeInterval) {
        
    }
    
    func makeTopLimit(){

        limitSky.position = CGPointMake(0, self.frame.size.height)
        limitSky.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(self.frame.size.width*2, 1))
        limitSky.physicsBody?.dynamic = false
        limitSky.physicsBody?.categoryBitMask = objectsGroup
        
        limitSky.zPosition = 3
        
        self.movingGroup.addChild(limitSky)
    }
    
    
    func makeBottomLimit(){
        
        limitLand.position = CGPointMake(0, 120)
        limitLand.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(self.frame.size.width*2, 1))
        limitLand.physicsBody?.dynamic = false
        limitLand.physicsBody?.categoryBitMask = objectsGroup
        
        limitLand.zPosition = 3
        
        self.movingGroup.addChild(limitLand)
    }
    
    
    func makeBackground(){
        
        let backgroundFinal = SKTexture (imageNamed: "bg.png")
        let moveBackgroud = SKAction.moveByX(-backgroundFinal.size().width, y: 0, duration: 7)
        let replaceBackground = SKAction.moveByX(backgroundFinal.size().width, y: 0, duration: 0)
        let moveBackgroundForever = SKAction.repeatActionForever(SKAction.sequence([moveBackgroud, replaceBackground]))
        
        for var indice : CGFloat = 0; indice < 3; ++indice{
            
            background = SKSpriteNode(texture: backgroundFinal)
            background.position = CGPoint(x: (backgroundFinal.size().width / 2) + (backgroundFinal.size().width * indice), y: CGRectGetMidY(self.frame))
            background.zPosition = 1
            background.size.height = self.frame.height
            background.runAction(moveBackgroundForever)

            self.movingGroup.addChild(background)
  
        }
    }

    func makePipesFinal(){
        
        let gapHeight = bird.size.height * 6;
        let movementAmount = arc4random_uniform(UInt32(self.frame.size.height / 2))
        let pipeOffSet = CGFloat(movementAmount) - self.frame.size.height / 4
        
        let movePipes = SKAction.moveByX(-self.frame.size.width, y: 0, duration: NSTimeInterval(8))
        let removePipes = SKAction.removeFromParent()
        let moveAndRemovePipes = SKAction.sequence([movePipes, removePipes])
        
        let pipeTexture1 = SKTexture(imageNamed: "pipe1.png")
        pipeFinal1 = SKSpriteNode(texture: pipeTexture1)
        pipeFinal1.position = CGPointMake(self.frame.size.width, CGRectGetMidY(self.frame) + (pipeFinal1.size.height/2) + (gapHeight/2) + pipeOffSet)
        pipeFinal1.zPosition = 5
        
        pipeFinal1.physicsBody = SKPhysicsBody(rectangleOfSize: pipeFinal1.size)
        pipeFinal1.physicsBody?.dynamic = false
        pipeFinal1.physicsBody?.categoryBitMask = objectsGroup
        pipeFinal1.runAction(moveAndRemovePipes)
        
        self.movingGroup.addChild(pipeFinal1)
        
        let pipeTexture2 = SKTexture(imageNamed: "pipe2.png")
       
        pipeFinal2 = SKSpriteNode(texture: pipeTexture2)
        pipeFinal2.position = CGPointMake(self.frame.size.width, CGRectGetMidY(self.frame) - (pipeFinal2.size.height/2) - (gapHeight/2) + pipeOffSet)
        pipeFinal2.zPosition = 5
        
        pipeFinal2.physicsBody = SKPhysicsBody(rectangleOfSize: pipeFinal2.size)
        pipeFinal2.physicsBody?.dynamic = false
        pipeFinal2.physicsBody?.categoryBitMask = objectsGroup
        pipeFinal2.runAction(moveAndRemovePipes)

        self.movingGroup.addChild(pipeFinal2)
        
        
        let gap = SKNode()
        
        gap.position = CGPointMake(self.frame.width, CGRectGetMidY(self.frame) + pipeOffSet)
        gap.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(pipeFinal1.size.width/2, gapHeight))
        gap.physicsBody?.dynamic = false
        gap.zPosition = 5
        gap.runAction(moveAndRemovePipes)
        gap.physicsBody?.categoryBitMask = gapGroup
        self.movingGroup.addChild(gap)
        
        
    }
    
    
    func makeBird(){
        
        let birdTexture1 = SKTexture(imageNamed: "flappy1.png")
        let birdTexture2 = SKTexture(imageNamed: "flappy2.png")
     
        let animationBird = SKAction.animateWithTextures([birdTexture1, birdTexture2], timePerFrame: 0.1)
        
        let makeBirdForever = SKAction.repeatActionForever(animationBird)
        
        bird = SKSpriteNode(texture: birdTexture1)
        bird.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame))
        bird.zPosition = 10
        bird.runAction(makeBirdForever)

        bird.physicsBody = SKPhysicsBody(circleOfRadius: bird.size.width / 3)
        bird.physicsBody?.dynamic = true
        bird.physicsBody?.allowsRotation = true
        
        bird.physicsBody?.categoryBitMask = birdGroup
        bird.physicsBody?.collisionBitMask = objectsGroup
        bird.physicsBody?.contactTestBitMask = objectsGroup | gapGroup | coinGroup

        self.addChild(bird)
        
    }
    
    func makeCoin(){
        
        let coinTexture1 = SKTexture(imageNamed: "coin1.png")
        let coinTexture2 = SKTexture(imageNamed: "coin2.png")
        let coinTexture3 = SKTexture(imageNamed: "coin3.png")
        let coinTexture4 = SKTexture(imageNamed: "coin4.png")
        
        let animationCoin = SKAction.animateWithTextures([coinTexture1, coinTexture2, coinTexture3, coinTexture4], timePerFrame: 0.1)
        
        let makeAnimationCoin = SKAction.repeatActionForever(animationCoin)
        
        coin = SKSpriteNode(texture: coinTexture1)
        
        let moveCoin = SKAction.moveByX(-self.frame.size.width, y: 0, duration: NSTimeInterval(8))
        let removeCoin = SKAction.removeFromParent()
        
        let moveAndRemoveCoins = SKAction.sequence([moveCoin, removeCoin])
        
        coin.runAction(moveAndRemoveCoins)
        coin.runAction(makeAnimationCoin)
        coin.position = CGPointMake(self.frame.size.width, CGRectGetMidY(self.frame))
        coin.zPosition = 7
        
        coin.physicsBody = SKPhysicsBody(rectangleOfSize: coin.size)
        coin.physicsBody?.dynamic = false
        coin.physicsBody?.categoryBitMask = gapGroup | coinGroup
        
        self.movingGroup.addChild(coin)
        
        
    }
    
    func makeLabel(){
        
        scoreLabel.fontName = "Helvetica-Bold"
        scoreLabel.fontSize = 80
        scoreLabel.text = "0"
        scoreLabel.position = CGPointMake(CGRectGetMidX(self.frame), self.frame.height-70)
        scoreLabel.zPosition = 15
        self.addChild(scoreLabel)
        
    }
    
    func makeLableGameOverFinal(){
        let gameOverTexture = SKTexture(imageNamed: "game_over.png")
        gameOverLabel = SKSpriteNode(texture: gameOverTexture)
        
        gameOverLabel.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))
        gameOverLabel.zPosition = 16
        self.addChild(gameOverLabel)
        
    }
    
    func makeLoopPie1AndPipe2(){
        
        timer = NSTimer.scheduledTimerWithTimeInterval(3,
            target: self,
            selector: "makePipesFinal",
            userInfo: nil,
            repeats: true)
        
    }
    
    func makeLoopRotateBird(){
        timerRotateBird = NSTimer.scheduledTimerWithTimeInterval(0.05,
            target: self,
            selector: "rotateBird",
            userInfo: nil,
            repeats: true)
    }
    
    func makeLoopCoin(){
        timerCoin = NSTimer.scheduledTimerWithTimeInterval(1,
            target: self,
            selector: "makeCoin",
            userInfo: nil,
            repeats: true)
    }
    
    func resetGame(){
        
        movingGroup.removeAllChildren()
        gameOverLabel.removeFromParent()
        
        self.removeAllChildren()
        
        initGame()
        
    }
    
    
    func rotateBird(){
        bird.zRotation = bird.zRotation - 0.1;
    }
    
    
    
}
