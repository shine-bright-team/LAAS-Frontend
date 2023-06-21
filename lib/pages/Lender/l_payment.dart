//fxh
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:laas/components/Lender/payment/payment_upload.dart';
import 'package:laas/components/gen_qr.dart';
import 'package:laas/model/paychannel.dart';
import 'package:laas/services/data/lone_contract/get_detail.dart';
import 'package:laas/services/data/payment/get_paychannel_by_contract.dart';

class LPaymentScreen extends StatefulWidget {
  final String contractId;
  const LPaymentScreen({super.key, this.contractId = ""});

  @override
  State<LPaymentScreen> createState() => _LPaymentScreenState();
}

class _LPaymentScreenState extends State<LPaymentScreen> {
  late final double amounts;
  late final PayChannel check;
  XFile? imagefile;
  final ImagePicker _picker = ImagePicker();
  bool loading = true;
  @override
  void initState() {
    _initcheck();
    super.initState();
  }

  _getFromGallery() async {
    XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        imagefile = pickedFile;
        showModalBottomSheet<void>(
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            context: context,
            builder: (context) {
              return Wrap(
                children: [
                  BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                      child: Paymentuploadsheet(
                        imagefile: imagefile,
                        deptId: widget.contractId,
                        amount: amounts,
                      )),
                ],
              );
            });
      });
    }
  }

  _initcheck() async {
    setState(() {
      loading = true;
    });
    await getDetail(widget.contractId)
        .then((value) => amounts = value!.detail.requestedAmount);

    await getPaymentByUser(int.parse(widget.contractId))
        .then((value) => check = value!);

    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!loading) {
      return Scaffold(
          appBar: AppBar(
            title: Text(
              "Payment",
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
          ),
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Container(
                  constraints: BoxConstraints(
                      minHeight: MediaQuery.of(context).size.height - 55),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      check.channel == "Promptpay"
                          ? Payqr(
                              amount: amounts,
                              promptPay: check.number,
                            )
                          : Paybank(
                              amount: amounts,
                              bank: check.number,
                            )
                      // : Paydetail(
                      //     amount: amounts,
                      //     promptPay: check!.promptPay,
                      //     bank: check!.bank,
                      //   ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: FilledButton(
                    onPressed: () {
                      _getFromGallery();
                    },
                    style: FilledButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                      padding: const EdgeInsets.all(10.00),
                    ),
                    child: const Text('Upload Payment '),
                  ),
                ),
              ),
            ],
          ));
    } else {
      return Scaffold(
          appBar: AppBar(
            title: Text(
              "Payment",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.secondaryContainer),
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

class Payqr extends StatelessWidget {
  const Payqr({super.key, required this.amount, required this.promptPay});
  final double amount;
  final String? promptPay;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 16),
        padding: const EdgeInsets.symmetric(horizontal: 8),
        constraints: const BoxConstraints(maxWidth: 350),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(19),
          color:
              Theme.of(context).colorScheme.secondaryContainer.withOpacity(0.6),
        ),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                // textDirection: TextDirection.ltr,
                "Scan this QR",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize:
                        Theme.of(context).textTheme.headlineLarge!.fontSize),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: Align(
                alignment: Alignment.center,
                child: QRCodeGenerate(
                  promptPayId: promptPay!,
                  amount: amount,
                )),
          ),
        ]),
      ),
    );
  }
}

class Paybank extends StatelessWidget {
  const Paybank({super.key, required this.amount, required this.bank});
  final double amount;
  final String? bank;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 16),
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              constraints: const BoxConstraints(maxWidth: 576),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(19),
                color: Theme.of(context)
                    .colorScheme
                    .secondaryContainer
                    .withOpacity(0.6),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      bank!,
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 48, bottom: 42, right: 48, top: 0),
                    child: Text(
                      bank!,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .fontSize),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 24),
              constraints: const BoxConstraints(maxWidth: 576),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(19),
                color: Theme.of(context)
                    .colorScheme
                    .secondaryContainer
                    .withOpacity(0.6),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Amount',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .fontSize),
                    ),
                    Text(
                      amount.toString(),
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .fontSize),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
