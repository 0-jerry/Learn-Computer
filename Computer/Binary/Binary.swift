//
//  Binary.swift
//  Computer
//
//  Created by 0-jerry on 4/16/25.
//

enum Binary: Int, Comparable, CustomStringConvertible {

    case zero = 0
    case one = 1
    
    var description: String {
        return String(self.rawValue)
    }
    
    func toggle() -> Binary {
        switch self {
        case .zero:
            return .one
        case .one:
            return .zero
        }
    }
    
    static func < (lhs: Binary, rhs: Binary) -> Bool {
        lhs.rawValue < rhs.rawValue
    }
    
}
