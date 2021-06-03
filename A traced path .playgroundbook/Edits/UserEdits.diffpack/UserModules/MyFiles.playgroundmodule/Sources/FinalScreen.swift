import SpriteKit
import PlaygroundSupport

public class FinalScreen{
    public init(){
        func putImage(image:Image)->Graphic{
            let image = Graphic(image: image)
            image.scale = 0.5
            scene.place(image)
            return image
        }
        let background = putImage(image: #imageLiteral(resourceName: "background.png"))
        let moon = putImage(image: #imageLiteral(resourceName: "moon.png"))
        let stars = putImage(image: #imageLiteral(resourceName: "stars.png"))
        let cloud1 = putImage(image: #imageLiteral(resourceName: "cloud1.png"))
        let cloud2 = putImage(image: #imageLiteral(resourceName: "cloud2.png"))
        let cloud3 = putImage(image: #imageLiteral(resourceName: "cloud3.png"))
        let champion = putImage(image: #imageLiteral(resourceName: "Campeão.png"))
        let rock1 = putImage(image: #imageLiteral(resourceName: "rock1.png"))
        let rock2 = putImage(image: #imageLiteral(resourceName: "rock2.png"))
        let rock3 = putImage(image: #imageLiteral(resourceName: "rock3.png"))
        let rock4 = putImage(image: #imageLiteral(resourceName: "rock4.png"))
        let rock5 = putImage(image: #imageLiteral(resourceName: "rock5.png"))
        let power1 = putImage(image: #imageLiteral(resourceName: "powerl1.png"))
        let power2 = putImage(image: #imageLiteral(resourceName: "powerl2.png"))
        
        //  let background = Graphic(image: T##Image)
        //  let background = Graphic(image: T##Image)
        background.scale = 0.5
        moon.scale = 0.5
        
        //foreverRotation
        let rotate = SKAction.rotate(byAngle: 1, duration: 6)
        let rotation = SKAction.repeatForever(rotate)
        
        //foreverHorizon
        let left = SKAction.move(by: CGVector(dx: -50, dy: 10), duration: 5)
        let right = SKAction.move(by: CGVector(dx: 50, dy: -10), duration: 5)
        let zigzag1 =  SKAction.sequence([left,right])
        let zigzag2 =  SKAction.sequence([right,left])
        let zigzag3 = SKAction.sequence([right,right,left,left])
        let horiontal1 = SKAction.repeatForever(zigzag1)
        let horiontal2 = SKAction.repeatForever(zigzag2)
        let horiontal3 = SKAction.repeatForever(zigzag3)
        
        //foreverZoom
        enum ZoomType{
            case left
            case right
        }
        
        func rockZoom(type: ZoomType) -> SKAction {
            
            let leftZoom1 = SKAction.move(by: CGVector(dx: -10, dy: 10), duration: 2)
            let rightZoom1 = SKAction.move(by: CGVector(dx: 10, dy: -10), duration: 2)
            
            let leftZoom2 = SKAction.move(by: CGVector(dx: 10, dy: 10), duration: 2)
            let rightZoom2 = SKAction.move(by: CGVector(dx: -10, dy: -10), duration: 2)
            
            switch type {
            case .left:
                let zoomSequence = SKAction.sequence([leftZoom1,rightZoom1])
                let zoom = SKAction.repeatForever(zoomSequence)
                return zoom
            case .right:
                let zoomSequence = SKAction.sequence([leftZoom2,rightZoom2])
                let zoom = SKAction.repeatForever(zoomSequence)
                return zoom
            }
        }
        
        //powerExplosion 
        let on = SKAction.fadeAlpha(to: 0.0, duration: 0.01)
        let of = SKAction.fadeAlpha(to: 1.0, duration: 0.01)
        let first = SKAction.sequence([on,of])
        let second = SKAction.sequence([of,on])
        
        let firstPower = SKAction.repeatForever(first)
        let secondPower = SKAction.repeatForever(second)
        
        moon.run(rotation)
        cloud1.run(horiontal1)
        cloud2.run(horiontal2)
        cloud3.run(horiontal3)
        rock1.run(rockZoom(type: .left))
        rock2.run(rockZoom(type: .right))
        rock3.run(rockZoom(type: .right))
        rock4.run(rockZoom(type: .left))
        rock5.run(rockZoom(type: .left))
        power1.run(firstPower)
        power2.run(secondPower)
        
        moon.position = CGPoint(x: -190, y: 200)
        rock1.position = CGPoint(x: -160, y: 20)
        rock2.position = CGPoint(x: 290, y: -40)
        rock3.position = CGPoint(x: 80, y: -50)
        rock4.position = CGPoint(x: -260, y: -80)
        rock5.position = CGPoint(x: -50, y: -60)
        power1.position = CGPoint(x: 20, y: 0)
        power2.position = CGPoint(x: 20, y: 0)
        
        
        let curtain = Curtain()
        curtain.curtainPosition(to: VerticalPosition(top: 60, bottom: 60))
        
        let victory = Label(text: "The journey was complete", color:  #colorLiteral(red: 0.9214347004890442, green: 0.9214347004890442, blue: 0.9214347004890442, alpha: 1.0), font: .Verdana, size: 25)
        scene.place(victory, at: Point(x: 0, y: -200))
        let tryOther = Label(text: "Try another paths", color:  #colorLiteral(red: 0.9214347004890442, green: 0.9214347004890442, blue: 0.9214347004890442, alpha: 1.0), font: .Verdana, size: 25)
        let finish = Label(text: "Finish", color:  #colorLiteral(red: 0.9214347004890442, green: 0.9214347004890442, blue: 0.9214347004890442, alpha: 1.0), font: .Verdana, size: 25)
        let arrowButton = putImage(image: #imageLiteral(resourceName: "arrowButton.png"))
        let finishButton = putImage(image: #imageLiteral(resourceName: "stopButton.png"))
        
        scene.place(victory, at: Point(x: 0, y: -200))
        scene.place(tryOther, at: Point(x: -200, y: -300))
        scene.place(finish, at: Point(x: 200, y: -300)) 
        arrowButton.position = CGPoint(x: -200, y: -350)
        finishButton.position = CGPoint(x: 200, y: -350)
        
        arrowButton.rotation = 180
        arrowButton.setHandler(for: .touch) { _ in
            PlaygroundPage.current.navigateTo(page: .pageReference(reference: "A path traced"))
        }
        
        finishButton.setHandler(for: .touch) { _ in
            PlaygroundPage.current.navigateTo(page: .next)
        }
    }
    
}


