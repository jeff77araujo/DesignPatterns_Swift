// MARK: - Comportamental: Strategy

protocol PrintStrategy {
    func printString(_ string: String) -> String
}

class Printer {
    let strategy: PrintStrategy
    
    func printString(_ string: String) -> String {
        return self.strategy.printString(string)
    }
    
    init(strategy: PrintStrategy) {
        self.strategy = strategy
    }
}

class UpperCaseStrategy: PrintStrategy {
    func printString(_ string: String) -> String {
        return string.uppercased()
    }
}

class LowerCaseStrategy: PrintStrategy {
    func printString(_ string: String) -> String {
        return string.lowercased()
    }
}

// MARK: - Usage

var lower = Printer(strategy: LowerCaseStrategy())
lower.printString("O tempora, o mores!")

var upper = Printer(strategy: UpperCaseStrategy())
upper.printString("O tempora, o mores!")
