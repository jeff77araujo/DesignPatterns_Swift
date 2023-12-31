// MARK: - Comportamental: Mediator

class Colleague {
    let mediator: Mediator
    
    init(mediator: Mediator) {
        self.mediator = mediator
    }
    
    func send(message: String) {
        mediator.send(message: message, colleague: self)
    }
    
    func receive(message: String) {
        assert(false, "Method should be overriden")
    }
}

protocol Mediator {
    func send(message: String, colleague: Colleague)
}

class MessageMediator: Mediator {
    private var colleagues: [Colleague] = []
    
    func addColleague(colleague: Colleague) {
        colleagues.append(colleague)
    }
    
    func send(message: String, colleague: Colleague) {
        for c in colleagues {
            if c !== colleague {
                colleague.receive(message: message)
            }
        }
    }
}

class ConcreteColleague: Colleague {
    override func receive(message: String) {
        print("Colleague received: \(message)")
    }
}

// MARK: - USAGE

let messagesMediator = MessageMediator()
let user0 = ConcreteColleague(mediator: messagesMediator)
let user1 = ConcreteColleague(mediator: messagesMediator)

messagesMediator.addColleague(colleague: user0)
messagesMediator.addColleague(colleague: user1)

user0.send(message: "Hello")
