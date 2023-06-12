//phon
import 'package:flutter/material.dart';
import 'package:laas/components/Lender/l_detail_card.dart';
import 'package:laas/components/Lender/transactions_card.dart';

class LLoanStatus extends StatefulWidget {
  const LLoanStatus({super.key});

  @override
  State<LLoanStatus> createState() => _LLoanStatusState();
}

class _LLoanStatusState extends State<LLoanStatus> {
  // late DateTime _date;

  void initData() {
    // _date = DateTime.fromMillisecondsSinceEpoch(widget.debt.due.seconds * 1000);

    // for (var e in widget.debt.transactions) {
    //   print("id: ${e.username} amount: ${e.amount}");
    // }
  }

  @override
  void initState() {
    super.initState();
    initData();
  }

  // totalPaidTransactions() {
  //   double total = 0;

  //   for (var e in widget.debt.transactions) {
  //     // print(widget.debt.transactions);
  //     // print(widget.debt.transactions.map((e) => {e.amount, e.isApproved}));
  //     if (e.isApproved == "success") {
  //       total += e.amount;
  //     }
  //   }
  //   return total;
  // }

  // createPayerCard() {
  //   if (widget.debt.transactions.isNotEmpty) {
  //     // for (var e in widget.debt.transactions) {
  //     return widget.debt.transactions
  //         .map((e) => Padding(
  //               padding: const EdgeInsets.all(8.0),
  //               child: PayerCard(
  //                 tId: e.transactionId,
  //                 dId: widget.debt.debtId,
  //                 name: e.username,
  //                 // image: e.username,
  //                 amount: e.amount,
  //                 circleColorState: e.isApproved,
  //                 reason: e.errMessage,
  //               ),
  //             ))
  //         .toList();
  //     // }
  //   } else {
  //     return const [Text('')];
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Loan Status",
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
                child: Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  LenderDetailCard(
                      id: "", //widget.debt.debtId,
                      cardColor: Theme.of(context).colorScheme.primary,
                      name: "Test", //widget.debt.debtName,
                      amount: "100", //widget.debt.debtTotal.toString(),
                      edit: true),
                  const SizedBox(
                    height: 23,
                  ),
                  Row(
                    // Date, number of people
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        // Date
                        width: 265,
                        height: 78,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Theme.of(context)
                                .colorScheme
                                .secondaryContainer,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 4,
                                  offset: const Offset(1, 1),
                                  color: Colors.grey.withOpacity(0.5))
                            ]),
                        alignment: Alignment.center,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 23),
                                child: Icon(Icons.alarm,
                                    size: 24,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimaryContainer),
                              ),
                              const SizedBox(
                                width: 13,
                              ),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                        // Date Text
                                        text: "Tue, Feburary 2023",
                                        // "${_date.day}/${_date.month}/${_date.year}", //"Tue, Feburary 2023",
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onPrimaryContainer,
                                            fontSize: Theme.of(context)
                                                .textTheme
                                                .headlineSmall
                                                ?.fontSize)),
                                  ],
                                ),
                              ),
                            ]),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        // number of people
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Theme.of(context)
                                .colorScheme
                                .secondaryContainer,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 4,
                                  offset: const Offset(1, 1),
                                  color: Colors.grey.withOpacity(0.5))
                            ]),
                        alignment: Alignment.center,
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              WidgetSpan(
                                child: Icon(Icons.group_add_outlined,
                                    size: 24,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimaryContainer),
                              ),
                              TextSpan(
                                  text:
                                      "3", //widget.debt.borrowersUserId.length.toString(),
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimaryContainer,
                                      fontSize: Theme.of(context)
                                          .textTheme
                                          .headlineSmall
                                          ?.fontSize)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  Row(
                    // Paid, Unpaid
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        // Paid
                        width: 170,
                        height: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Theme.of(context)
                                .colorScheme
                                .secondaryContainer,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 4,
                                  offset: const Offset(1, 1),
                                  color: Colors.grey.withOpacity(0.5))
                            ]),
                        alignment: Alignment.center,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 23),
                                child: Icon(Icons.check_circle,
                                    size: 24,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimaryContainer),
                              ),
                              const SizedBox(
                                width: 13,
                              ),
                              RichText(
                                // textAlign: TextAlign.center,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                        text: "25",
                                        //totalPaidTransactions().toString(),
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onPrimaryContainer,
                                            fontSize: Theme.of(context)
                                                .textTheme
                                                .headlineSmall
                                                ?.fontSize)),
                                  ],
                                ),
                              ),
                            ]),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Container(
                        // Un-Paid
                        width: 170,
                        height: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Theme.of(context)
                                .colorScheme
                                .secondaryContainer,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 4,
                                  offset: const Offset(1, 1),
                                  color: Colors.grey.withOpacity(0.5))
                            ]),
                        alignment: Alignment.center,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 23),
                                child: Icon(Icons.hourglass_top,
                                    size: 24,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimaryContainer),
                              ),
                              const SizedBox(
                                width: 13,
                              ),
                              RichText(
                                // textAlign: TextAlign.center,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                        text: "50",
                                        // text: (widget.debt.transactions)
                                        //     .where((e) =>
                                        //         e.isApproved == "pending")
                                        //     .map((e) => e.amount)
                                        //     .fold(
                                        //         0.0,
                                        //         (value, element) =>
                                        //             value + element)
                                        //     .toStringAsFixed(2),
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onPrimaryContainer,
                                            fontSize: Theme.of(context)
                                                .textTheme
                                                .headlineSmall
                                                ?.fontSize)),
                                  ],
                                ),
                              ),
                            ]),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      "Transactions",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize:
                            Theme.of(context).textTheme.displaySmall?.fontSize,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Column(
                    children: [
                      TransCard(
                          name: "Thamolwan",
                          amount: 50,
                          circleColorState: "pending",
                          tId: "",
                          dId: "",
                          reason: ""),
                      TransCard(
                          name: "Thanaphon",
                          amount: 50,
                          circleColorState: "error",
                          tId: "",
                          dId: "",
                          reason: ""),
                      TransCard(
                          name: "Bob",
                          amount: 50,
                          circleColorState: "success",
                          tId: "",
                          dId: "",
                          reason: ""),
                      SizedBox(height: 100)
                    ],
                  ),
                ],
              ),
            )),
          ],
        ));
  }
}
