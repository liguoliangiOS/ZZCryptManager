//
//  ZZCryptManager.swift
//  ZZCryptManager
//
//  Created by Passer on 2019/4/27.
//

import UIKit


private let ZZ_RSA_PRIVATE_KEY_TAG = "RSAUtil_PrivKey"
private let ZZ_RSA_PUBLIC_KEY_TAG = "RSAUtil_PubKey"

public class ZZCryptManager: NSObject {
    
    //MARK: ---- MD5加密
    public class func zz_md5Encrypt(_ text: String ) -> String {
        return text.md5Encrypt()
    }
    
    //MARK: ---- AES
    
    ///AES 加密
    public class func zz_aesEncrypt(_ text: String, _ key:[UInt8], _ iv:[UInt8]) -> String? {
        guard let result = text.aesCBCEncrypt(String(data: Data.init(key), encoding: .utf8)!, iv: String(data: Data.init(iv), encoding: .utf8)!) else { return nil }
        let encryptedDataText = result.base64EncodedString(options: NSData.Base64EncodingOptions())
        return encryptedDataText
    }
    
    ///AES 加密
    public class func zz_aesEncryptStr(_ text: String, _ key:String, _ iv:String) -> String? {
        let result = text.aesCBCEncrypt(key, iv: iv)
        let encryptedDataText = result!.base64EncodedString(options: NSData.Base64EncodingOptions())
        return encryptedDataText
    }
    
    ///AES 解密
    public class func zz_aesDecrypt(_ aesText: String, _ key:[UInt8], _ iv:[UInt8]) -> String? {
        guard let deResult = aesText.aesCBCDecryptFromBase64(String(data: Data.init(key), encoding: .utf8)!, iv: String(data: Data.init(iv), encoding: .utf8)!) else { return nil }
        return deResult
    }
    
    ///AES 解密
    public class func zz_aesDecryptStr(_ aesText: String, _ key:String, _ iv:String) -> String? {
        guard let deResult = aesText.aesCBCDecryptFromBase64(key, iv: iv) else { return nil }
        return deResult
    }
    
    //MARK: ---- RSA
    
    /// RSA签名
    public class func zz_rsaSignWithSHA1(_ text: String, _ privateKey: String) -> String? {
        guard let textData = text.data(using: String.Encoding.utf8) else { return nil }
        let siginData = RSACrypt.siginWithRsaSHA1(textData, privateKey, ZZ_RSA_PRIVATE_KEY_TAG)
        if  siginData != nil {
            let encryptedDataText = siginData!.base64EncodedString(options: NSData.Base64EncodingOptions())
            return encryptedDataText
        } else {
            print("Error while sigining")
            return nil
        }
    }
    
    
    /// RSA验签
    public class func zz_rsaSignVerifyWithSHA1(_ originalStr: String, _ siginStr: String, _ publicKey: String) -> Bool {
        return RSACrypt.verifySigin(originalStr, siginStr, publicKey, ZZ_RSA_PRIVATE_KEY_TAG)
    }
    
    /// RSA公钥加密
    public class func zz_rsaEncrypt(_ text: String, _ publicKey: String) -> String? {
        guard let textData = text.data(using: String.Encoding.utf8) else { return nil }
        let encryptedData = RSACrypt.encryptWithRSAPublicKey(textData, pubkeyBase64: publicKey, keychainTag: ZZ_RSA_PUBLIC_KEY_TAG)
        if ( encryptedData == nil ) {
            print("Error while encrypting")
            return nil
        } else {
            let encryptedDataText = encryptedData!.base64EncodedString(options: NSData.Base64EncodingOptions())
            return encryptedDataText
        }
    }
    /// RSA私钥解密
    public class func zz_rsaDecrypt(_ encryptData: String, _ privateKey: String) -> String? {
        guard let baseDecodeData = Data(base64Encoded: encryptData, options: NSData.Base64DecodingOptions()) else { return nil }
        let decryptedInfo = RSACrypt.decryptWithRSAPrivateKey(baseDecodeData, privkeyBase64: privateKey, keychainTag: ZZ_RSA_PRIVATE_KEY_TAG)
        if ( decryptedInfo != nil ) {
            let result = String(data: decryptedInfo!, encoding: .utf8)
            return result
        } else {
            print("Error while decrypting")
            return nil
        }
    }
    
    /// RSA公钥解密
    public class func zz_rsaDecryptPublic(_ encryptData: String, _ publicKey: String) -> String? {
        
        guard let baseDecodeData = Data(base64Encoded: encryptData, options: NSData.Base64DecodingOptions()) else { return nil }
        let decryptedInfo = RSACrypt.decryptWithRSAPublicKey(baseDecodeData, pubkeyBase64: publicKey, keychainTag: ZZ_RSA_PUBLIC_KEY_TAG)
        if ( decryptedInfo != nil ) {
            let result = String(data: decryptedInfo!, encoding: .utf8)
            return result
        } else {
            print("Error while decrypting")
            return nil
        }
    }
}

