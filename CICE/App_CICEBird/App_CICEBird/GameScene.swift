//
//  GameScene.swift
//  App_CICEBird
//
//  Created by CICE on 14/3/16.
//  Copyright (c) 2016 CICE. All rights reserved.
//

import SpriteKit

//MARK: - FASE 7 -> COLISIONES

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    //MARK: - VARIABLES LOCALES GLOBALES
    //Un Sprite es un Nodo que dibuja una imagen texturizada, un ciadro de color permitira mezclas, tambien proporciona sombreados y efectos de renderizado
    var bird = SKSpriteNode()
    var background = SKSpriteNode()
    var limitLand = SKNode()
    var limitSky = SKNode()
    var pipeFinal1 = SKSpriteNode()
    var pipeFinal2 = SKSpriteNode()
    var coin = SKSpriteNode()
    var timer = NSTimer()
    var timerRotateBird = NSTimer()
    var gameOver = false
    
    var score = 0
    var scoreLabel = SKLabelNode()
    var gameOverLabel = SKSpriteNode()
    
    // FASE 7.1 ->
    // Definimos los grupos de los objetos(categorias)
    let birdGroup : UInt32 =  1
    let objectsGroup : UInt32 = 2
    let gapGroup : UInt32 = 4
    let coinGroup : UInt32 = 5
    

    // FASE 9 -> creamos un nodo especial que me puede agrupar nodos y obtener subnodos anidados.
    // El objetivo es detener las tuberias y el fondo.
    let movingGroup = SKNode()
    
    //MARK: - Setup your scene here
    
    override func didMoveToView(view: SKView) {
        
            
            //Fase 7 . Definicion de delegado para tener en cuenta las colisiones.
            self.physicsWorld.contactDelegate = self
            
            //Fase 7.1 -> Podemos redefinir nuestra gravedad (-9.8 m/s)
            self.physicsWorld.gravity = CGVectorMake(0, -10)
            self.addChild(movingGroup)
            
            //FASE -> 4 . CREACION DE LA TIERRA
            makelimitLand()
            makeLimitSky()
            
            //FASE -> 2 . CREACION DE FONDO
            makeBackground()
            
            //FASE -> 1 . CREACION DEL PAJARO
            makeBird()
            makeLoopRotateBird()
        
            makeLoopPie1AndPipe2()
        
            makeLabel()
            
            //FASE -> 6 CREACION DE LAS TUBERIAS
        
        

    }
    
    func didBeginContact(contact: SKPhysicsContact) {
        
        
        if contact.bodyA.categoryBitMask == gapGroup || contact.bodyB.categoryBitMask == gapGroup{
            
            score++
            scoreLabel.text = "\(score)"
            
        }else if !gameOver{
            
            let birdDead = SKTexture (imageNamed: "flappy3.png")
        
            let animationBird = SKAction.animateWithTextures([birdDead, birdDead], timePerFrame: 0.3)
            
            
            let makeBirdForever = SKAction.repeatActionForever(animationBird)
            bird.runAction(makeBirdForever)
            
            gameOver = true
            movingGroup.speed = 0
            timer.invalidate()
            timerRotateBird.invalidate()
            bird.physicsBody?.applyImpulse(CGVectorMake(3, 0))
            bird.physicsBody?.allowsRotation = false
            
            makeLableGameOverFinal("GAME OVER")
        }

    }
    
    
    //MARK: FASE 5 - Called when a touch begins
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        if (gameOver == false){
            //FASE 5 -> Cada vez que toquemos nuestra pantalla vamos a cambiar la fisica del pajaro
            //lo primero es que la velocidad del pajaro es "0" esto lo hacemos creando un vector
            bird.physicsBody?.velocity = CGVectorMake(0, 0)
            
            //aqui una vez que le dejo quieto le doy un pequeño impulso
            bird.physicsBody?.applyImpulse(CGVectorMake(0, 35))
            bird.zRotation = 1
        }else{
            if bird.physicsBody?.velocity == CGVectorMake(0, 0){
                
                resetGame(0, resetScoreLabel: "0", resetPosition: CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame)), resetVelocity: CGVectorMake(0, 0), resetSpeedOfGame: 1)
            }
            
        }
       
    }
   
    
    //MARK: -Called before each frame is rendered
    override func update(currentTime: CFTimeInterval) {
        
    }
    
    //MARK: - UTILS - FASE 4 -> CREACION DE LA TIERRA
    func makeLimitSky(){
        //Fase 4.1 -> le decimos que la linea de la posicion de la tierra es abajo a la izquierda
        limitSky.position = CGPointMake(0, self.frame.size.height)
        
        //Fase 4.2 -> asignamos caracteristicas fisicas a la linea de la tierra
        limitSky.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(self.frame.size.width*2, 1))
        
        //Fase 4.3 -> la tierra es dinamica y este booleano es falso para evitar que caiga
        limitSky.physicsBody?.dynamic = false
        
        //Fase 7 -> Definicion de la categoria a la que pertenece.
        limitSky.physicsBody?.categoryBitMask = objectsGroup
        
        limitSky.zPosition = 3
        
        //self.addChild(limitSky)
        self.movingGroup.addChild(limitSky)
    }
    
    
    func makelimitLand(){
        
        //Fase 4.1 -> le decimos que la linea de la posicion de la tierra es abajo a la izquierda
        limitLand.position = CGPointMake(0, 0)
        
        //Fase 4.2 -> asignamos caracteristicas fisicas a la linea de la tierra
        limitLand.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(self.frame.size.width*2, 1))
        
        //Fase 4.3 -> la tierra es dinamica y este booleano es falso para evitar que caiga
        limitLand.physicsBody?.dynamic = false
        
        //Fase 7 -> Definicion de la categoria a la que pertenece.
        limitLand.physicsBody?.categoryBitMask = objectsGroup
        
        limitLand.zPosition = 3
        
        
        //self.addChild(limitLand)
        self.movingGroup.addChild(limitLand)
    }
    
    
    //MARK: - UTILS - FASE 2 -> CREACION DEL BACKGROUND
    func makeBackground(){
        
        let backgroundFinal = SKTexture (imageNamed: "bg.png")
        
        //en vez 900 deberiamos colocar el ancho de la imagen
        let moveBackgroud = SKAction.moveByX(-backgroundFinal.size().width, y: 0, duration: 6)
        //remplazamos y reposicionamos el background lo reseteamos en 0 segundos
        let replaceBackground = SKAction.moveByX(backgroundFinal.size().width, y: 0, duration: 0)
        
        let moveBackgroundForever = SKAction.repeatActionForever(SKAction.sequence([moveBackgroud, replaceBackground]))
        
        
        for var indice : CGFloat = 0; indice < 3; ++indice{
            
            background = SKSpriteNode(texture: backgroundFinal)
            background.position = CGPoint(x: (backgroundFinal.size().width / 2) + (backgroundFinal.size().width * indice), y: CGRectGetMidY(self.frame))
            background.zPosition = 1
            background.size.height = self.frame.height
            background.runAction(moveBackgroundForever)
            //self.addChild(background)
            self.movingGroup.addChild(background)
  
        }
    }
    
    //MARK: - UTILS - FASE 6 -> CREACION DE PIPES
    func makePipesFinal(){
        
        //1. Aqui asignamos a esta variable que sea tan alto como 4 pajaros.
        let gapHeight = bird.size.height * 6;
        
        //2. Aqui le decimos cuanto nos vamos a mover una vez que salga la tuberai tanto para arriba como ppara abajo. Quiero que me devuelva un numero entre 0 y la mitad de la pantalla
        let movementAmount = arc4random_uniform(UInt32(self.frame.size.height / 2))
        
        //3 Ahora el desplazamiento de las tuberias es precisamente el numero que hemos calculado entre 0 y la mitad de la pantalla.
        let pipeOffSet = CGFloat(movementAmount) - self.frame.size.height / 4
        
        //4 Mover las tuberias hacaia la izquierda.
        let movePipes = SKAction.moveByX(-self.frame.size.width, y: 0, duration: NSTimeInterval(8))
        let removePipes = SKAction.removeFromParent()
        
        //5. Para mover las uverias una vez que salgan de la pantall.
        let moveAndRemovePipes = SKAction.sequence([movePipes, removePipes])
        
        let pipeTexture1 = SKTexture(imageNamed: "pipe1.png")
        pipeFinal1 = SKSpriteNode(texture: pipeTexture1)
        pipeFinal1.position = CGPointMake(self.frame.size.width, CGRectGetMidY(self.frame) + (pipeFinal1.size.height/2) + (gapHeight/2) + pipeOffSet)
        pipeFinal1.zPosition = 5
        
        pipeFinal1.physicsBody = SKPhysicsBody(rectangleOfSize: pipeFinal1.size)
        pipeFinal1.physicsBody?.dynamic = false
        pipeFinal1.physicsBody?.categoryBitMask = objectsGroup
        pipeFinal1.runAction(moveAndRemovePipes)
        
        //self.addChild(pipeFinal1)
        self.movingGroup.addChild(pipeFinal1)
        
        let pipeTexture2 = SKTexture(imageNamed: "pipe2.png")
       
        pipeFinal2 = SKSpriteNode(texture: pipeTexture2)
        pipeFinal2.position = CGPointMake(self.frame.size.width, CGRectGetMidY(self.frame) - (pipeFinal2.size.height/2) - (gapHeight/2) + pipeOffSet)
        pipeFinal2.zPosition = 5
        
        pipeFinal2.physicsBody = SKPhysicsBody(rectangleOfSize: pipeFinal2.size)
        pipeFinal2.physicsBody?.dynamic = false
        pipeFinal2.physicsBody?.categoryBitMask = objectsGroup
        pipeFinal2.runAction(moveAndRemovePipes)
        
        //self.addChild(pipeFinal2)
        self.movingGroup.addChild(pipeFinal2)
        
        
        let gap = SKNode()
        
        gap.position = CGPointMake(self.frame.width, CGRectGetMidY(self.frame) + pipeOffSet)
        gap.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(pipeFinal1.size.width, gapHeight))
        gap.physicsBody?.dynamic = false
        gap.zPosition = 5
        gap.runAction(moveAndRemovePipes)
        gap.physicsBody?.categoryBitMask = gapGroup
        self.movingGroup.addChild(gap)
        
        
    }
    
    
    //MARK: - UTILS - FASE 1 -> CREACION DEL PAJARO
    func makeBird(){
        
        //Fase 1.1 -> Creamos las texturas del pajaro
        let birdTexture1 = SKTexture(imageNamed: "flappy1.png")
        let birdTexture2 = SKTexture(imageNamed: "flappy2.png")
        
        //Fase 1.2 ->
        //Un objeto del tipo SKACtion es una accion que se ejecuta para un nodo de la escena
        //esta accion va a tener un array de texturas, le pasamos la lista y el tiempo es 0.1 segundos
        let animationBird = SKAction.animateWithTextures([birdTexture1, birdTexture2], timePerFrame: 0.3)
        
        let makeBirdForever = SKAction.repeatActionForever(animationBird)
        
        //Fase 1.3 ->  le asignamos a nuestro pajaro la imagen que hemos traido como textura
        bird = SKSpriteNode(texture: birdTexture1)
        
        //fase 1.4 -> necesitamos darle una posicion a nuestro SpriteNode
        bird.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame))
        
        //le asignamos  la altura del spritenode en el eje z
        bird.zPosition = 10
        
        //Fase 1.5 -> Necesitamos ejecutar la accion
        bird.runAction(makeBirdForever)
        
        //MARK: - FASE 3 -> FISICAS DEL PAJARO
        //Aqui asignamos las caracteristicas fisicas del pajaro que envuelve nuestro Sprite
        //le asignamos un circulo que lo envolvera segun su diametro
        //le llamamos "GIZMOS"
        bird.physicsBody = SKPhysicsBody(circleOfRadius: bird.size.width / 3)
        
        //Fase 3.1 -> implementamos la gravedad -9.8 m/s es decir que se nos va para abajo
        bird.physicsBody?.dynamic = true
        
        //Descativamos la rotacion que envuelve el pajaro, este valor es Booleano y se vera afectada las fuerzas angulares e impulsos que aplican
        bird.physicsBody?.allowsRotation = true
        
        bird.physicsBody?.categoryBitMask = birdGroup
        bird.physicsBody?.collisionBitMask = objectsGroup
        bird.physicsBody?.contactTestBitMask = objectsGroup | gapGroup

        //Fase 1.6 -> Aqui lo añadimos a nuestra escena
        self.addChild(bird)
        
    }
    
    func makeLabel(){
        
        scoreLabel.fontName = "Helvetica"
        scoreLabel.fontSize = 30
        scoreLabel.text = "0"
        scoreLabel.position = CGPointMake(CGRectGetMidX(self.frame), self.frame.height-70)
        scoreLabel.zPosition = 15
        self.addChild(scoreLabel)
        
    }
    
    func makeLableGameOverFinal(titleLabel : String){
        let gameOverTexture = SKTexture(imageNamed: "game_over.png")
        gameOverLabel = SKSpriteNode(texture: gameOverTexture)
        
        gameOverLabel.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))
        gameOverLabel.zPosition = 16
        self.addChild(gameOverLabel)
        
    }
    
    func makeLoopPie1AndPipe2(){
        
        timer = NSTimer.scheduledTimerWithTimeInterval(4,
            target: self,
            selector: "makePipesFinal",
            userInfo: nil,
            repeats: true)
        
    }
    
    func resetGame(resetScore : Int, resetScoreLabel : String, resetPosition : CGPoint, resetVelocity : CGVector, resetSpeedOfGame : CGFloat){
        score = resetScore
        scoreLabel.text = resetScoreLabel
        
        // Elimino todos los elementos del grupo movingObjects y posteriormente lo creamos todo.
        movingGroup.removeAllChildren()
        gameOverLabel.removeFromParent()
        
        makelimitLand()
        makeLimitSky()
        makeBackground()
        makeLoopPie1AndPipe2()
        makeLoopRotateBird()
        
        bird.position = resetPosition
        bird.physicsBody?.velocity = resetVelocity
        bird.zRotation = 0
        gameOver = false
        
        movingGroup.speed = resetSpeedOfGame
        
    }
    
    func makeLoopRotateBird(){
        timerRotateBird = NSTimer.scheduledTimerWithTimeInterval(0.05,
            target: self,
            selector: "rotateBird",
            userInfo: nil,
            repeats: true)
    }
    func rotateBird(){
        bird.zRotation = bird.zRotation - 0.1;
    }
    
    func makeCoin(){
        

    }
    
}








































