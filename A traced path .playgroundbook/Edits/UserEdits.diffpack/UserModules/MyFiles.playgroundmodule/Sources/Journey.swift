import SpriteKit
import PlaygroundSupport

//public thePath = []
public class Journey {
    let storyScenes:[StoryScene]
    var storyDuration:Double = 5
    public init(storyScenes:[StoryScene]){
        self.storyScenes = storyScenes
    }
    public func playJourney(){
        var time:Double = 0
        
        for storyScene in storyScenes.reversed() {
            storyScene.initialize()
        }
        let curtain = Curtain()
        
        for storyScene in storyScenes {
                delay(of: time){
                    storyScene.playStory()
                    curtain.curtainPosition(to: storyScene.curtainPosition)
                }
                storyDuration = storyScene.duration
                delay(of: time+storyDuration){
                    if storyScene.theLast{
                        let nextButton = Graphic(image: #imageLiteral(resourceName: "arrowButton.png"))
                        nextButton.scale = 0.6
                        scene.place(nextButton,at:Point(x: 200, y: -300))
                        nextButton.setHandler(for: .touch) { _ in
                            PlaygroundPage.current.navigateTo(page: .next)
                        }
                    }
                    storyScene.endStory()
                }
                time += storyDuration
        }
    }
}
