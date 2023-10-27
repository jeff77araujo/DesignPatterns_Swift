// MARK: - Comportamental: Memento

typealias Memento = Dictionary<String, AnyObject>

let DPMementoKeyChapter = "needforspeed.chapter"
let DPMementoKeyWeapon = "needforspeed.chapter"
let DPMementoGameState = "needforspeed.state"

// MARK: - Originator

class GameState {
    var chapter = ""
    var weapon = ""
    
    func toMemento() -> Memento {
        return [ DPMementoKeyChapter : chapter as AnyObject,
                  DPMementoKeyWeapon : weapon as AnyObject ]
    }
    
    func restoreFromMemento(memento: Memento) {
        chapter = memento[DPMementoKeyChapter] as? String ?? "n/a"
        weapon = memento[DPMementoKeyWeapon] as? String ?? "n/a"
    }
}

// MARK: - Caretaker

class CheckPoint {
    class func saveState(memento: Memento, keyName: String = DPMementoGameState) {
        let defaults = UserDefaults.standard
        defaults.set(memento, forKey: keyName)
        defaults.synchronize()
    }
    
    class func restorePreviousState(keyName: String = DPMementoGameState) -> Memento {
        let defaults = UserDefaults.standard
        
        return defaults.object(forKey: keyName) as? Memento ?? Memento()
    }
}

// MARK: - Usage

var gameState = GameState()
gameState.restoreFromMemento(memento: CheckPoint.restorePreviousState())

gameState.chapter = "Black Mesa Inbound"
gameState.weapon = "Crowbar"
CheckPoint.saveState(memento: gameState.toMemento() )

gameState.chapter = "Anomalous Materials"
gameState.weapon = "Glock 17"
gameState.restoreFromMemento(memento: CheckPoint.restorePreviousState())

gameState.chapter = "Unforeseen Consequences"
gameState.weapon = "MP5"
CheckPoint.saveState(memento: gameState.toMemento(), keyName: "gameState2")

gameState.chapter = "Office Complex"
gameState.weapon = "Crossbow"
CheckPoint.saveState(memento: gameState.toMemento())

gameState.restoreFromMemento(memento: CheckPoint.restorePreviousState(keyName: "gameState2"))
