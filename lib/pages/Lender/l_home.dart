//phon
import 'package:flutter/material.dart';
import 'package:laas/components/Lender/borrow_request_card.dart';
import 'package:laas/model/contract.dart';
import 'package:laas/services/data/lone_contract/get_loan.dart';
import 'package:laas/services/data/userdata/get_borrower.dart';
import '../../components/Lender/lender_card.dart';
import '../../model/user_model.dart';

class LHome extends StatefulWidget {
  const LHome({super.key});

  @override
  State<LHome> createState() => _LHomeState();
}

class _LHomeState extends State<LHome> {
  List<User> urBorrowers = [];
  List<Contract> urBrContract = [];
  @override
  void initState() {
    _getYourBorrowers();
    super.initState();
  }

  _getYourBorrowers() async {
    urBorrowers = await getBorrower();
    urBrContract = await getContract();

    setState(() {
      urBorrowers;
      urBrContract;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                      fontSize:
                          Theme.of(context).textTheme.headlineMedium!.fontSize,
                      color: Theme.of(context).colorScheme.primary),
                  textAlign: TextAlign.end,
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: 350,
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: urBorrowers.length,
                    itemBuilder: (context, index) {
                      return LenderCard(
                          uId: urBorrowers[index].id.toString(),
                          cId: urBrContract[index].id.toString(),
                          fName: urBorrowers[index].firstname,
                          lName: urBorrowers[index].lastname,
                          date: urBrContract[index].dueAt,
                          amount: urBrContract[index].loanAmount,
                          profileId: "1");
                    },
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Borrow requests",
                  style: TextStyle(
                      fontSize:
                          Theme.of(context).textTheme.headlineMedium!.fontSize,
                      color: Theme.of(context).colorScheme.primary),
                  textAlign: TextAlign.end,
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: 350,
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: urBorrowers.length,
                    itemBuilder: (context, index) {
                      return BrRequestCard(
                          uId: urBorrowers[index].id.toString(),
                          cId: urBrContract[index].id.toString(),
                          fName: urBorrowers[index].firstname,
                          lName: urBorrowers[index].lastname,
                          amount: urBrContract[index].loanAmount,
                          profileId: "1");
                    },
                  ),
                ),
              ])),
        ));
  }
}
