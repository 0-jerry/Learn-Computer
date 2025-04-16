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
        
        return true
    }
    
    static func == (lhs: Byte, rhs: Byte) -> Bool {
        lhs.value == rhs.value
    }

    
    var description: String {
        var description = ""
        var value = self.value
        
        while !value.isEmpty {
            description += value.removeLast().description
        }
        return description
    }
    
    var int: Int {
        var int = 0
        var binaryValue = 1
        
        for i in value {
            int += i.rawValue * binaryValue
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
        var index = 0
        
        for index in 0..<Self.size {
            if number % 2 == 1 {
                value[index].toggle()
            }
            
            number /= 2
        }
        
        self.value = value
    }
    
    enum Error: Swift.Error, CustomStringConvertible, Equatable {
        case overSize(value: Int)
        case unknown
        
        var description: String {
            switch self {
            case .overSize(let value):
                return "[사이즈 초과] \(Byte.max) bit를 초과했습니다. (\(value) bit)"
            case .unknown:
                return "알 수 없는 에러"
            }
        }
    }
}



