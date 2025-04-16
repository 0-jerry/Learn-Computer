//
//  ByteTest.swift
//  Computer
//
//  Created by 0-jerry on 4/16/25.
//

import XCTest
import Testing

struct ByteTest {
    
    //MARK: - ByteTest.Comparable Test
    
    private struct Comparable {
        
        @Test private func upper() {
            do {
                
                let lower = try Byte(number: 100)
                let upper = try Byte(number: 101)
                
                assert(lower < upper, "비교 테스트 (<)")
                
            } catch let byteError as Byte.Error {
                assert(false, byteError.description)
            } catch {
                assert(false, "알 수 없는 형식의 에러")
            }
        }
        
        @Test private func lower() {
            do {
                
                let lower = try Byte(number: 101)
                let upper = try Byte(number: 100)
                
                assert(lower > upper, "비교 테스트(>)")
                
            } catch let byteError as Byte.Error {
                assert(false, byteError.description)
            } catch {
                assert(false, "알 수 없는 형식의 에러")
            }
        }
        
        @Test private func equal_correct() {
            do {
                
                let lower = try Byte(number: 100)
                let upper = try Byte(number: 100)
                
                assert(lower == upper, "비교 테스트 (==)")
                
            } catch let byteError as Byte.Error {
                assert(false, byteError.description)
            } catch {
                assert(false, "알 수 없는 형식의 에러")
            }
        }
        
        @Test private func equal_incorrect() {
            do {
                
                let lower = try Byte(number: 100)
                let upper = try Byte(number: 101)
                
                assert(lower != upper, "비교 테스트 (!=)")
                
            } catch let byteError as Byte.Error {
                assert(false, byteError.description)
            } catch {
                assert(false, "알 수 없는 형식의 에러")
            }
        }
    }
    
    // MARK: - ByteTest.Description Test
    
    private struct Description {
        
        @Test private func max_description_correct() {
            let maxByte = Byte.max
            
            guard let byte = try? Byte(number: maxByte) else {
                assert(false, "Byte 생성 실패")
            }
            
            assert(byte.description == "11111111", "Description 일치 테스트")
        }
        
        @Test private func min_description_correct() {
            let minByte = Byte.min
            
            guard let byte = try? Byte(number: minByte) else {
                assert(false, "Byte 생성 실패")
            }
            
            assert(byte.description == "00000000", "Description 일치 테스트")
        }
    }
    
    // MARK: - ByteTest.BinaryDescription Test
    
    private struct BinaryDescription {
        
        @Test private func max_binaryDescription_correct() {
            let maxByte = Byte.max
            
            guard let byte = try? Byte(number: maxByte) else {
                assert(false, "Byte 생성 실패")
            }
            
            assert(byte.binaryDescription == "11111111₂", "BinaryDescription 일치 테스트")
        }
        
        @Test private func min_binaryDescription_correct() {
            let minByte = Byte.min
            
            guard let byte = try? Byte(number: minByte) else {
                assert(false, "Byte 생성 실패")
            }
            
            assert(byte.binaryDescription == "00000000₂", "BinaryDescription 일치 테스트")
        }
    }
    
    //MARK: - ByteTest.Init Test
    
    private struct Init {
        
        @Test private func vaild_range() {
            let randomInteger = Int.random(in: 0...255)
            guard let byte = try? Byte(number: randomInteger) else {
                assert(false)
            }
            
            assert(byte.int == randomInteger, "rawValue 일치. - \(randomInteger)")
        }
        
        @Test private func invaild_lower_range() {
            let lowerRange = (Int.min..<Byte.min)
            let randomInteger = Int.random(in: lowerRange)
            
            do {
                _ = try Byte(number: randomInteger)
                assert(false, "Byte 초과 범위 생성 테스트 - \(randomInteger)")
            } catch let byteError as Byte.Error {
                if byteError == .overSize(value: randomInteger) {
                    assert(true, byteError.description)
                } else {
                    assert(false, byteError.description)
                }
            } catch {
                assert(false, "알 수 없는 Error 케이스")
            }
        }
        
        @Test private func invaild_upper_range() {
            let upperRange = (Byte.max+1...Int.max)
            let randomInteger = Int.random(in: upperRange)
            
            do {
                _ = try Byte(number: randomInteger)
                assert(false, "Byte 초과 범위 생성 \(randomInteger)")
            } catch let byteError as Byte.Error {
                if byteError == .overSize(value: randomInteger) {
                    assert(true, byteError.description)
                } else {
                    assert(false, byteError.description)
                }
            } catch {
                assert(false, "알 수 없는 Error 케이스")
            }
        }
        
    }
    
}
