import 'dart:typed_data';
import 'package:bech32/bech32.dart';
import 'package:bitcoindart/src/payments/p2sh.dart';

import 'models/networks.dart';
import 'package:bs58check/bs58check.dart' as bs58check;
import 'payments/index.dart' show PaymentData;
import 'payments/p2pkh.dart';
import 'payments/p2wpkh.dart';

class Address {
  static bool validateAddress(String address, [NetworkType? nw]) {
    try {
      addressToOutputScript(address, nw);
      return true;
    } catch (err) {
      return false;
    }
  }

  static Uint8List addressToOutputScript(String address, [NetworkType? nw]) {
    NetworkType network = nw ?? bitcoin;
    var decodeBase58;
    var decodeBech32;
    try {
      decodeBase58 = bs58check.decode(address);
    } catch (err) {}
    if (decodeBase58 != null) {
      int version = decodeBase58[0];
      if (version == network.pubKeyHash) {
        P2PKH p2pkh = new P2PKH(data: new PaymentData(address: address), network: network);
        return p2pkh.data.output!;
      }
      if (version == network.scriptHash) {
        P2SH p2sh = new P2SH(data: new PaymentData(address: address), network: network);
        return p2sh.data.output!;
      }
      if (version != network.pubKeyHash && version != network.scriptHash)
        throw new ArgumentError('Invalid version or Network mismatch');
    } else {
      try {
        decodeBech32 = segwit.decode(address);
      } catch (err) {
      }
      if (decodeBech32 != null) {
        if (network.bech32 != decodeBech32.hrp)
          throw new ArgumentError('Invalid prefix or Network mismatch');
        if (decodeBech32.version != 0) throw new ArgumentError('Invalid address version');
        P2WPKH p2wpkh = new P2WPKH(data: new PaymentData(address: address), network: network);
        return p2wpkh.data.output!;
      }
    }
    throw new ArgumentError(address + ' has no matching Script');
  }
}
