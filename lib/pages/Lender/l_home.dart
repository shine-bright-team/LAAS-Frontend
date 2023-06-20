//phon
import 'package:flutter/material.dart';
import 'package:laas/components/Lender/borrow_request_card.dart';
import 'package:laas/services/data/lone_contract/get_loan.dart';
import 'package:laas/services/data/userdata/get_borrow_request.dart';
import '../../components/Lender/lender_card.dart';

class LHome extends StatefulWidget {
  const LHome({super.key});

  @override
  State<LHome> createState() => _LHomeState();
}

class _LHomeState extends State<LHome> {
  List<BorrowReq>? urBorrowReq;
  List<ContractRes>? urBrContract;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _initCheck();
  }

  _initCheck() async {
    List<BorrowReq>? tempBrReq;
    List<ContractRes>? tempBrContract;

    try {
      tempBrReq = await getBorrowRequest();
      tempBrContract = await getContract();
    } catch (err) {
      rethrow;
    }

    if (mounted) {
      setState(() {
        urBorrowReq = tempBrReq;
        urBrContract = tempBrContract;
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!isLoading) {
      return Scaffold(
          appBar: AppBar(
            title: Text(
              "Home",
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
          ),
          body: SingleChildScrollView(
            child: Center(
                child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  const SizedBox(height: 20),
                  Text(
                    "Your borrowers",
                    style: TextStyle(
                        fontSize: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .fontSize,
                        color: Theme.of(context).colorScheme.primary),
                    textAlign: TextAlign.end,
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: 350,
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: urBrContract!.length,
                      itemBuilder: (context, index) {
                        return LenderCard(
                            uId: urBrContract![index].userId.toString(),
                            cId: urBrContract![index].borrowId.toString(),
                            fName: urBrContract![index].firstname,
                            lName: urBrContract![index].lastname,
                            date: urBrContract![index].dueDate,
                            amount: urBrContract![index].remainingAmount,
                            profileId: "1");
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Borrow requests",
                    style: TextStyle(
                        fontSize: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .fontSize,
                        color: Theme.of(context).colorScheme.primary),
                    textAlign: TextAlign.end,
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: 350,
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: urBorrowReq!.length,
                      itemBuilder: (context, index) {
                        return BrRequestCard(
                            uId: urBorrowReq![index].userId.toString(),
                            cId: urBorrowReq![index].borrowId.toString(),
                            fName: urBorrowReq![index].firstname,
                            lName: urBorrowReq![index].lastname,
                            amount: urBorrowReq![index].requestedAmount,
                            profileId: "1");
                      },
                    ),
                  ),
                ])),
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
