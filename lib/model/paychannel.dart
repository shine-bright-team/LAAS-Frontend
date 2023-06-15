class PayChannel {
  final String channel;
  final String number;

  const PayChannel({
    required this.channel,
    required this.number,
  });

  factory PayChannel.fromJson(Map json) {
    return PayChannel(
      channel: json['channel'],
      number: json['number'],
    );
  }
}
