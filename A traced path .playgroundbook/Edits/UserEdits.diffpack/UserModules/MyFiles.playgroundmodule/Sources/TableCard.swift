
import SpriteKit

public enum CardCategory {
    case hero
    case challenge
    case rest
}

public enum HideType {
    case run
    case fade
}

public class TableCard {
    let cardScale:CGFloat = 0.4
    public let card:Graphic
    public let chapter:Chapter
    public let infoSheet:InfoSheet
    public var presentation:Bool
    public var category:CardCategory
    public var chapterName:String
    public var selected = false
    
    public var storyPointName = "none"
    
    public init(chapter:Chapter) {
        self.chapter = chapter
        self.card = chapter.card
        self.infoSheet = InfoSheet(chapter: chapter)
        self.presentation = false
        self.category = chapter.category
        self.chapterName = chapter.name
    }
    
    public func placeCard(){
        card.scale = Double(cardScale)
        scene.place(card, at: Point(x: -2000, y: 0))
    }
    
    public func onTouch(action: @escaping ()->Void){
        self.card.setHandler(for: .touch) { [self] _ in
            if !presentation{
                self.presentMode()
                presentation = true
            }else{
                self.tablePosition()
                presentation = false
            }
            action()
        }
    }
    
    public func tablePosition(duration:Double=0.3){
        card.fadeIn(after: 0.5)
        card.run(SKAction.scale(to: cardScale, duration: duration))
        card.run(SKAction.move(to: chapter.cardPosition.CGPointForm(), duration: duration))
        self.infoSheet.hideMode()
    }
    
    public func hideMode(duration:Double = 0.3, type:HideType = .run){
        switch type {
        case .run:
            card.run(SKAction.move(to: CGPoint(x: -2000, y: 0), duration: duration))
        case .fade:
            card.fadeOut(after: duration)
        //card.run(SKAction.move(to: CGPoint(x: -2000, y: 0), duration: duration+2))
        }
        
        self.infoSheet.hideMode(duration: duration)
    }
    
    public func presentMode(){
        card.fadeIn(after: 0)
        let cardExpansion = SKAction.scale(to: 0.6, duration: 0.3)
        let cardPosition = SKAction.move(to: CGPoint(x: -190, y: 0), duration: 0.3)
        card.run(cardPosition)
        card.run(cardExpansion)
        self.infoSheet.presentMode()
    }
    
    public func runAnimation(_ animation:SKAction){
        self.card.run(animation)
    }
}

extension TableCard {
    public static let allCards = [
        TableCard(chapter: Chapter.mentorChapter),
        TableCard(chapter: Chapter.groupChapter),
        TableCard(chapter: Chapter.RestChapter),
        TableCard(chapter: Chapter.PurpleNightChapter),
        TableCard(chapter: Chapter.SunsetMermaidChapter),
        TableCard(chapter: Chapter.GhostVillageChapter),
        TableCard(chapter: Chapter.DarkSwapChapter),
        TableCard(chapter: Chapter.DesertVampireChapter),
        TableCard(chapter: Chapter.LivingArmorChapter)
    ]
}
