// MARK:- Swim Behavoir
protocol SwimBehavior {
    func swim()
}

class ProfessionalSwimmer: SwimBehavior {
    func swim() {
        print("Professional Swimming")
    }
}

class NewbieSwimmer: SwimBehavior {
    func swim() {
        print("Newbie Swimming")
    }
}

class NonSwimmer: SwimBehavior {
    func swim() {
        print("Non-swimming")
    }
}



// MARK:- Dive Behavior
protocol DiveBehavior {
    func dive()
}

class ProfessionalDiver: DiveBehavior {
    func dive() {
        print("Professional Diving")
    }
}

class NewbieDiver: DiveBehavior {
    func dive() {
        print("Newbie Diving")
    }
}

class NonDiver: DiveBehavior {
    func dive() {
        print("Non-diving")
    }
}


// MARK:- Human class

class Human {
    private var swimBehavior: SwimBehavior!
    private var diveBehavior: DiveBehavior!
    
    func performSwim() {
        swimBehavior.swim()
    }
    
    func performDive() {
        diveBehavior.dive()
    }
    
    func setSwimBehavior(sb: SwimBehavior) {
        self.swimBehavior = sb
    }
    
    func setDiveBehavior(db: DiveBehavior) {
        self.diveBehavior = db
    }
    
    func run() {
        print("Running")
    }
    
    init(swimBehavior: SwimBehavior, diveBehavior: DiveBehavior) {
        self.swimBehavior = swimBehavior
        self.diveBehavior = diveBehavior
    }
}


// MARK:- Example

let human = Human(swimBehavior: ProfessionalSwimmer(), diveBehavior: NewbieDiver())
human.performSwim() // "Professional Swiming"
human.performDive() // "Newbie Diving"

human.setSwimBehavior(sb: NonSwimmer())
human.performSwim() // "Non-Swimming"

