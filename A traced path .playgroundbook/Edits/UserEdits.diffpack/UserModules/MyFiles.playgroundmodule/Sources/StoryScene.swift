import SpriteKit

public enum SceneType{
    case slice
    case slide
}

public enum Rest{
    case mentor
    case group
    case meditation
    case other
}

public class SceneSlice {
    public let screen:Graphic
    public let xMoveBy:CGFloat
    public let yMoveBy:CGFloat
    public let time:Double
    
    public init(screen:Graphic,moveBy:Point = Point.zero, in time:Double){
        self.screen = screen
        self.xMoveBy = CGFloat(moveBy.x)
        self.yMoveBy = CGFloat(moveBy.y)
        self.time = time
    }
}
public class StoryScene {
    let slices:[SceneSlice]
    public let curtainPosition:VerticalPosition
    public let position:Point
    public let duration:Double
    public let sceneScale:Double
    public let sceneType:SceneType
    public let transitionDelay:Bool
    public let theLast:Bool
    public let restType:Rest
    
    
    public init(slices:[SceneSlice],
                of type:SceneType = .slice,
                in curtainPosition:VerticalPosition,
                position:Point = Point.zero,
                sceneDuration:Double = 3,
                scale:Double = 1,
                transitionDelay:Bool = false,
                theLast:Bool = false,
                restType:Rest = .other) {
        
        self.sceneType = type
        self.slices = slices
        self.curtainPosition = curtainPosition
        self.duration = sceneDuration
        self.position = position
        self.sceneScale = scale
        self.transitionDelay = transitionDelay
        self.theLast = theLast
        self.restType = restType
    }
    
    public func initialize(){
        for slice in self.slices{
            slice.screen.scale = sceneScale
            scene.place(slice.screen, at: self.position)
        }
    }
    public func playStory(){
        switch self.sceneType {
        case .slice:
            for slice in self.slices{
                slice.screen.run(sceneMove(xMoveBy: slice.xMoveBy, yMoveBy: slice.yMoveBy, time: slice.time))
            }
        case .slide:
            var after = 0.1
            if transitionDelay{
                after = 1
            }
            
            var minus = 1
            let sizeOfIt = 0...slices.count-minus
            var count = 0
            
            for index in  sizeOfIt{
                self.slices[index].screen.run(sceneMove(xMoveBy: self.slices[index].xMoveBy, yMoveBy: self.slices[index].yMoveBy,time: self.slices[index].time))
                
                if theLast{
                    delay(of: self.slices[1].time){ [self] in
                        self.slices[1].screen.run(SKAction.fadeAlpha(to: 0.0, duration: after))
                    }
                }else{
                    delay(of: self.slices[index].time){ [self] in
                        self.slices[index].screen.run(SKAction.fadeAlpha(to: 0.0, duration: after))
                    }
                }
                
            }
        }
        
        
    }
    
    public func curtainPreview(){
        let cutain = Curtain()
        self.playStory()
        cutain.curtainPosition(to: curtainPosition)
    }
    
    public func endStory(){
        if !self.theLast{
            for slice in self.slices{
                delay(of: 0.3){
                    slice.screen.fadeOut(after: 0)
                }
            }
        }
            
    }
    
    func sceneMove (xMoveBy: CGFloat, yMoveBy: CGFloat = 0, time: Double) -> SKAction {
        let move = SKAction.moveBy(x: xMoveBy, y: yMoveBy, duration: time)
        return move
    }
}

public enum Cinematics{
    case intro
    case purplenight
    case sunsetMermaid
    case ghostVillage
    case darkSwap
    case desertVampire
    case livingArmor
    case groupRest
    case mentorRest
    case bossMeeting
    case bossBattlePT1
    case bossBattleGroupMode
    case bossBattleMentorMode
    case bossBattleMeditationMode
    case meditationRest
    case crowDestruction
}

public func Cinematic(_ cinematic:Cinematics)-> StoryScene {
    switch cinematic{
    case .intro:
        return  StoryScene(slices: [
            SceneSlice(screen: Graphic(image:  #imageLiteral(resourceName: "heroIntro.png")), moveBy: Point(x: -150, y: 0), in: 9),
        ], in: VerticalPosition(top: 30, bottom: 30))
    case .purplenight:
        return  StoryScene(slices: [
            SceneSlice(screen: Graphic(image:  #imageLiteral(resourceName: "PurpleNight1.png")), moveBy: Point(x: 150, y: 0), in: 9),
            SceneSlice(screen: Graphic(image:  #imageLiteral(resourceName: "PurpleNight2.png")), moveBy: Point(x: 100, y: 0), in: 13),
            SceneSlice(screen: Graphic(image:  #imageLiteral(resourceName: "PurpleNight3.png")), moveBy: Point(x: 100, y: 0), in: 21),
            SceneSlice(screen: Graphic(image:  #imageLiteral(resourceName: "PurpleNight4Hero.png")), moveBy: Point(x: -100, y: 0), in: 28),
            SceneSlice(screen: Graphic(image:  #imageLiteral(resourceName: "PurpleNight5.png")), moveBy: Point(x: -100, y: 0), in: 30)
        ], in: VerticalPosition(top: 70, bottom: 70))
    case .sunsetMermaid:
        return StoryScene(slices: [
            SceneSlice(screen: Graphic(image:  #imageLiteral(resourceName: "SunsetMermaid1.png")), moveBy: Point(x: 100, y: -100), in: 9),
            SceneSlice(screen: Graphic(image:  #imageLiteral(resourceName: "SunsetMermaid2Hero.png")), moveBy: Point(x: 100, y: -100), in: 13),
            SceneSlice(screen: Graphic(image:  #imageLiteral(resourceName: "SunsetMermaid3.png")), moveBy: Point(x: 100, y: -100), in: 21),
            SceneSlice(screen: Graphic(image:  #imageLiteral(resourceName: "SunsetMermaid4.png")), moveBy: Point(x: -100, y: -100), in: 28),
            SceneSlice(screen: Graphic(image:  #imageLiteral(resourceName: "SunsetMermaid5.png")), moveBy: Point(x: -100, y: -100), in: 30)
        ], in: VerticalPosition(top: 30, bottom: 50), position: Point(x: 0, y: -40))
    case .ghostVillage:
        return StoryScene(slices: [
            SceneSlice(screen: Graphic(image:  #imageLiteral(resourceName: "GhostVillage1.png")), moveBy: Point(x: -100, y: 0), in: 9),
            SceneSlice(screen: Graphic(image:  #imageLiteral(resourceName: "GhostVillage2.png")), moveBy: Point(x: -100, y: 0), in: 13),
            SceneSlice(screen: Graphic(image:  #imageLiteral(resourceName: "GhostVillage3Hero.png")), moveBy: Point(x: 100, y: 0), in: 21),
            SceneSlice(screen: Graphic(image:  #imageLiteral(resourceName: "GhostVillage4.png")), moveBy: Point(x: -100, y: 0), in: 28),
            SceneSlice(screen: Graphic(image:  #imageLiteral(resourceName: "GhostVillage5.png")), moveBy: Point(x: 100, y: 0), in: 5)
        ], in: VerticalPosition(top: 20, bottom: 50))
    case .darkSwap:
        return StoryScene(slices: [
            SceneSlice(screen: Graphic(image:  #imageLiteral(resourceName: "DarkSwamp1.png")), moveBy: Point(x: -100, y: 0), in: 5),
            SceneSlice(screen: Graphic(image:  #imageLiteral(resourceName: "DarkSwamp2.png")), moveBy: Point(x: -100, y: 0), in: 15),
            SceneSlice(screen: Graphic(image:  #imageLiteral(resourceName: "DarkSwamp3.png")), moveBy: Point(x: -100, y: 0), in: 21),
            SceneSlice(screen: Graphic(image:  #imageLiteral(resourceName: "DarkSwamp4.png")), moveBy: Point(x: -100, y: 0), in: 28),
            SceneSlice(screen: Graphic(image:  #imageLiteral(resourceName: "DarkSwamp5Hero.png")), moveBy: Point(x: 150, y: 0), in: 5)
        ], in: VerticalPosition(top: 30, bottom: 50))
    case .desertVampire:
        return StoryScene(slices: [
            SceneSlice(screen: Graphic(image:  #imageLiteral(resourceName: "Desertvampire1.png")), moveBy: Point(x: -100, y: 0), in: 5),
            SceneSlice(screen: Graphic(image:  #imageLiteral(resourceName: "Desertvampire2.png")), moveBy: Point(x: -100, y: 0), in: 15),
            SceneSlice(screen: Graphic(image:  #imageLiteral(resourceName: "Desertvampire3.png")), moveBy: Point(x: -100, y: 0), in: 21),
            SceneSlice(screen: Graphic(image:  #imageLiteral(resourceName: "Desertvampire4.png")), moveBy: Point(x: -100, y: 0), in: 28),
            SceneSlice(screen: Graphic(image:  #imageLiteral(resourceName: "Desertvampire5Hero.png")), moveBy: Point(x: 150, y: 0), in: 5)
        ], in: VerticalPosition(top: 75, bottom: 20))
    case .livingArmor:
        return StoryScene(slices: [
            SceneSlice(screen: Graphic(image:  #imageLiteral(resourceName: "LivingArmor1.png")), moveBy: Point(x: 100, y: 0), in: 30),
            SceneSlice(screen: Graphic(image:  #imageLiteral(resourceName: "LivingArmor2.png")), moveBy: Point(x: -100, y: 0), in: 15),
            SceneSlice(screen: Graphic(image:  #imageLiteral(resourceName: "LivingArmor3.png")), moveBy: Point(x: -100, y: 0), in: 9),
            SceneSlice(screen: Graphic(image:  #imageLiteral(resourceName: "LivingArmor4Hero.png")), moveBy: Point(x: 200, y: 0), in: 35),
            SceneSlice(screen: Graphic(image:  #imageLiteral(resourceName: "LivingArmor5.png")), moveBy: Point(x: 250, y: 0), in: 10)
        ], in: VerticalPosition(top: 70, bottom: 60), position: Point(x: 0, y: -40))
    case .groupRest:
        return StoryScene(slices: [
            SceneSlice(screen: Graphic(image:  #imageLiteral(resourceName: "GroupDespedida.png")), 
                       moveBy: Point(x: 100, y: 0),
                       in: 10),
            SceneSlice(screen: Graphic(image:  #imageLiteral(resourceName: "GroupHand.png")),
                       moveBy: Point(x: -50, y: 0),
                       in: 5),
            SceneSlice(screen: Graphic(image:  #imageLiteral(resourceName: "GroupExperience.png")),
                       moveBy: Point(x: 50, y: 0),
                       in: 3),
        ],of: .slide, in: VerticalPosition(top: 80, bottom: 70),sceneDuration:8, scale: 0.9, restType: .group)
    case .mentorRest:
        return StoryScene(slices: [
            SceneSlice(screen: Graphic(image:  #imageLiteral(resourceName: "MentorDespedida.png")), 
                       moveBy: Point(x: 80, y: 0),
                       in: 10),
            SceneSlice(screen: Graphic(image:  #imageLiteral(resourceName: "MentorHand.png")),
                       moveBy: Point(x: -50, y: 0),
                       in: 5),
            SceneSlice(screen: Graphic(image:  #imageLiteral(resourceName: "Mentor.png")),
                       moveBy: Point(x: 50, y: 0),
                       in: 3),
        ],of: .slide, in: VerticalPosition(top: 80, bottom: 70),sceneDuration:8, scale: 0.9,restType: .mentor)
    case .meditationRest:
        return StoryScene(slices: [
            SceneSlice(screen: Graphic(image:  #imageLiteral(resourceName: "RestDespedida.png")), 
                       moveBy: Point(x: 100, y: 0),
                       in: 10),
            SceneSlice(screen: Graphic(image:  #imageLiteral(resourceName: "RestHand.png")),
                       moveBy: Point(x: -50, y: 0),
                       in: 5),
            SceneSlice(screen: Graphic(image:  #imageLiteral(resourceName: "RestingPlace.png")),
                       moveBy: Point(x: 50, y: 0),
                       in: 3),
        ],of: .slide, in: VerticalPosition(top: 80, bottom: 70),sceneDuration:8, scale: 0.9,restType: .meditation)
    case .bossMeeting:
        return StoryScene(slices: [
                                                    SceneSlice(screen: Graphic(image:  #imageLiteral(resourceName: "BossPt1.png")), moveBy: Point(x: 0, y: -200), in: 6)], in: VerticalPosition(top: -60, bottom: 120), sceneDuration:5
        )
    case .bossBattlePT1:
        return StoryScene(slices: [
            SceneSlice(screen: Graphic(image:  #imageLiteral(resourceName: "WizardKing1.png")), moveBy: Point(x: -100, y: 0), in: 30),
            SceneSlice(screen: Graphic(image:  #imageLiteral(resourceName: "WizardKing2Hero.png")), moveBy: Point(x: 100, y: 0), in: 15),
            SceneSlice(screen: Graphic(image:  #imageLiteral(resourceName: "WizardKing3.png")), moveBy: Point(x: 100, y: 0), in: 20)
        ], in: VerticalPosition(top: 90, bottom: 90), sceneDuration:4,scale: 0.9)
    case .bossBattleGroupMode:
        return StoryScene(slices: [
            SceneSlice(screen: Graphic(image:  #imageLiteral(resourceName: "KingGroupBattle1.png")), moveBy: Point(x: -300, y: 0), in: 30),
            SceneSlice(screen: Graphic(image:  #imageLiteral(resourceName: "KingBattle2.png")), moveBy: Point(x: 100, y: 0), in: 15),
            SceneSlice(screen: Graphic(image:  #imageLiteral(resourceName: "KingBattle3.png")), moveBy: Point(x: 200, y: 0), in: 20)
        ], in: VerticalPosition(top: 90, bottom: 90), sceneDuration:7,scale: 0.9)
    case .bossBattleMentorMode:
        return StoryScene(slices: [
            SceneSlice(screen: Graphic(image:  #imageLiteral(resourceName: "KingMentorBattle1.png")), moveBy: Point(x: -300, y: 0), in: 30),
            SceneSlice(screen: Graphic(image:  #imageLiteral(resourceName: "KingBattle2.png")), moveBy: Point(x: 100, y: 0), in: 15),
            SceneSlice(screen: Graphic(image:  #imageLiteral(resourceName: "KingBattle3.png")), moveBy: Point(x: 200, y: 0), in: 20)
        ], in: VerticalPosition(top: 90, bottom: 90), sceneDuration:7, scale: 0.9)
    case .bossBattleMeditationMode:
        return StoryScene(slices: [
            SceneSlice(screen: Graphic(image:  #imageLiteral(resourceName: "KingRestBattle1.png")), moveBy: Point(x: -300, y: 0), in: 30),
            SceneSlice(screen: Graphic(image:  #imageLiteral(resourceName: "KingBattle2.png")), moveBy: Point(x: 100, y: 0), in: 15),
            SceneSlice(screen: Graphic(image:  #imageLiteral(resourceName: "KingBattle3.png")), moveBy: Point(x: 200, y: 0), in: 20)
        ], in: VerticalPosition(top: 90, bottom: 90), sceneDuration:7, scale: 0.9)
    case .crowDestruction:
        return StoryScene(slices: [
            SceneSlice(screen: Graphic(image:  #imageLiteral(resourceName: "Crown2.png")),
                       in: 7),
            SceneSlice(screen: Graphic(image:  #imageLiteral(resourceName: "Crown1.png")),
                       in: 4),
        ],of: .slide, in: VerticalPosition(top: 70, bottom: 70),sceneDuration:8, scale: 0.8, transitionDelay:true,theLast:true)
    }
}

public class VerticalPosition {
    let top:CGFloat
    let bottom:CGFloat
    public init(top:CGFloat,bottom:CGFloat){
        self.top = top
        self.bottom = bottom
    }
}
