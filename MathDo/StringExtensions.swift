//
//  Extensions.swift
//  MathDo
//
//  Created by Вячеслав Макаров on 12.01.2022.
//

import Foundation


extension String {
    
    var lastIndex: String.Index {
        self.index(before: endIndex)
    }
    
    func slice(from: String, to: String) -> String? {
        return (range(of: from)?.upperBound).flatMap { substringFrom in
            return (range(of: to, range: substringFrom..<endIndex)?.upperBound).map { substringTo in
                if self[substringFrom..<substringTo].contains(from) {
                    return String(self[substringFrom..<substringTo])
                } else {
                    return (range(of: to, range: substringFrom..<endIndex)?.lowerBound).map {
                        substringTo in
                        String(self[substringFrom..<substringTo])
                    } ?? ""
                }
            }
        }
    }
    
    func newSlice(from: Character, to: Character) -> String? {
        var charArray = Array<Character>()
        var capturingBegins = false
        var openBracketsCount = 0
        var closeBracketsCount = 0
        
        for char in self {
            
            if char == to {
                closeBracketsCount += 1
                if closeBracketsCount == openBracketsCount {
                    capturingBegins = false
                    break
                }
            }
            
            if capturingBegins {
                charArray.append(char)
            }
            
            if char == from {
                openBracketsCount += 1
                capturingBegins = true
                continue
            }
        }
        
        return !charArray.isEmpty ? String(charArray) : nil
    }
    
    
    func getFirstOperandStartIndex(of operation: Character) -> String.Index? {
        let operationsSymbols: [Character] = ["+", "-", "/", "*", "^", "!"]
        guard let operationIndex = self.firstIndex(of: operation) else { return nil }
            
        func startFindingIndexRecursion(index: String.Index) -> String.Index {
            guard self.startIndex != index else { return index }
            let indexBefore = self.index(before: index)
            let charBefore = self[indexBefore]
            if operationsSymbols.contains(charBefore){
                return index
            } else {
                return startFindingIndexRecursion(index: indexBefore)
            }
        }
        
        return startFindingIndexRecursion(index: operationIndex)
    }
    
    func getFirstOperandStartIndex(of operationIndex: String.Index) -> String.Index? {
        let operationsSymbols: [Character] = ["+", "-", "/", "*", "^", "!"]
            
        func startFindingIndexRecursion(index: String.Index) -> String.Index {
            guard self.startIndex != index else { return index }
            let indexBefore = self.index(before: index)
            let charBefore = self[indexBefore]
            if operationsSymbols.contains(charBefore){
                return index
            } else {
                return startFindingIndexRecursion(index: indexBefore)
            }
        }
        
        return startFindingIndexRecursion(index: operationIndex)
    }
    
    
    func getSecondOperandLastIndex(of operation: Character) -> String.Index? {
        let operationsSymbols: [Character] = ["+", "-", "/", "*", "^", "!"]
        guard let operationIndex = self.firstIndex(of: operation) else { return nil }
        
        func startFindingIndexRecursion(index: String.Index) -> String.Index {
            guard lastIndex != index else { return index }
            let indexAfter = self.index(after: index)
            let charAfter = self[indexAfter]
            if operationsSymbols.contains(charAfter){
                return index
            } else {
                return startFindingIndexRecursion(index: indexAfter)
            }
        }
        
        return startFindingIndexRecursion(index: operationIndex)
        
        }
    
    func getFirstOperand(of operation: Character) -> String? {
        guard let firstIndex = self.getFirstOperandStartIndex(of: operation) else { return nil}
        guard let secondIndex = self.firstIndex(of: operation) else { return nil }
//        guard firstIndex != self.startIndex else { return nil }
        let firstOperand = String(self[firstIndex..<secondIndex] )
        if firstOperand.contains("minus") {
            return firstOperand.replacingOccurrences(of: "minus", with: "-")
        }
        
        return firstOperand
    }
    
    func getFirstOperand(of operationIndex: String.Index) -> String? {
        guard let firstIndex = self.getFirstOperandStartIndex(of: operationIndex) else { return nil}
        let secondIndex = operationIndex
//        guard firstIndex != self.startIndex else { return nil }
        let firstOperand = String(self[firstIndex..<secondIndex] )
        if firstOperand.contains("minus") {
            return firstOperand.replacingOccurrences(of: "minus", with: "-")
        }
        
        return firstOperand
    }
    
    func getSecondOperand(of operation: Character) -> String? {
        guard let operationIndex = self.firstIndex(of: operation) else { return nil }
        guard let secondIndex = self.getSecondOperandLastIndex(of: operation) else { return nil }
        let firstIndex = self.index(after: operationIndex)
        let secondOperand = String(self[firstIndex...secondIndex] )
        if secondOperand.contains("minus") {
            return secondOperand.replacingOccurrences(of: "minus", with: "-")
        }
        return secondOperand
    }
    
    func getExpression(of operation: Character) -> String? {
        guard let firstIndex = self.getFirstOperandStartIndex(of: operation) else { return nil }
        guard let secondIndex = self.getSecondOperandLastIndex(of: operation) else { return nil }
        return String(self[firstIndex...secondIndex] )
    }
    
    func getSymbolBefore(index: String.Index) -> Character? {
        guard index != startIndex else { return nil }
        let indexBefore = self.index(before: index)
        return self[indexBefore]
    }
    
    func getSymbolAfter(index: String.Index) -> Character? {
        guard index != lastIndex || index != endIndex else { return nil }
        let indexAfter = self.index(after: index)
        guard index != self.lastIndex || indexAfter != self.endIndex else { return nil }
        return self[indexAfter]
    }
    
    }



  //                let operationsSymbols: [Character] = ["+", "-", "/", "*", "^", "!"]
  //                let indexAfter = expression.index(after: index)
  //                let charAfter = expression[indexAfter]
  //                if operationsSymbols.contains(charAfter) {
  //                    return indexAfter
  //                } else {
  //                    return getEndIndex(index: indexAfter)
  //                }
  //            }
    
//    func slice(from: String, to: String) -> String? {
//
//
//        return (range(of: from)?.upperBound).flatMap { substringFrom in
//            return (range(of: to, range: substringFrom..<endIndex)?.upperBound).map { substringTo in
//                if self[substringFrom..<substringTo].contains(from) {
//                    return String(self[substringFrom..<substringTo])
//                } else {
//                    return (range(of: to, range: substringFrom..<endIndex)?.lowerBound).map {
//                        substringTo in
//                        String(self[substringFrom..<substringTo])
//                    } ?? ""
//                }
//            }
//        }
//    }

