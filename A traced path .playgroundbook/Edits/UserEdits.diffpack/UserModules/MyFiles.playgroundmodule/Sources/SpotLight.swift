import SpriteKit

public struct PathPositions {
    public static let first = CGPoint(x: -295, y: -170)
    public static let second = CGPoint(x: -174.5, y: -111)
    public static let third = CGPoint(x: -84.5, y: 57)
    public static let fourth = CGPoint(x: 1.5, y: -59)
    public static let fifth = CGPoint(x: 117.5, y: -115)
    public static let sixth = CGPoint(x: 163, y: 56.5)
    public static let seventh = CGPoint(x: 285, y: 170)
}

public extension CGPoint {
    func isInRadius(of point:CGPoint, on radius:Int = 10) -> Bool{
        let constant = 10
        let rad = CGFloat(constant*radius)
        let selfX = self.x
        let selfY = self.y
        let leadingX = point.x - rad 
        let traillingX = point.x + rad 
        let leadingY = point.y - rad 
        let traillingY = point.y + rad 
        if selfX > leadingX && selfX < traillingX && selfY > leadingY && selfY < traillingY {
            return true
        }else{
            return false
        }
    }
}

public class Spotlight {
    let spotlight = Graphic.rectangle(width: 79, height: 119, cornerRadius: 5, color: #colorLiteral(red: 1.0002920627593994, green: 0.9429516196250916, blue: 0.576911985874176, alpha: 1.0))
    let pulseUp:SKAction
    let pulseDown:SKAction
    let pulsate:SKAction
    
    public init() {
        
        self.pulseUp = SKAction.scale(to: 1.05, duration: 1)
        self.pulseDown = SKAction.scale(to: 1, duration: 1)
        let out = SKAction.fadeAlpha(to: 0, duration: 1)
        let on = SKAction.fadeAlpha(to: 1, duration: 10)
        self.pulsate = SKAction.repeatForever(SKAction.sequence([pulseUp, pulseDown]))
        
        spotlight.strokeWidth = 6
        spotlight.strokeColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        scene.place(spotlight, at: Point.zero)
        spotlight.fadeOut(after: 0.1)
        spotlight.run(pulsate)
    }
    
    public func goToPathPosition(_ pathPosition:CGPoint){
        let move = SKAction.move(to: pathPosition, duration: 0.3)
        spotlight.fadeIn(after: 0.3)
        spotlight.run(move)
    }
    
    public func firstPositon(){
        goToPathPosition(PathPositions.first)
    }
    public func secondPositon(){
        goToPathPosition(PathPositions.second)
    }
    public func thirdPositon(){
        goToPathPosition(PathPositions.third)
    }
    public func fourthPositon(){
        goToPathPosition(PathPositions.fourth)
    }
    public func fifthPositon(){
        goToPathPosition(PathPositions.fifth)
    }
    public func sixthPositon(){
        goToPathPosition(PathPositions.sixth)
    }
    
    public func comeOut(){
        spotlight.fadeOut(after: 1)
    }
}
