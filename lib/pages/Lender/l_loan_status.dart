//phon
// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:laas/components/Lender/l_detail_card.dart';
import 'package:laas/components/Lender/transactions_card.dart';
import 'package:laas/services/data/lone_contract/get_detail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LLoanStatus extends StatefulWidget {
  final String contractId;

  const LLoanStatus({super.key, required this.contractId});

  @override
  State<LLoanStatus> createState() => _LLoanStatusState();
}

class _LLoanStatusState extends State<LLoanStatus> {
  // late DateTime _date;
  String? formattedDate;
  DetailLone? data;
  late String token;
  Detail? contract;
  List<Transactions?>? trans;
  double totalPaid = 0;
  double totalUnPaid = 0;
  bool isLoading = true;

  @override
  void initState() {
    _getbar();
    _getData();
    super.initState();
  }

  Future<void> _getData() async {
    data = (await getDetail(widget.contractId))!;
    contract = data!.detail;
    formattedDate = DateFormat.yMMMd().format(contract!.dueDate);
    trans = data!.transactions;
    double loanAmount = contract?.requestedAmount ?? 0;
    addTotalPaid();
    totalUnPaid = loanAmount - totalPaid;
    if (mounted) {
      setState(() {
        contract;
        trans;
        isLoading = false;
      });
    }
  }

  _getbar() async {
    final value = await SharedPreferences.getInstance();
    final String bar = value.getString('token') ?? "";
    setState(() {
      token = bar;
    });
  }

  createTransCard() {
    return trans!
        .map((e) => TransCard(
            id: e!.id.toString(),
            cId: contract?.borrowId.toString() ?? "",
            name: contract?.firstname ?? "",
            amount: e.paidAmount,
            circleColorState: e.status,
            reason: e.errMessage,
            image: token))
        .toList();
  }

  addTotalPaid() {
    trans!.where((e) => e!.status == "SUCCESS").map((e) => e!.paidAmount).fold(
        0.0, (previousValue, element) => totalPaid = previousValue + element);
  }

  // totalPaidTransactions() {
  //   double total = 0;

  //   for (var e in trans!) {
  //     if (e!.isApproved == "success") {
  //       total += e.paidAmount;
  //     }
  //   }
  //   return total;
  // }

  @override
  Widget build(BuildContext context) {
    if (!isLoading) {
      return RefreshIndicator(
        onRefresh: _getData,
        child: Scaffold(
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
                        id: widget.contractId,
                        cardColor: Theme.of(context).colorScheme.primary,
                        fName: contract!.firstname, //urBrInfo.firstname,
                        lName: contract!.lastname, //urBrInfo.lastname,
                        amount: contract!.requestedAmount.toString(),
                      ),
                      const SizedBox(
                        height: 23,
                      ),
                      Row(
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
                                            .primary),
                                  ),
                                  const SizedBox(
                                    width: 13,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                            // Date Text
                                            text: formattedDate,
                                            // "${_date.day}/${_date.month}/${_date.year}",
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary,
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
                              child: const CircleAvatar(
                                radius: 30,
                                backgroundImage:
                                    AssetImage('assets/profile.jpeg'),
                              )),
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
                                            .primary),
                                  ),
                                  const SizedBox(
                                    width: 13,
                                  ),
                                  RichText(
                                    // textAlign: TextAlign.center,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                            text: totalPaid.toString(),
                                            //totalPaidTransactions().toString(),
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary,
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
                                            .primary),
                                  ),
                                  const SizedBox(
                                    width: 13,
                                  ),
                                  RichText(
                                    // textAlign: TextAlign.center,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                            text: totalUnPaid.toString(),
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
                                                    .primary,
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
                            fontSize: Theme.of(context)
                                .textTheme
                                .displaySmall
                                ?.fontSize,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Column(
                        children: [
                          ...createTransCard(),
                          const SizedBox(height: 100)
                        ],
                      ),
                    ],
                  ),
                )),
              ],
            )),
      );
    } else {
      return Scaffold(
          appBar: AppBar(
            title: Text(
              "Status",
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
          ),
          body: Stack(children: [
            SingleChildScrollView(
                child: Container(
              alignment: Alignment.center,
              constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height - 55),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [Center(child: Text('Loading...'))],
              ),
            ))
          ]));
    }
  }
}
