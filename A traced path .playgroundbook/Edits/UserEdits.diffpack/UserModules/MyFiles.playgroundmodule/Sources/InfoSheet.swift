import SpriteKit

public class InfoSheet {
    
    let infoSheet:Graphic
    public var chooseButton:Graphic
    let chapter:Chapter
    let sheetModelPresentationPosition = CGPoint(x: 150, y: 0)
    let chooseButtonPresentationPosition = CGPoint(x: 150, y: -200)
    public let chapterName:String
    
    public init(chapter:Chapter) {
        self.chapter = chapter
        self.infoSheet = chapter.sheet
        self.chooseButton = Graphic(image: #imageLiteral(resourceName: "chooseButton.png"))
        self.chapterName = chapter.name
        
        infoSheet.scale = 0.7
        chooseButton.scale = 0.3
        
        scene.place(infoSheet, at: Point(x: 1000, y: -20))
        scene.place(chooseButton, at: Point(x: 1000, y: -20))
    }
    
    public func presentMode(){
        infoSheet.run(SKAction.move(to: sheetModelPresentationPosition, duration: 0.3))
        chooseButton.run(SKAction.move(to: chooseButtonPresentationPosition, duration: 0.3))
    }
    
    public func hideMode(duration:Double=0.3){
        infoSheet.run(SKAction.move(to: CGPoint(x: 1000, y: 0), duration: duration))
        chooseButton.run(SKAction.move(to: CGPoint(x: 1000, y: -200), duration: duration))
    }
    
    public func onTouch(action: @escaping ()->Void){
        self.chooseButton.setHandler(for: .touch) { [self] _ in
            action()
        }
    }
}
