import SpriteKit

public class Chapter {
    public var card:Graphic
    public var sheet:Graphic
    public var cardPosition:Point
    public var category:CardCategory
    public var name:String
    public var cinematic:StoryScene
    
    init (card:Graphic,cardPosition:Point,sheet:Graphic,category:CardCategory,name:String,storyScene:StoryScene) {
        self.card = card 
        self.sheet = sheet
        self.cardPosition = cardPosition
        self.category = category
        self.name = name
        self.cinematic = storyScene
    }
}

extension Chapter {
    public static let mentorChapter = Chapter(card: Graphic(image:  #imageLiteral(resourceName: "MentorCard.png")), cardPosition: Point(x: -250, y: 0), sheet: Graphic(image:  #imageLiteral(resourceName: "MentorSheet.png")), category: .rest, name: "Mentor", storyScene: Cinematic(.mentorRest))
    
    public static let groupChapter =
    Chapter(card: Graphic(image:  #imageLiteral(resourceName: "GroupCard.png")), cardPosition: Point(x: 0, y: 0), sheet: Graphic(image:  #imageLiteral(resourceName: "GroupSheet.png")), category: .rest, name: "Group",storyScene: Cinematic(.groupRest))
    
    public static let RestChapter = Chapter(card: Graphic(image:  #imageLiteral(resourceName: "RestCard.png")), cardPosition: Point(x: 250, y: 0), sheet: Graphic(image:  #imageLiteral(resourceName: "RestSheet.png")), category: .rest, name: "Rest", storyScene: Cinematic(.meditationRest))
    
    public static let PurpleNightChapter = Chapter(card: Graphic(image:  #imageLiteral(resourceName: "PurpleNightCard.png")), cardPosition: Point(x: -240, y: 0), sheet: Graphic(image:  #imageLiteral(resourceName: "PurpleNightSheet.png")), category: .challenge, name: "PurpleNight", storyScene: Cinematic(.purplenight))
    
    public static let SunsetMermaidChapter = Chapter(card: Graphic(image:  #imageLiteral(resourceName: "SunsetMermaidCard.png")), cardPosition: Point(x: 10, y: 0), sheet: Graphic(image:  #imageLiteral(resourceName: "SunsetMermaidSheet.png")), category: .challenge, name: "SunsetMermaid", storyScene: Cinematic(.sunsetMermaid))
    
    public static let GhostVillageChapter = Chapter(card: Graphic(image:  #imageLiteral(resourceName: "GhostVillageCard.png")), cardPosition: Point(x: 260, y: 0), sheet: Graphic(image:  #imageLiteral(resourceName: "GhostVillageSheet.png")), category: .challenge, name: "GhostVillage", storyScene: Cinematic(.ghostVillage))
    
    public static let DarkSwapChapter = Chapter(card: Graphic(image:  #imageLiteral(resourceName: "DarSwapCard.png")), cardPosition: Point(x: -260, y: -100), sheet: Graphic(image:  #imageLiteral(resourceName: "DarkSwapSheet.png")), category: .challenge, name: "DarkSwap", storyScene: Cinematic(.darkSwap))
    
    public static let DesertVampireChapter = Chapter(card: Graphic(image:  #imageLiteral(resourceName: "DesertvampireCard.png")), cardPosition: Point(x: -10, y: -100), sheet: Graphic(image:  #imageLiteral(resourceName: "DesertVampireSheet.png")), category: .challenge, name: "DesertVampire", storyScene: Cinematic(.desertVampire))
    
    public static let LivingArmorChapter = Chapter(card: Graphic(image:  #imageLiteral(resourceName: "LivingarmorCard.png")), cardPosition: Point(x: 240, y: -100), sheet: Graphic(image:  #imageLiteral(resourceName: "LivingArmorSheet.png")), category: .challenge, name: "LivingArmor", storyScene: Cinematic(.livingArmor))
    
    public static let allChapters = [ mentorChapter,groupChapter,RestChapter, PurpleNightChapter,SunsetMermaidChapter, GhostVillageChapter,DarkSwapChapter,DesertVampireChapter,LivingArmorChapter
    ]
}

public extension CGPoint{
    func PointForm() -> Point {
        let x = self.x
        let y = self.y
        return Point(x: x, y: y)
    }
}

public extension Point{
    func CGPointForm() -> CGPoint {
        let x = self.x
        let y = self.y
        return CGPoint(x: x, y: y)
    }
}
