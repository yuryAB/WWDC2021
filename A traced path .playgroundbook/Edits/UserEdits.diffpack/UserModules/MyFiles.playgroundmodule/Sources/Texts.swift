public class Write{
    public let text:String
    public let time:Double
    public let position:Point
    init(_ text:String, by time:Double, in position:Point = Point.zero){
        self.text = text
        self.time = time
        self.position = position
    }
}

public func runWrite(writes:[Write]){
    let writeText = Label(text: "", color:  #colorLiteral(red: 0.6859978437423706, green: 0.6819220185279846, blue: 0.6891321539878845, alpha: 1.0), font: .Verdana)
    
    writeText.fadeOut(after: 0)
    
    var timeAux:Double = 0
    for write in writes{
        scene.place(writeText,at: write.position)
        delay(of: timeAux){
            writeText.fadeIn(after: 1)
            writeText.text = write.text
        }
        var timeToOut:Double = 0.0
        
        if timeAux < 1 {
            timeToOut = write.time-1 
        }else{
            timeToOut = timeAux-1
        }
        
        delay(of: timeToOut){
            writeText.fadeOut(after: 1)
        }
        timeAux += write.time
    }
}
    

public let IntroWizardKing = [
    Write("Once upon a time\nThere was a magus who dedicated\n his life to the dream of being\nthe most powerful man\n that had already existed.", by: 13, in: Point(x: 0, y: -220)),
    Write("One day he became so powerful that was\n named the king of all Magus", by: 7, in: Point(x: 0, y: -220)),
    Write("However, after his crown\n his ambition took over his heart.\nThe powers that once\n were used to help people\nSlowly were used to subdue them\nAnd his reign became\n one time of horror.", by: 15, in: Point(x: 0, y: -220)),
    Write(" ", by: 7),
]

public let IntroMageHero = [
    Write("Two years have passed\nsince the reign of the Wizard king\nBut now there is a young magician\nwho got tired of living in oppression\n and left extremely motivated\n on a long journey to defeat the tyrant.", by: 15),
    Write("Your mission will be\nto trace the path that this\n young magician will follow\n and enjoy the adventure.", by: 12),
]

public let SignOfHope = [
    Write("\" On a certain night\n all of you will look at the sky\n and see a blue light\n coming out of the king's castle. \"", by: 15),
    Write("\" That light will represent my victory \"", by: 15),
    Write("\" And more than that \"", by: 15),
    Write("\" It is a sign of hope \"", by: 15),
    Write("\" That better days will come...\"", by: 12)
]
