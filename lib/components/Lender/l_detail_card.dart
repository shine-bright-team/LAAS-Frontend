import 'package:flutter/material.dart';

class LenderDetailCard extends StatefulWidget {
  final String id;
  final Color? cardColor;
  final String fName;
  final String lName;
  final String amount;

  const LenderDetailCard({
    super.key,
    required this.id,
    required this.cardColor,
    required this.fName,
    required this.lName,
    required this.amount,
  });

  @override
  State<LenderDetailCard> createState() => _LenderDetailCardState();
}

class _LenderDetailCardState extends State<LenderDetailCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => {
              // if (widget.edit == true) ...[
              //   Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //           builder: (context) => EditDebtScreen(
              //                 debtId: widget.id,
              //               ))
              //               ),
              //   // context.go("/detail/${widget.id}")
              // ] else
              //   ...[]
            },
        child: SizedBox(
          height: 190, //MediaQuery.of(context).size.width * 0.5, //190
          width: 360,
          child: Card(
            color: widget.cardColor, // Theme.of(context).colorScheme.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                  width: 200,
                                  child: RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text:
                                              "${widget.fName}\n${widget.lName}",
                                          style: const TextStyle(
                                            fontSize: 34,
                                            color: Colors.white,
                                            height: 1.0,
                                          ),
                                        ),
                                        // const WidgetSpan(
                                        //   child: Padding(
                                        //     padding: EdgeInsets.symmetric(
                                        //         horizontal: 15.0),
                                        //     child: Icon(Icons.edit,
                                        //         color: Colors.white),
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                  )),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          child: Text(
                            widget.amount, // Money amount
                            style: const TextStyle(
                                fontSize: 45, color: Colors.white, height: 1.0),
                          ),
                        ),
                        const SizedBox(
                          height: 10, // space divider
                        ),
                        const SizedBox(
                          child: Text(
                            "THB", // THB
                            style: TextStyle(
                                fontSize: 45, color: Colors.white, height: 1.0),
                          ),
                        ),
                      ],
                    ))
              ],
            ),
          ),
        ));
  }
}
