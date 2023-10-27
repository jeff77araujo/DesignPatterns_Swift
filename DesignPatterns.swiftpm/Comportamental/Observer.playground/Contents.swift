// MARK: - Comportamental: Observer

protocol PropertyObserver: class {
    func willChangePropertyName(propertyName: String, newPropertyValue: AnyObject?)
    func didChangePropertyName(propertyName: String, oldPropertyValue: AnyObject?)
}

class TestChambers {
    weak var observer: PropertyObserver?
    
    var testChamberNumber: Int = 0 {
        willSet(newValue) {
            observer?.willChangePropertyName(propertyName: "testeChamberNumber", newPropertyValue: newValue as AnyObject)
        }
        didSet {
            observer?.didChangePropertyName(propertyName: "testeChamberNumber", oldPropertyValue: oldValue as AnyObject)
        }
    }
}

class Observer: PropertyObserver {
    func willChangePropertyName(propertyName: String, newPropertyValue: AnyObject?) {
        if newPropertyValue as? Int == 1 {
            print("Okay. Look. We both said a lot of things you're going to regret.")
        }
    }
    
    func didChangePropertyName(propertyName: String, oldPropertyValue: AnyObject?) {
        if oldPropertyValue as? Int == 0 {
            print("Sorry about the mess. I've really let the place go since tou killed me.")
        }
    }
    
}

// MARK: - Usage

var observerInstance = Observer()
var testChambers = TestChambers()

testChambers.observer = observerInstance
testChambers.testChamberNumber = testChambers.testChamberNumber + 1
