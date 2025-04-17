
  import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:aerosync/apis/sample.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

  Map<String, dynamic>? paymentIntentData;
  Future<void> makePayment(BuildContext context) async {
    try {
      paymentIntentData =
          await createPaymentIntent('20', 'USD'); //json.decode(response.body);
      // print('Response body==>${response.body.toString()}');
      await Stripe.instance
          .initPaymentSheet(
              paymentSheetParameters: SetupPaymentSheetParameters(
                  customFlow: true,
                  // setupIntentClientSecret:
                  //     'sk_test_51OESAJCRcroZFCiUWh6gKYUMDtMlouZZxnnqjSMpXDFU0XBUoKpEEP9ZiHe6C5P5F93Y1hQFjbvGZPt9jKhQx4SR00nmtSzjys',
                  paymentIntentClientSecret:
                      paymentIntentData!['client_secret'],
                  // applePay: PaymentSheetApplePay(
                  //   merchantCountryCode: "US",
                  // ),
                  //googlePay: true,
                  //testEnv: true,
                  googlePay: const PaymentSheetGooglePay(
                      merchantCountryCode: "US",
                      currencyCode: "USD",
                      testEnv: true),

                  // merchantCountryCode: 'US',
                  merchantDisplayName: 'Joseph'))
          .then((value) {});

      ///now finally display payment sheeet
      displayPaymentSheet(context);
    } catch (e, s) {
      print('Payment exception:$e$s');
    }
  }

  void displayPaymentSheet(BuildContext context) async {
    try {
      await Stripe.instance
          .presentPaymentSheet(
              //       parameters: PresentPaymentSheetParameters(
              // clientSecret: paymentIntentData!['client_secret'],
              // confirmPayment: true,
              // )
              )
          .then((newValue) async {
        print('payment intent${paymentIntentData!['id']}');
        print('payment intent${paymentIntentData!['client_secret']}');
        print('payment intent${paymentIntentData!['amount']}');
        log('payment intent$paymentIntentData');
        //orderPlaceApi(paymentIntentData!['id'].toString());

        
        QuickAlert.show(
          context: context,
          type: QuickAlertType.success,
          text: 'Transaction Completed Successfully!',
        );

        paymentIntentData = null;
      }).onError((error, stackTrace) {
        print('Exception/DISPLAYPAYMENTSHEET==> $error $stackTrace');
      });
    } on StripeException catch (e) {
      print('Exception/DISPLAYPAYMENTSHEET==> $e');
      
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const Sample()));
      QuickAlert.show(
        context: context,
        type: QuickAlertType.error,
        title: 'Oops...',
        text: 'Sorry, something went wrong',
      );
      showDialog(
          context: context,
          builder: (_) => const AlertDialog(
                content: Text("Cancelled "),
              ));
    } catch (e) {
      print('$e');
    }
  }

  //  Future<Map<String, dynamic>>
  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount('20'),
        'currency': currency,
        'payment_method_types[]': 'card',
      };
      if (kDebugMode) {
        print(body);
      }
      var response = await http.post(
          Uri.parse('https://api.stripe.com/v1/payment_intents'),
          body: body,
          headers: {
            'Authorization':
                'Bearer sk_test_51OESAJCRcroZFCiUWh6gKYUMDtMlouZZxnnqjSMpXDFU0XBUoKpEEP9ZiHe6C5P5F93Y1hQFjbvGZPt9jKhQx4SR00nmtSzjys',
            'Content-Type': 'application/x-www-form-urlencoded'
          });
      print('Create Intent reponse ===> ${response.body.toString()}');
      return jsonDecode(response.body);
    } catch (err) {
      print('err charging user: ${err.toString()}');
    }
  }

  calculateAmount(String amount) {
    final a = (int.parse(amount)) * 100;
    return a.toString();
  }

