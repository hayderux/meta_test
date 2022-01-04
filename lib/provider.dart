//

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web3/ethereum.dart';

final metaProvider =
    ChangeNotifierProvider<MetaNotifier>((ref) => MetaNotifier());

class MetaNotifier with ChangeNotifier {
  var currentChain = -1;
  static const operatingChain = 4;

  String? currentAddress;
  bool get isEnabled => ethereum != null;

  bool get isConnected => currentAddress != null && isEnabled;
  bool get isChainWork => currentChain == operatingChain;

  ///
  Future<void> connect() async {
    final accs = await ethereum!.requestAccount();
    if (accs.isNotEmpty) {
      print(currentAddress);
      currentAddress = accs.first;
    }

    currentChain = await ethereum!.getChainId();
    notifyListeners();
  }
}
