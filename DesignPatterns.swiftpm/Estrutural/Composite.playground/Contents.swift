// MARK: - Estrutural: Composite

protocol Shape {
    func draw(fillColor: String)
}

class Square: Shape {
    func draw(fillColor: String) {
        print("Drawing a Square with color \(fillColor)")
    }
}

class Circle: Shape {
    func draw(fillColor: String) {
        print("Drawing a Circle with color \(fillColor)")
    }
}

class Whiteboard: Shape {
    lazy var shapes = [Shape]()
    
    init(_ shapes: Shape...) {
        self.shapes = shapes
    }
    
    func draw(fillColor: String) {
        for shape in shapes {
            shape.draw(fillColor: fillColor)
        }
    }
}

// MARK: - Usage

var whiteboard = Whiteboard(Circle(), Square())
whiteboard.draw(fillColor: "red")
