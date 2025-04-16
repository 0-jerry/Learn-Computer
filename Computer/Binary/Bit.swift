//
//  Bit.swift
//  Computer
//
//  Created by 0-jerry on 4/16/25.
//

struct Bit: CustomStringConvertible, Comparable {
    
    static let on: Bit = .init(true)
    static let off: Bit = .init(false)
    
    static func < (lhs: Bit, rhs: Bit) -> Bool {
        lhs.value < rhs.value
    }
    
    var description: String {
        value.description
    }
    
    private var value: Binary
    
    var rawValue: Int {
        self.value.rawValue
    }
    
    mutating func toggle() {
        self.value = value.toggle()
    }
    
    init(_ bool: Bool) {
        self.value = bool ? .one: .zero
    }
}
