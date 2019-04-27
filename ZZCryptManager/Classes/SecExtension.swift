//
//  SecExtension.swift
//  ZZCryptManager
//
//  Created by Passer on 2019/4/27.
//

import Foundation

/**
 * Index
 */
internal extension Int {
    subscript(digitIndex: Int) -> Int {
        var decimalBase = 1
        for _ in 1...digitIndex {
            decimalBase *= 10
        }
        return (self / decimalBase) % 10
    }
}

internal extension UInt {
    subscript(digitIndex: Int) -> UInt {
        var decimalBase:UInt = 1
        for _ in 1...digitIndex {
            decimalBase *= 10
        }
        return (self / decimalBase) % 10
    }
}

internal extension UInt8 {
    subscript(digitIndex: Int) -> UInt8 {
        var decimalBase:UInt8 = 1
        for _ in 1...digitIndex {
            decimalBase *= 10
        }
        return (self / decimalBase) % 10
    }
}
internal extension Data {
    func hexadecimalString() -> String {
        let string = NSMutableString(capacity: count * 2)
        var byte: UInt8 = 0
        for i in 0 ..< count {
            copyBytes(to: &byte, from: i..<index(after: i))
            string.appendFormat("%02x", byte)
        }
        
        return string as String
    }
    var hexString : String {
        return self.hexadecimalString()
    }
    var base64String:String {
        return self.base64EncodedString(options: NSData.Base64EncodingOptions())
    }
    func arrayOfBytes() -> [UInt8] {
        let count = self.count / MemoryLayout<UInt8>.size
        var bytesArray = [UInt8](repeating: 0, count: count)
        (self as NSData).getBytes(&bytesArray, length:count * MemoryLayout<UInt8>.size)
        return bytesArray
    }
}
internal extension String {
    /// Array of UInt8
    var arrayOfBytes:[UInt8] {
        let data = self.data(using: String.Encoding.utf8)!
        return data.arrayOfBytes()
    }
    var bytes:UnsafeRawPointer{
        let data = self.data(using: String.Encoding.utf8)!
        return (data as NSData).bytes
    }
    func dataFromHexadecimalString() -> Data? {
        let trimmedString = self.trimmingCharacters(in: CharacterSet(charactersIn: "<> ")).replacingOccurrences(of: " ", with: "")
        
        guard let regex = try? NSRegularExpression(pattern: "^[0-9a-f]*$", options: NSRegularExpression.Options.caseInsensitive) else{
            return nil
        }
        let trimmedStringLength = trimmedString.lengthOfBytes(using: String.Encoding.utf8)
        let found = regex.firstMatch(in: trimmedString, options: NSRegularExpression.MatchingOptions.reportProgress, range: NSMakeRange(0, trimmedStringLength))
        if found == nil || found?.range.location == NSNotFound || trimmedStringLength % 2 != 0 {
            return nil
        }
        
        var data = Data(capacity: trimmedStringLength / 2)
        
        for index in trimmedString.indices {
            let next_index = trimmedString.index(after: index)
            let byteString = String(trimmedString[index ..< next_index]) //trimmedString.substring(with: )
            let num = UInt8(byteString.withCString { strtoul($0, nil, 16) })
            data.append(num)
        }
        return data
    }
}

