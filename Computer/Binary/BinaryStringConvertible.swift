//
//  BinaryCustomStringConvertible.swift
//  Computer
//
//  Created by 0-jerry on 4/16/25.
//

protocol BinaryStringConvertible: CustomStringConvertible {
}

extension BinaryStringConvertible {
    var binaryDescription: String {
        self.description + "₂"
    }
}
