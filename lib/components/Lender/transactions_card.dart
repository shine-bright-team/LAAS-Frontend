import 'package:flutter/material.dart';

class TransCard extends StatefulWidget {
  final bool isOpen;
  final String name;
  final String tId;
  final String dId;
  final String circleColorState;
  final double amount;
  final String? reason;

  const TransCard({
    Key? key,
    required this.name,
    // required this.image,
    required this.amount,
    // required this.done,
    required this.circleColorState,
    required this.tId,
    required this.dId,
    required this.reason,
    this.isOpen = false,
  }) : super(key: key);

  @override
  State<TransCard> createState() => _TransCardState();
}

class _TransCardState extends State<TransCard> {
  String profileImage = '';
  String billImage = '';
// String reason = '';

  // @override
  // void initState() {
  //   _getprofile();
  //   _getbill();
  //   // print(widget.name);
  //   // print(widget.circleColorState);
  //   // print(widget.dId);
  //   // print(widget.amount);
  //   // print(widget.tId);
  //   // print(_getbill());
  //   // print(_getbill());
  //   super.initState();
  // }

  // _getprofile() {
  //   picFrinedbyusername(widget.name).then((value) => setState(() {
  //         profileImage = value;
  //       }));
  // }

  // _getbill() {
  //   getBill(widget.tId).then((value) => setState(() {
  //         billImage = value;
  //       }));
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => {
              if (widget.circleColorState == "pending") ...[
                _receiptAlert(context, billImage, widget.tId, widget.dId)
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
                    if (widget.circleColorState != "success") ...[
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
                          : const CircleAvatar(child: Icon(Icons.person))
                    ] else ...[
                      // fillColor: Color.fromRGBO(0, 0, 0, 0.05),

                      ClipOval(
                        child: SizedBox.fromSize(
                          size: const Size.fromRadius(30),
                          child: Image.network(
                            profileImage,
                            fit: BoxFit.cover,
                            color: Colors.black.withOpacity(0.5),
                            colorBlendMode: BlendMode.overlay,
                          ),
                        ),
                      ),
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
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onPrimaryContainer,
                                  fontSize: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.fontSize),
                            ),
                            const SizedBox(
                              width: 13,
                            ),
                            if (widget.circleColorState == "pending") ...[
                              ClipOval(
                                  child: Container(
                                color: Theme.of(context).colorScheme.primary,
                                width: 12,
                                height: 12,
                              )),
                            ] else if (widget.circleColorState == "error") ...[
                              ClipOval(
                                  child: Container(
                                color: Theme.of(context).colorScheme.error,
                                width: 12,
                                height: 12,
                              )),
                            ] else if (widget.circleColorState == "success")
                              ...[]
                          ],
                        ),
                        Row(
                          children: [
                            if (widget.reason == '') ...[
                              // const Text("")
                            ] else ...[
                              Text(
                                widget.reason!,
                                style: TextStyle(
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.fontSize,
                                    color: Theme.of(context).colorScheme.error),
                                maxLines: 1,
                              ),
                            ]
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
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(widget.amount.toString(),
                          style: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer,
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

Future<void> _receiptAlert(
    BuildContext context, String bill, String tId, String dId) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        // insetPadding:
        //     const EdgeInsets.only(top: 150, bottom: 150, left: 50, right: 50),
        title: const Text('Receipt'),
        content: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            // Test image
            Image.asset('assets/ri.jpeg'),

            // Image.network(
            //   bill,
            // ),
          ]),
        ),

        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.bodyLarge,
            ),
            child: const Text('Decline'),
            onPressed: () {
              Navigator.of(context).pop();
              _wrongAlert(context, tId, dId);
            },
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Approve'),
            onPressed: () {
              // approveTransaction(transactionId: tId, debtId: dId).then((value) {
              //   Navigator.of(context).pop();
              // }).onError((error, stackTrace) {
              //   showSnackBar(context, error.toString());
              // });
            },
          ),
        ],
      );
    },
  );
}

Future<void> _wrongAlert(BuildContext context, String tId, String dId) {
  final myController = TextEditingController();

  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        // insetPadding:
        //     const EdgeInsets.only(top: 150, bottom: 150, left: 50, right: 50),
        title: const Text("What's wrong with this receipt?"),
        content: Container(
            alignment: Alignment.center,
            width: 300,
            height: 500,
            child: TextField(
                controller: myController,
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
              // print(myController.text);
              // declineTransaction(
              //         transactionId: tId,
              //         debtId: dId,
              //         reason: myController.text)
              //     .then((value) {
              //   Navigator.of(context).pop();
              // }).onError((error, stackTrace) {
              //   showSnackBar(context, error.toString());
              // });
            },
          ),
        ],
      );
    },
  );
}
