import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:laas/services/data/transction/update_transaction.dart';

class TransCard extends StatefulWidget {
  final String id;
  final String cId;
  // final bool isOpen;
  final String name;
  final String circleColorState;
  final int amount;
  final String? reason;

  const TransCard({
    super.key,
    required this.id,
    required this.cId,
    required this.name,
    // required this.image,
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
  late ValueNotifier<String> reason = ValueNotifier(widget.reason ?? "");

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

  Future<void> _receiptAlert(
      BuildContext context, String bill, String id, String cId) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          // insetPadding:
          //     const EdgeInsets.only(top: 150, bottom: 150, left: 50, right: 50),
          title: const Text('Receipt'),
          content: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
                _wrongAlert(context, id, cId);
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Approve'),
              onPressed: () {
                // approveTransaction(transactionId: id, debtId: cId).then((value) {
                //   Navigator.of(context).pop();
                // }).onError((error, stackTrace) {
                //   showSnackBar(context, error.toString());
                // });
                updateTransaction(int.parse(widget.id), true, null);
                Navigator.of(context).pop();
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
                updateTransaction(int.parse(widget.id), false, reason.value);
                Navigator.pop(context);

                // declineTransaction(
                //         transactionId: id,
                //         debtId: cId,
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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => {
              if (widget.circleColorState == "PENDING") ...[
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
                    if (widget.circleColorState != "SUCCESS") ...[
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
                            if (widget.circleColorState == "PENDING") ...[
                              ClipOval(
                                  child: Container(
                                color: Theme.of(context).colorScheme.primary,
                                width: 12,
                                height: 12,
                              )),
                            ] else if (widget.circleColorState == "ERROR") ...[
                              ClipOval(
                                  child: Container(
                                color: Theme.of(context).colorScheme.error,
                                width: 12,
                                height: 12,
                              )),
                            ] else if (widget.circleColorState == "SUCCESS")
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
