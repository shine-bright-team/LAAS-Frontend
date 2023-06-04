class PayChannel {
  final int id;
  final int contractId;
  final String channel;
  final String number;

  const PayChannel({
    required this.id,
    required this.contractId,
    required this.channel,
    required this.number,
  });

  factory PayChannel.fromJson(Map json) {
    return PayChannel(
      id: json['id'],
      contractId: json['contractId'],
      channel: json['channel'],
      number: json['number'],
    );
  }
}
