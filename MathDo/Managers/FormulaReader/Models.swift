//
//  Models.swift
//  MathDo
//
//  Created by Вячеслав Макаров on 25.01.2022.
//

enum OperationType: Character, CaseIterable {
    case exponentiation = "^"
    case multiplication = "*"
    case division = "/"
    case addition = "+"
    case subtraction = "-"

static func getOperationSymbols() -> [Character] {
            var operationsCharacters = Array<Character>()
            allCases.forEach { operation in
                operationsCharacters.append(operation.rawValue)
            }
            return operationsCharacters
        }
}

struct AllowedSymbols {
    var allowedSymbols = "+-*/^1234567890()"
    var digits = "0123456789"
    var operations = OperationType.getOperationSymbols()
    var brackets = "()"
    
   mutating func addAllowedSymbol(character: Character) {
        allowedSymbols.append(character)
    }
}
