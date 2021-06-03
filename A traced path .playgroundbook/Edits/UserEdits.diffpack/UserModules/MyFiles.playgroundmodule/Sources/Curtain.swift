
import SpriteKit

public class Curtain {
    //let screen = Graphic(image:  #imageLiteral(resourceName: "screen.png"))
    let topCurtain1 = Graphic(image: #imageLiteral(resourceName: "curtain.png") )
    let topCurtain2 = Graphic(image:  #imageLiteral(resourceName: "curtain.png"))
    let topCurtainShadow = Graphic(image:  #imageLiteral(resourceName: "curtainShadow.png"))
    let topCurtainBody = Graphic.rectangle(width: 1500, height: 1500, cornerRadius: 0, color: .black)
    let bottomCurtain1 = Graphic(image:  #imageLiteral(resourceName: "curtain.png"))
    let bottomCurtain2 = Graphic(image: #imageLiteral(resourceName: "curtain.png"))
    let bottomCurtainShadow = Graphic(image:  #imageLiteral(resourceName: "curtainShadow.png"))
    let bottomCurtainBody = Graphic.rectangle(width: 1500, height: 1500, cornerRadius: 0, color: .black)
    let leftScreenBody = Graphic.rectangle(width: 200, height: 1000, cornerRadius: 0, color: .black)
    let rightScreenBody = Graphic.rectangle(width: 200, height: 1000, cornerRadius: 0, color: .black)
    
    let zig:SKAction
    let zag:SKAction
    let superZag:SKAction
    let zigzag1:SKAction
    let zigzag2:SKAction
    let zigzig:SKAction
    let infiniteZigZagmode1:SKAction
    let infiniteZigZagmode2:SKAction
    let infiniteZigZig:SKAction
    
    //first position animation settings
    let topCurtainBodyFirstPosition:SKAction
    let topCurtain1FirstPosition:SKAction
    let topCurtain2FirstPosition:SKAction
    let topCurtainShadowFirstPosition:SKAction
    let bottomCurtainBodyFirstPosition:SKAction
    let bottomCurtain1FirstPosition:SKAction
    let bottomCurtain2FirstPosition:SKAction
    let bottomCurtainShadowFirstPosition:SKAction
    
    // fast close animation settings
    let topFastClose:SKAction
    let bottomFastClose:SKAction
    
    let yFisrtVariation:CGFloat = 180
    let variationsDuration = 0.5
    
    public init() {
        //Setup horizontal animation info
        let curtainXMoviBy:CGFloat = 300
        self.zig  = SKAction.moveBy(x: curtainXMoviBy, y: 0, duration: 0.05)
        self.zag = SKAction.moveBy(x: -curtainXMoviBy, y: 0, duration: 0.05)
        self.superZag = SKAction.moveBy(x: -(curtainXMoviBy*4), y: 0, duration: 0.3)
        self.zigzag1 = SKAction.sequence([zig, zag])
        self.zigzag2 = SKAction.sequence([zag,zag,zig,zig])
        self.zigzig = SKAction.sequence([zig,zig,zig,zig,superZag])
        self.infiniteZigZagmode1 = SKAction.repeatForever(zigzag1)
        self.infiniteZigZagmode2 = SKAction.repeatForever(zigzag2)
        self.infiniteZigZig = SKAction.repeatForever(zigzig)
        
        let horizontalScreenXPoint = 550
        //first position animation settings
        self.topCurtainBodyFirstPosition = SKAction.move(to: CGPoint(x: 0, y: 1150), duration: 0.1)
        self.topCurtain1FirstPosition = SKAction.move(to: CGPoint(x: 0, y: 320), duration: 0.1)
        self.topCurtain2FirstPosition = SKAction.move(to: CGPoint(x: 160, y: 320), duration: 0.1)
        self.topCurtainShadowFirstPosition = SKAction.move(to: CGPoint(x: 0, y: 250), duration: 0.1)
        self.bottomCurtainBodyFirstPosition = SKAction.move(to: CGPoint(x: 0, y: -1150), duration: 0.1)
        self.bottomCurtain1FirstPosition = SKAction.move(to: CGPoint(x: 0, y: -320), duration: 0.1)
        self.bottomCurtain2FirstPosition = SKAction.move(to: CGPoint(x: 160, y: -320), duration: 0.1)
        self.bottomCurtainShadowFirstPosition = SKAction.move(to: CGPoint(x: 0, y: -250), duration: 0.1)
        
        // fast close animation settings
        let yFastClose:CGFloat = 260
        self.topFastClose = SKAction.moveBy(x: 0, y: -yFastClose, duration: 0.2)
        self.bottomFastClose = SKAction.moveBy(x: 0, y: yFastClose, duration: 0.2)
        
        //Setup constants and variables
        bottomCurtain1.rotation = 180
        bottomCurtain2.rotation = 180
        bottomCurtainShadow.rotation = 180
        
        
        //Setup horizontal animations
        topCurtain1.run(infiniteZigZagmode1)
        topCurtain2.run(infiniteZigZagmode2)
        topCurtainShadow.run(infiniteZigZig)
        bottomCurtain1.run(infiniteZigZagmode1)
        bottomCurtain2.run(infiniteZigZagmode2)
        bottomCurtainShadow.run(infiniteZigZig)
        
        
        //Setup in view position
        scene.place(topCurtainBody, at: Point(x: 0, y: 1150))
        scene.place(topCurtain1, at: Point(x: 0, y: 320))
        scene.place(topCurtain2, at: Point(x: 160, y: 320))
        scene.place(topCurtainShadow, at: Point(x: 0, y: 250))
        
        scene.place(bottomCurtainBody, at: Point(x: 0, y: -1150))
        scene.place(bottomCurtain1, at: Point(x: 0, y: -320))
        scene.place(bottomCurtain2, at: Point(x: 160, y: -320))
        scene.place(bottomCurtainShadow, at: Point(x: 0, y: -250))
        
        //screen.scale = 0.35
        //scene.place(screen, at: Point.zero)
        
        scene.place(leftScreenBody, at: Point(x: horizontalScreenXPoint, y: 0))
        scene.place(rightScreenBody, at: Point(x: -horizontalScreenXPoint, y: 0))
    }
    
    public func curtainFirstPosition(){
        //First variation
        topCurtainBody.run(SKAction.sequence([topFastClose,SKAction.move(to: CGPoint(x: 0, y: 1150), duration: variationsDuration)]))
        topCurtain1.run(SKAction.sequence([topFastClose,SKAction.move(to: CGPoint(x: 0, y: 320), duration: variationsDuration)]))
        topCurtain2.run(SKAction.sequence([topFastClose,SKAction.move(to: CGPoint(x: 160, y: 320), duration: variationsDuration)]))
        topCurtainShadow.run(SKAction.sequence([topFastClose,SKAction.move(to: CGPoint(x: 0, y: 250), duration: variationsDuration)]))
        bottomCurtainBody.run(SKAction.sequence([bottomFastClose,SKAction.move(to: CGPoint(x: 0, y: -1150), duration: variationsDuration)]))
        bottomCurtain1.run(SKAction.sequence([bottomFastClose,SKAction.move(to: CGPoint(x: 0, y: -320), duration: variationsDuration)]))
        bottomCurtain2.run(SKAction.sequence([bottomFastClose,SKAction.move(to: CGPoint(x: 160, y: -320), duration: variationsDuration)]))
        bottomCurtainShadow.run(SKAction.sequence([bottomFastClose,SKAction.move(to: CGPoint(x: 0, y: -250), duration: variationsDuration)]))
    }
    
    public func curtainSecondPosition(){
        //second variation
        let topSecondPosition = SKAction.moveBy(x: 0, y: yFisrtVariation, duration: variationsDuration)
        let bottomSecondPosition = SKAction.moveBy(x: 0, y: -yFisrtVariation, duration: variationsDuration)
        
        //top setup
        topCurtainBody.run(SKAction.sequence([topCurtainBodyFirstPosition,topFastClose,topSecondPosition]))
        topCurtain1.run(SKAction.sequence([topCurtain1FirstPosition,topFastClose,topSecondPosition]))
        topCurtain2.run(SKAction.sequence([topCurtain2FirstPosition,topFastClose,topSecondPosition]))
        topCurtainShadow.run(SKAction.sequence([topCurtainShadowFirstPosition,topFastClose,topSecondPosition]))
        //bottom setup
        bottomCurtainBody.run(SKAction.sequence([bottomCurtainBodyFirstPosition,bottomFastClose,bottomSecondPosition]))
        bottomCurtain1.run(SKAction.sequence([bottomCurtain1FirstPosition,bottomFastClose,bottomSecondPosition]))
        bottomCurtain2.run(SKAction.sequence([bottomCurtain2FirstPosition,bottomFastClose,bottomSecondPosition]))
        bottomCurtainShadow.run(SKAction.sequence([bottomCurtainShadowFirstPosition,bottomFastClose,bottomSecondPosition]))
        
    }
    
    public func curtainThirdPosition(){
        //third variation
        let differenceVariation:CGFloat = 70 
        let topThirdPosition = SKAction.moveBy(x: 0, y: yFisrtVariation-differenceVariation, duration: variationsDuration)
        let bottomThirdPosition = SKAction.moveBy(x: 0, y: -(yFisrtVariation+differenceVariation), duration: variationsDuration)
        
        //top setup
        topCurtainBody.run(SKAction.sequence([topCurtainBodyFirstPosition,topFastClose,topThirdPosition]))
        topCurtain1.run(SKAction.sequence([topCurtain1FirstPosition,topFastClose,topThirdPosition]))
        topCurtain2.run(SKAction.sequence([topCurtain2FirstPosition,topFastClose,topThirdPosition]))
        topCurtainShadow.run(SKAction.sequence([topCurtainShadowFirstPosition,topFastClose,topThirdPosition]))
        //bottom setup
        bottomCurtainBody.run(SKAction.sequence([bottomCurtainBodyFirstPosition,bottomFastClose,bottomThirdPosition]))
        bottomCurtain1.run(SKAction.sequence([bottomCurtain1FirstPosition,bottomFastClose,bottomThirdPosition]))
        bottomCurtain2.run(SKAction.sequence([bottomCurtain2FirstPosition,bottomFastClose,bottomThirdPosition]))
        bottomCurtainShadow.run(SKAction.sequence([bottomCurtainShadowFirstPosition,bottomFastClose,bottomThirdPosition]))
        
    }
    
    public func curtainFourthPosition(){
        //fourth variation
        let differenceVariation:CGFloat = 70 
        let topFourthPosition = SKAction.moveBy(x: 0, y: yFisrtVariation+differenceVariation, duration: variationsDuration)
        let bottomFourthPosition = SKAction.moveBy(x: 0, y: -(yFisrtVariation-differenceVariation), duration: variationsDuration)
        
        //top setup
        topCurtainBody.run(SKAction.sequence([topCurtainBodyFirstPosition,topFastClose,topFourthPosition]))
        topCurtain1.run(SKAction.sequence([topCurtain1FirstPosition,topFastClose,topFourthPosition]))
        topCurtain2.run(SKAction.sequence([topCurtain2FirstPosition,topFastClose,topFourthPosition]))
        topCurtainShadow.run(SKAction.sequence([topCurtainShadowFirstPosition,topFastClose,topFourthPosition]))
        //bottom setup
        bottomCurtainBody.run(SKAction.sequence([bottomCurtainBodyFirstPosition,bottomFastClose,bottomFourthPosition]))
        bottomCurtain1.run(SKAction.sequence([bottomCurtain1FirstPosition,bottomFastClose,bottomFourthPosition]))
        bottomCurtain2.run(SKAction.sequence([bottomCurtain2FirstPosition,bottomFastClose,bottomFourthPosition]))
        bottomCurtainShadow.run(SKAction.sequence([bottomCurtainShadowFirstPosition,bottomFastClose,bottomFourthPosition]))
    }
    
    public func curtainPosition(to position:VerticalPosition){
        //third variation
        //let differenceVariation:CGFloat = 70 
        let topThirdPosition = SKAction.moveBy(x: 0, y: yFisrtVariation+position.top, duration: variationsDuration)
        let bottomThirdPosition = SKAction.moveBy(x: 0, y: -(yFisrtVariation+position.bottom), duration: variationsDuration)
        
        //top setup
        topCurtainBody.run(SKAction.sequence([topCurtainBodyFirstPosition,topFastClose,topThirdPosition]))
        topCurtain1.run(SKAction.sequence([topCurtain1FirstPosition,topFastClose,topThirdPosition]))
        topCurtain2.run(SKAction.sequence([topCurtain2FirstPosition,topFastClose,topThirdPosition]))
        topCurtainShadow.run(SKAction.sequence([topCurtainShadowFirstPosition,topFastClose,topThirdPosition]))
        //bottom setup
        bottomCurtainBody.run(SKAction.sequence([bottomCurtainBodyFirstPosition,bottomFastClose,bottomThirdPosition]))
        bottomCurtain1.run(SKAction.sequence([bottomCurtain1FirstPosition,bottomFastClose,bottomThirdPosition]))
        bottomCurtain2.run(SKAction.sequence([bottomCurtain2FirstPosition,bottomFastClose,bottomThirdPosition]))
        bottomCurtainShadow.run(SKAction.sequence([bottomCurtainShadowFirstPosition,bottomFastClose,bottomThirdPosition]))
    }
}
