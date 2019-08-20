import Foundation

// MARK:- Main object
protocol Subject {
    func didAdd(observer: PropertyObserver)
    func didRemove(observer: PropertyObserver)
    func notify(withNewTask task: String)
}

class Teacher: Subject {
    
    private var observersCollection = NSMutableSet()
    var task = "" {
        didSet {
            notify(withNewTask: task)
        }
    }
    
    func didAdd(observer: PropertyObserver) {
        observersCollection.add(observer)
    }
    
    func didRemove(observer: PropertyObserver) {
        observersCollection.remove(observer)
    }
    
    func notify(withNewTask task: String) {
        observersCollection.forEach { (observer) in
            (observer as! PropertyObserver).didGet(newTask: task)
        }
    }
}

// MARK:- Observer object
protocol PropertyObserver {
    func didGet(newTask task: String)
}

class Pupil: NSObject, PropertyObserver {
    var homeworkTask = ""
    
    func didGet(newTask task: String) {
        homeworkTask = task
        print("Got new task")
    }
}

// MARK:- Example

let teacher = Teacher()

let pupil1 = Pupil()
teacher.didAdd(observer: pupil1)

let pupil2 = Pupil()
teacher.didAdd(observer: pupil2)

teacher.task = "NEW TASK"
print(pupil1.homeworkTask) // "NEW TASK"
print(pupil2.homeworkTask) // "NEW TASK"

let pupil3 = Pupil()
teacher.didAdd(observer: pupil3)

teacher.task = "ANOTHER TASK"
print(pupil1.homeworkTask) // "ANOTHER TASK"
print(pupil2.homeworkTask) // "ANOTHER TASK"
print(pupil3.homeworkTask) // "ANOTHER TASK"
