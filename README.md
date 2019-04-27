# ZZCryptManager

[![CI Status](https://img.shields.io/travis/185226139@qq.com/ZZCryptManager.svg?style=flat)](https://travis-ci.org/185226139@qq.com/ZZCryptManager)
[![Version](https://img.shields.io/cocoapods/v/ZZCryptManager.svg?style=flat)](https://cocoapods.org/pods/ZZCryptManager)
[![License](https://img.shields.io/cocoapods/l/ZZCryptManager.svg?style=flat)](https://cocoapods.org/pods/ZZCryptManager)
[![Platform](https://img.shields.io/cocoapods/p/ZZCryptManager.svg?style=flat)](https://cocoapods.org/pods/ZZCryptManager)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

ZZCryptManager is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'ZZCryptManager'
```

## Use

```
///aes加密
    ZZCryptManager.zz_aesEncrypt("13233258888", key, iv)

///aes解密
    ZZCryptManager.zz_aesDecrypt("X/A+jXMnFGS81LZjC7XTmw==", key, iv)
    
///rsa加密
    let str = "Rsaencrypt"
    ZZCryptManager.zz_rsaEncrypt(str, publicKey)
    
    encryptData 需要解密的字符串
    let encryptData = "NlqltiOIfIIl44sKSxaYfgPwficlpDYxUWUc4/wqrlvUYKltZ"
    ZZCryptManager.zz_rsaDecrypt(encryptData, privateKey)
    
    ///签名
    str 需要签名的数据
    ZZCryptManager.zz_rsaSignWithSHA1(str, privateKey)
    
    
    ///验签
    str 需要比对的数据
    siginStr 签名过的字符串
    let siginStr = "bO8Ru4+UJceJKPzPmTMH4okKr2Yc5FRuLFzwS9VMnnp"
    
    ZZCryptManager.zz_rsaSignVerifyWithSHA1(str, siginStr, publicKey)

```

## Author

liguoliang

## License

ZZCryptManager is available under the MIT license. See the LICENSE file for more info.
