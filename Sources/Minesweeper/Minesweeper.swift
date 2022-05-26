import Foundation

class Board{
    enum BoardError: Error {
        case differentLength
        case faultyBorder
        case invalidCharacter
    }

    var input: [String] = []

    init(_ input: [String] = []) throws {

        let checkBorders = "\\+-+\\+"
        if(input[0].range(of: checkBorders, options: .regularExpression) == nil || input[input.count - 1].range(of: checkBorders, options: .regularExpression) == nil) {
            throw BoardError.faultyBorder
        }

        let lineLength = input[0].count
        for line in input{
            if(line.count != lineLength) {
                throw BoardError.differentLength
            }
        }

        let checkCharacters = "^\\|[\\s*]+\\|$"
        for i in 1 ..< input.count - 1 {
            if(input[i].range(of: checkCharacters, options: .regularExpression) == nil){
                throw BoardError.invalidCharacter
            }
        }

        self.input = input
    }

    func transform() throws -> [String]{
        return input;
    }
}
