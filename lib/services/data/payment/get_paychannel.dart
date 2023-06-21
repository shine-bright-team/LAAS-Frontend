import 'package:laas/model/paychannel.dart';

Future<List<PayChannel>> getPaych() async {
  List<PayChannel> mockPayChannels = [
    const PayChannel(
      channel: 'Bank Transfer',
      number: '1234567890',
    ),
    const PayChannel(
      channel: 'Promptpay',
      number: '0962200825',
    ),
    const PayChannel(
      channel: 'Bank Transfer',
      number: '1234567890',
    ),
    const PayChannel(
      channel: 'Bank Transfer',
      number: '1234567890',
    ),
    const PayChannel(
      channel: 'Bank Transfer',
      number: '1234567890',
    ),
    const PayChannel(
      channel: 'Promptpay',
      number: '0962200825',
    ),
  ];
  return mockPayChannels;
}
