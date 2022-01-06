//

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wallet_connect/wallet_connect.dart';

final metaProvider =
    ChangeNotifierProvider<MetaNotifier>((ref) => MetaNotifier());

class MetaNotifier with ChangeNotifier {
  bool isConnected = false;
  void onConnect() {
    isConnected = true;
    notifyListeners();
  }

  final WCSession session = WCSession.from(
      'wc:8a5e5bdc-a0e4-4702-ba63-8f1a5655744f@1?bridge=https%3A%2F%2Fbridge.walletconnect.org&key=4009c510f5ae6cbc12e7f80d682f96d7');

  ///

  Future<void> connect() async {
    var wcClient = WCClient(
      onConnect: () {
        // Respond to connect callback
        onConnect();
      },
      onDisconnect: (code, reason) {
        // Respond to disconnect callback
      },
      onFailure: (error) {
        // Respond to connection failure callback
      },
      onSessionRequest: (id, peerMeta) {
        print('es');
        // Respond to connection request callback
      },
      onEthSign: (id, message) {
        // Respond to personal_sign or eth_sign or eth_signTypedData request callback
      },
      onEthSendTransaction: (id, tx) {
        // Respond to eth_sendTransaction request callback
      },
      onEthSignTransaction: (id, tx) {
        // Respond to eth_signTransaction request callback
      },
    );
    final peerMeta = WCPeerMeta(
      name: 'Example Wallet',
      url: 'https://example.wallet',
      description: 'Example Wallet',
      icons: [],
    );
    var _url =
        "metamask://wc?uri=wc:00e46b69-d0cc-4b3e-b6a2-cee442f97188@1?bridge=https%3A%2F%2Fbridge.walletconnect.org&key=91303dedf64285cbbaf9120f6e9d160a5c8aa3deb67017a3874cd272323f48ae";

    if (!await launch(_url, forceSafariVC: false)) {
      if (!await launch(_url)) {
        throw 'Could not launch $_url';
      }
    }
  }
}
