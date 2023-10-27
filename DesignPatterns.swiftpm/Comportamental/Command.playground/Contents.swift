// MARK: - Comportamental: Command

protocol DoorCommand {
    func execute() -> String
}

class OpenCommand: DoorCommand {
    let doors: String
    
    required init(doors: String) {
        self.doors = doors
    }
    
    func execute() -> String {
        return "Opened \(doors)"
    }
}

class CloseCommand: DoorCommand {
    let doors: String
    
    required init(doors: String) {
        self.doors = doors
    }
    
    func execute() -> String {
        return "Closed \(doors)"
    }
}

class HAL9000DoorsOperations {
    let openCommand: DoorCommand
    let closeCommand: DoorCommand
    
    init(doors: String) {
        self.openCommand = OpenCommand(doors: doors)
        self.closeCommand = OpenCommand(doors: doors)
    }
    
    func open() -> String {
        return openCommand.execute()
    }
    
    func close() -> String {
        return closeCommand.execute()
    }
}

// MARK: - USAGE

let podBayDoors = "Pod Bay Doors"
let doorModule = HAL9000DoorsOperations(doors: podBayDoors)
doorModule.open()
doorModule.close()

