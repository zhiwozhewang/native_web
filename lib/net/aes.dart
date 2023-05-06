import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:encrypt/encrypt.dart';
import 'package:flutter/cupertino.dart';

class Aes {
  static final _iv = IV.fromLength(16);
  static const _key = 'jaix8WnfqRFpQlLk';

  static void enCrypt(String data) {
    Encrypted encrypted = _getEncrypter().encrypt(data, iv: _iv);
    debugPrint("加密结果${encrypted.base64}");
  }

  static String deCrypt(String encoded) {
    String encode = _getEncrypter().decrypt64(encoded, iv: _iv);
    debugPrint("解密结果$encode");
    return encode;
  }

  static Encrypter _getEncrypter() {
    final key = encrypt.Key.fromUtf8(_key);
    return Encrypter(AES(key, mode: AESMode.ecb, padding: 'PKCS7'));
  }
}
