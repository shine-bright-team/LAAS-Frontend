import 'package:flutter/material.dart';
import 'package:laas/services/data/transction/update_transaction.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class TransCard extends StatefulWidget {
  final String id;
  final String cId;
  final String name;
  final String circleColorState;
  final double amount;
  final String? reason;
  final String image;

  const TransCard({
    super.key,
    required this.id,
    required this.cId,
    required this.name,
    required this.image,
    required this.amount,
    // required this.done,
    required this.circleColorState,
    required this.reason,
    // this.isOpen = false,
  });

  @override
  State<TransCard> createState() => _TransCardState();
}

class _TransCardState extends State<TransCard> {
  String profileImage = '';
  String billImage = '';
  late String status;
  String? url = dotenv.env['BASE_URL'];
  late ValueNotifier<String> reason = ValueNotifier(widget.reason ?? "");

  @override
  void initState() {
    setstatus();
    super.initState();
  }

  void setstatus() {
    setState(() {
      status = widget.circleColorState;
    });
  }

  Future<void> _receiptAlert(
      BuildContext context, String bill, String id, String cId) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Receipt'),
          content: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              FadeInImage(
                placeholder: NetworkImage(
                  '$url/lender/debt/:debtId/:transactionId/image',
                  headers: {
                    "Authorization": "Bearer ${widget.image}",
                    "Access-Control-Allow-Origin": "*"
                  },
                ),
                image: NetworkImage(
                  '$url/lender/debt/:debtId/:transactionId/image',
                  headers: {
                    "Authorization": "Bearer ${widget.image}",
                    "Access-Control-Allow-Origin": "*"
                  },
                ),
              ),
              // Image.network(),
            ]),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.bodyLarge,
              ),
              child: const Text('Decline'),
              onPressed: () {
                _wrongAlert(context, id, cId).then((value) {
                  Navigator.of(context).pop();
                });
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Approve'),
              onPressed: () {
                updateTransaction(int.parse(widget.id), true, null).then(
                  (value) {
                    setState(() {
                      status = "SUCCESS";
                    });
                    Navigator.of(context).pop();
                  },
                );
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _wrongAlert(BuildContext context, String id, String cId) {
    final myController = TextEditingController();

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("What's wrong with this receipt?"),
          content: Container(
              alignment: Alignment.center,
              width: 100,
              height: 100,
              child: TextField(
                  controller: myController,
                  maxLength: 20,
                  decoration: const InputDecoration(
                      labelText: "Reasons",
                      contentPadding: EdgeInsets.all(20),
                      fillColor: Color.fromRGBO(0, 0, 0, 0.05),
                      filled: true))),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.bodyLarge,
              ),
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Send'),
              onPressed: () {
                reason.value = myController.text;
                updateTransaction(int.parse(widget.id), false, reason.value)
                    .then((value) {
                  setState(() {
                    status = "ERROR";
                  });
                });
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => {
              if (status == "PENDING") ...[
                _receiptAlert(context, billImage, widget.id, widget.cId)
              ]
              // else if (widget.circleColor ==
              //     Theme.of(context).colorScheme.error) ...[
              //   _wrongAlert(context)
              // ]
            },
        // onDoubleTap: () {
        //   if (widget.isOpen) context.push("/detail/${widget.dId}");
        // },
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Container(
            width: 358,
            height: 82,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).colorScheme.secondaryContainer,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 4,
                      offset: const Offset(1, 1),
                      color: Colors.grey.withOpacity(0.5))
                ]),
            child: Row(
              children: [
                Row(
                  children: [
                    const SizedBox(
                      width: 13,
                    ),
                    if (status != "SUCCESS") ...[
                      profileImage != ''
                          ? ClipOval(
                              child: SizedBox.fromSize(
                                size: const Size.fromRadius(30),
                                child: Image.network(
                                  profileImage,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )
                          : const CircleAvatar(
                              backgroundImage: AssetImage(
                                "assets/profile.jpeg",
                              ),
                              radius: 20,
                            )
                    ] else ...[
                      // fillColor: Color.fromRGBO(0, 0, 0, 0.05),
                      profileImage != ''
                          ? ClipOval(
                              child: SizedBox.fromSize(
                                size: const Size.fromRadius(30),
                                child: Image.network(
                                  profileImage,
                                  fit: BoxFit.cover,
                                  color: Colors.black.withOpacity(0.5),
                                  colorBlendMode: BlendMode.overlay,
                                ),
                              ),
                            )
                          : CircleAvatar(
                              backgroundColor: Colors.black.withOpacity(0.5),
                              foregroundColor: Colors.black.withOpacity(0.5),
                              child: const Icon(Icons.person))
                    ],
                    const SizedBox(
                      width: 13,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              widget.name,
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.fontSize,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              width: 13,
                            ),
                            if (status == "PENDING") ...[
                              ClipOval(
                                  child: Container(
                                color: Theme.of(context).colorScheme.primary,
                                width: 12,
                                height: 12,
                              )),
                            ] else if (status == "ERROR") ...[
                              ClipOval(
                                  child: Container(
                                color: Theme.of(context).colorScheme.error,
                                width: 12,
                                height: 12,
                              )),
                            ] else if (status == "SUCCESS")
                              ...[]
                          ],
                        ),
                        Row(
                          children: [
                            // Text(widget.reason ?? ""),
                            ValueListenableBuilder<String>(
                              valueListenable: reason,
                              builder: (context, value, child) {
                                return Text(
                                  value,
                                  style: TextStyle(
                                      fontSize: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.fontSize,
                                      color:
                                          Theme.of(context).colorScheme.error),
                                  maxLines: 1,
                                );
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.paid,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(widget.amount.toString(),
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .headlineMedium
                                  ?.fontSize)),
                      const SizedBox(
                        width: 13,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
