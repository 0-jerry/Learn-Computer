//
//  Byte.swift
//  Computer
//
//  Created by 0-jerry on 4/16/25.
//

struct Byte: CustomStringConvertible, BinaryStringConvertible, Comparable {
    
    static let size: Int = 8
    static let min: Int = 0
    static let max: Int = {
        var max = 1
        
        for _ in 1...size {
            max *= 2
        }
        
        return max - 1
    }()
    
    static func < (lhs: Byte, rhs: Byte) -> Bool {
        for i in 1...size {
            let index = size - i
            guard lhs.value[index] == rhs.value[index] else {
                return lhs.value[index] < rhs.value[index]
            }
        }
        
        return false
    }
    
    static func == (lhs: Byte, rhs: Byte) -> Bool {
        lhs.value == rhs.value
    }

    
    var description: String {
        value.reduce("", { $0 + $1.description })
    }
    
    var int: Int {
        var int = 0
        var binaryValue = 1
        
        var value = self.value
        
        while !value.isEmpty {
            let bit = value.removeLast()
            int += bit.rawValue * binaryValue
            
            binaryValue *= 2
        }
        
        return int
    }
    
    private var value: [Bit]
    
    init(number: Int) throws {
        
        guard number >= Self.min else {
            throw Error.overSize(value: number)
        }
        
        guard number <= Self.max else {
            throw Error.overSize(value: number)
        }
        
        var number = number
        var value: [Bit] = Array(repeating: .off, count: Byte.size)
        
        for i in 1...Self.size {
            if number % 2 == 1 {
                let index = Self.size - i
                value[index].toggle()
            }
            
            number /= 2
        }
        
        guard value.count == 8 else {
            throw Byte.Error.invaild
        }
        
        self.value = value
    }
    
    enum Error: Swift.Error, CustomStringConvertible, Equatable {
        case overSize(value: Int)
        case invaild
        case unknown
        
        var description: String {
            switch self {
            case .overSize(let value):
                return "[사이즈 초과] \(Byte.max) bit를 초과했습니다. (\(value) bit)"
            case .invaild:
                return "지원하지 않는 형식"
            case .unknown:
                return "알 수 없는 에러"
            }
        }
    }
}



