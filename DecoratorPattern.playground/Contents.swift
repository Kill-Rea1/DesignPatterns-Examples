// MARK:- Porsche Protocol
protocol Porsche {
    func getPrice() -> Double
    func getDescription() -> String
}

// MARK:- Porsche Models
class Boxster: Porsche {
    func getPrice() -> Double {
        return 120
    }
    
    func getDescription() -> String {
        return "Porsche Boxster"
    }
}

class Panamera: Porsche {
    func getPrice() -> Double {
        return 150
    }
    
    func getDescription() -> String {
        return "Porsche Panamera"
    }
}


// MARK:- Decorator
class PorscheDecorator: Porsche {
    private let decoratedPorsche: Porsche
    
    func getPrice() -> Double {
        return decoratedPorsche.getPrice()
    }
    
    func getDescription() -> String {
        return decoratedPorsche.getDescription()
    }
    
    required init(dp: Porsche) {
        self.decoratedPorsche = dp
    }
}


// MARK:- Decorator Properties
class PremiumAudioSystem: PorscheDecorator {
    required init(dp: Porsche) {
        super.init(dp: dp)
    }
    
    override func getPrice() -> Double {
        return super.getPrice() + 20.5
    }
    
    override func getDescription() -> String {
        return super.getDescription() + " with Premium Audio System"
    }
}

class PanoramicSunroof: PorscheDecorator {
    required init(dp: Porsche) {
        super.init(dp: dp)
    }
    
    override func getPrice() -> Double {
        return super.getPrice() + 10.8
    }
    
    override func getDescription() -> String {
        return super.getDescription() + " with Panoramic Sunroof"
    }
}

// MARK:- Examples

// Standard
var boxster: Porsche = Boxster()
boxster.getPrice() // "120"
boxster.getDescription() // "Porsche Boxster"

var panamera: Porsche = Panamera()
panamera.getPrice() // "150"
panamera.getDescription() // "Porsche Panamera"

// Add 1 Modification
boxster = PremiumAudioSystem(dp: boxster)
boxster.getPrice() // "140.5"
boxster.getDescription() // "Porsche Boxster with Premium Audio System"

// Add 2 modifications
panamera = PanoramicSunroof(dp: panamera)
panamera = PremiumAudioSystem(dp: panamera)
panamera.getPrice() // "181.3"
panamera.getDescription() // "Porsche Panamera with Panoramic Sunroof with Premium Audio System"
