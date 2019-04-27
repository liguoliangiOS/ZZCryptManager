//
//  MD5Crypt.swift
//  ZZCryptManager
//
//  Created by Passer on 2019/4/27.
//

import UIKit
import CommonCrypto


internal extension String {
    //MD5加密
    func md5Encrypt() -> String {
        let utf8_str = self.cString(using: .utf8)
        let str_len = CC_LONG(self.lengthOfBytes(using: .utf8))
        let digest_len = Int(CC_MD5_DIGEST_LENGTH)
        let result = UnsafeMutablePointer<CUnsignedChar>.allocate(capacity: digest_len)
        CC_MD5(utf8_str, str_len, result)
        let str = NSMutableString()
        for i in 0..<digest_len {
            str.appendFormat("%02x", result[i])
        }
        result.deallocate()
        return str as String
    }
}
