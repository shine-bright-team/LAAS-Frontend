import 'package:laas/model/paychannel.dart';

Future<List<PayChannel>> getPaych() async {
  List<PayChannel> mockPayChannels = [
    const PayChannel(
      id: 1,
      contractId: 1,
      channel: 'Bank Transfer',
      number: '1234567890',
    ),
    const PayChannel(
      id: 2,
      contractId: 1,
      channel: 'PromPay',
      number: '0962200825',
    ),
    const PayChannel(
      id: 3,
      contractId: 2,
      channel: 'Bank Transfer',
      number: '1234567890',
    ),
    const PayChannel(
      id: 4,
      contractId: 3,
      channel: 'Bank Transfer',
      number: '1234567890',
    ),
    const PayChannel(
      id: 5,
      contractId: 4,
      channel: 'Bank Transfer',
      number: '1234567890',
    ),
    const PayChannel(
      id: 6,
      contractId: 4,
      channel: 'PromPay',
      number: '0962200825',
    ),
  ];
  return mockPayChannels;
}
