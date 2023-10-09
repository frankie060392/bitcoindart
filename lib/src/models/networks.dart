class NetworkType {
  String messagePrefix;
  String? bech32;
  Bip32Type bip32;
  int pubKeyHash;
  int scriptHash;
  int wif;

  NetworkType(
      {required this.messagePrefix,
      this.bech32,
      required this.bip32,
      required this.pubKeyHash,
      required this.scriptHash,
      required this.wif});

  @override
  String toString() {
    return 'NetworkType{messagePrefix: $messagePrefix, bech32: $bech32, bip32: ${bip32.toString()}, pubKeyHash: $pubKeyHash, scriptHash: $scriptHash, wif: $wif}';
  }
}

class Bip32Type {
  int public;
  int private;

  Bip32Type({required this.public, required this.private});

  @override
  String toString() {
    return 'Bip32Type{public: $public, private: $private}';
  }
}

final bitcoin = NetworkType(
  messagePrefix: '\x18Bitcoin Signed Message:\n',
  bech32: 'bc',
  bip32: Bip32Type(public: 0x0488b21e, private: 0x0488ade4),
  pubKeyHash: 0x00,
  scriptHash: 0x05,
  wif: 0x80
);

final testnet = NetworkType(
  messagePrefix: '\x18Bitcoin Signed Message:\n',
  bech32: 'tb',
  bip32: Bip32Type(public: 0x043587cf, private: 0x04358394),
  pubKeyHash: 0x6f,
  scriptHash: 0xc4,
  wif: 0xef
);

final dogeTest = NetworkType(
  messagePrefix: '\x19Dogecoin Signed Message:\n',
  bech32: '',
  bip32: Bip32Type(public: 0x043587cf, private: 0x04358394),
  pubKeyHash: 0x71,
  scriptHash: 0xc4,
  wif: 0xf1,
);

final doge = NetworkType(
  messagePrefix: '\x19Dogecoin Signed Message:\n',
  bech32: '',
  bip32: Bip32Type(public: 0x02facafd, private: 0x02fac398),
  pubKeyHash: 0x1e,
  scriptHash: 0x16,
  wif: 0x9e,
);

final litecoin = NetworkType(
  messagePrefix: '\x19Litecoin Signed Message:\n',
  bech32: 'ltc',
  bip32: Bip32Type(public: 0x019da462, private: 0x019d9cfe),
  pubKeyHash: 0x30,
  scriptHash: 0x32,
  wif: 0xb0,
);

final litecoinTestnet = NetworkType(
  messagePrefix: '\x19Litecoin Signed Message:\n',
  bech32: 'tltc',
  bip32: Bip32Type(public: 0x043587cf, private: 0x04358394),
  pubKeyHash: 0x6f,
  scriptHash: 0xc4,
  wif: 0xef,
);

final bchMain = NetworkType(
  messagePrefix: '\x18Bitcoin Signed Message:\n',
  bech32: 'bitcoincash',
  bip32: Bip32Type(public: 0x0488b21e, private: 0x0488ade4),
  pubKeyHash: 0,
  scriptHash: 5,
  wif: 0x80,
);

final bchTest = NetworkType(
  messagePrefix: '\x18Bitcoin Signed Message:\n',
  bech32: 'bchtest',
  bip32: Bip32Type(public: 0x043587cf, private: 0x04358394),
  pubKeyHash: 0x6f,
  scriptHash: 0xc4,
  wif: 0xef,
);

final dash = NetworkType(
  messagePrefix: 'unused',
  bip32: Bip32Type(public: 0x0488b21e, private: 0x0488ade4),
  pubKeyHash: 0x4c,
  scriptHash: 0x10,
  wif: 0xcc,
);

final bsv = NetworkType(
  messagePrefix: 'unused',
  bip32: Bip32Type(public: 0x0488b21e, private: 0x0488ade4),
  pubKeyHash: 0x00,
  scriptHash: 0x05,
  wif: 0x80,
);

final xvg = NetworkType(
  messagePrefix: '\x18VERGE Signed Message:\n',
  bip32: Bip32Type(public: 0x0488b21e, private: 0x0488ade4),
  pubKeyHash: 0x1e,
  scriptHash: 0x21,
  wif: 0x9e,
);

final rvn = NetworkType(
  messagePrefix: '\x18Bitcoin Signed Message:\n',
  bech32: 'bc',
  bip32: Bip32Type(public: 0x0488b21e, private: 0x0488ade4),
  pubKeyHash: 60,
  scriptHash: 122,
  wif: 0x80,
);

final qtum = NetworkType(
  messagePrefix: '\x18Bitcoin Signed Message:\n',
  bech32: 'bc',
  bip32: Bip32Type(public: 0x0488b21e, private: 0x0488ade4),
  pubKeyHash: 58,
  scriptHash: 50,
  wif: 0x80,
);

final none = NetworkType(
  messagePrefix: '\x18Bitcoin Signed Message:\n',
  bech32: 'none',
  bip32: Bip32Type(public: 0, private: 0),
  pubKeyHash: 0,
  scriptHash: 0,
  wif: 0x80,
);

var bnb = NetworkType(
  messagePrefix: '\x18Binancecoin Signed Message:\n',
  bech32: 'bnb',
  bip32: Bip32Type(public: 0x0488b21e, private: 0x0488ade4),
  pubKeyHash: 0x00,
  scriptHash: 0x05,
  wif: 0x80,
);

var eth = NetworkType(
  messagePrefix: 'unused',
  bech32: 'bc',
  bip32: Bip32Type(public: 0x0488b21e, private: 0x0488ade4),
  pubKeyHash: 0x00,
  scriptHash: 0x05,
  wif: 0x80,
);
