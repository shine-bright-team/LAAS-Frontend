//FXH
import 'package:flutter/material.dart';
import 'package:laas/components/Lender/header.dart';
import 'package:laas/components/Lender/review.dart';
import 'package:laas/components/Lender/debt_analysis.dart';
import 'package:laas/components/Lender/signature_pad.dart';
import 'package:laas/services/data/lone_contract/get_loan_req.dart';

class LApprove extends StatefulWidget {
  final String contractId;
  const LApprove({super.key, this.contractId = ""});

  @override
  State<LApprove> createState() => _LApproveState();
}

class _LApproveState extends State<LApprove> {
  late final ApproveDetail? data;
  bool isLoading = false;
  @override
  void initState() {
    _getdata();
    super.initState();
  }

  Future<void> _getdata() async {
    isLoading = true;
    try {
      await getDetailReq(widget.contractId).then((value) {
        data = value;
      });
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }

      return;
    } catch (err) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!isLoading) {
      return Scaffold(
          appBar: AppBar(
            title: Text(
              "Profile",
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                header(context, data!.firstname, data!.lastname, false,
                    "${data!.requestedAmount}"),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    children: [
                      review(context),
                      const SizedBox(
                        height: 30,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Transaction History",
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.onSurface,
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .fontSize),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          debtAnalysisBox(context, "${data!.debtAnalysis.paid}",
                              "${data!.debtAnalysis.unpaid}"),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    children: [
                      approveButton(context, widget.contractId),
                      const SizedBox(
                        height: 17,
                      ),
                      declineButton(context),
                    ],
                  ),
                )
              ],
            ),
          ));
    } else {
      return Scaffold(
          appBar: AppBar(
            title: Text(
              "Home",
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

Widget approveButton(BuildContext context, String contractId) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      minimumSize: const Size.fromHeight(50),
      backgroundColor: Theme.of(context).colorScheme.primary,
    ),
    onPressed: () {
      try {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return SignaturePad(contractId: contractId);
        }));
      } catch (err) {
        rethrow;
      }
    },
    child: Text(
      "Approve",
      style: TextStyle(
          color: Theme.of(context).colorScheme.onPrimary,
          fontWeight: FontWeight.bold,
          fontSize: Theme.of(context).textTheme.titleMedium!.fontSize),
    ),
  );
}

Widget declineButton(BuildContext context) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      minimumSize: const Size.fromHeight(50),
      backgroundColor: Theme.of(context).colorScheme.surface,
    ),
    onPressed: () {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('decline successfully')),
      );
    },
    child: Text(
      "Decline",
      style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.bold,
          fontSize: Theme.of(context).textTheme.titleMedium!.fontSize),
    ),
  );
}
