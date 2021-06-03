import SpriteKit
import PlaygroundSupport


public class TheWizardKing{
    public init(){
        setUpLiveView()
        
        let wizardKing = Graphic(image: #imageLiteral(resourceName: "kingInThrone.png"))
        let acceptButton = Graphic(image: #imageLiteral(resourceName: "nextButton.png"))
        scene.backgroundColor = #colorLiteral(red: 0.058814115822315216, green: 0.05882953852415085, blue: 0.05881073325872421, alpha: 1.0)
        wizardKing.scale = 0.2
        
        scene.place(wizardKing, at: Point(x: 0, y: 400))
        acceptButton.scale = 0.7
        scene.place(acceptButton, at: Point(x: 0, y: -350))
        
        let duration:Double = 37
        let yEixo = SKAction.move(to: CGPoint(x: 0, y: 500), duration: duration)
        let zoom = SKAction.scale(to: 1.2, duration: duration)
        
        wizardKing.run(yEixo)
        wizardKing.run(zoom)
        
        runWrite(writes: IntroWizardKing)
        
        acceptButton.fadeOut(after: 0)
        delay(of: 35){
            acceptButton.fadeIn(after: 1)
        }
        acceptButton.setHandler(for: .touch) { _ in
            PlaygroundPage.current.navigateTo(page: .next)
        }
    }
}
