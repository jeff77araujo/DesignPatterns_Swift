// MARK: - Criação: Prototype

class ChungasRevengeDisplay {
    var name: String?
    let font: String
    
    init(font: String) {
        self.font = font
    }
    
    func clone() -> ChungasRevengeDisplay {
        return ChungasRevengeDisplay(font: self.font)
    }
}

// MARK: - Usage

let Prototype = ChungasRevengeDisplay(font: "GotanProject")

let Philippe = Prototype.clone()
Philippe.name = "Philippe"

let Christoph = Prototype.clone()
Christoph.name = "Christoph"

let Edward = Prototype.clone()
Edward.name = "Edward"
