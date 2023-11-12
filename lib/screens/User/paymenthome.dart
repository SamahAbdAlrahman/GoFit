import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'ExcerciseClasses.dart';
Map<String, dynamic>? paymentIntent;

  Future<void> makePayment(String cost, Function() displayPaymentSheet1) async {
    WidgetsFlutterBinding.ensureInitialized();
    Stripe.publishableKey =
    "pk_test_51O9z3jHfy7wfxGln7lJoC675hORZlHw5SYJUdhKbjvCPOcTNfOqM5z656zzJw9GLPlV19Ju8hnrk4y4jPRuQYLHY00eT4H1mPg";

    try {
      paymentIntent = await createPaymentIntent('${cost}00', 'USD');

      var gpay = PaymentSheetGooglePay(merchantCountryCode: "US",
          currencyCode: "USD",
          testEnv: true);

      //STEP 2: Initialize Payment Sheet
      await Stripe.instance
          .initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
              paymentIntentClientSecret: paymentIntent![
              'client_secret'], //Gotten from payment intent
              style: ThemeMode.light,
              merchantDisplayName: 'Abhi',
              googlePay: gpay))
          .then((value) {});

      //STEP 3: Display Payment sheet
      displayPaymentSheet(displayPaymentSheet1);
    } catch (err) {
      print(err);
    }
  }

  displayPaymentSheet(Function() displayPaymentSheet1) async {
    try {
      await Stripe.instance.presentPaymentSheet().then((value) {
        print("Payment Successfully");
        displayPaymentSheet1();
      });
    } catch (e) {
      print('$e');
    }
  }

  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': amount,
        'currency': currency,
      };

      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization': 'Bearer sk_test_51O9z3jHfy7wfxGlncyd3XTwsDNLHOTwWaSctBLFLO2uMUJIYl5eT858IwQY6q6s5ZKJe3MAcs9qJDkYvqkuHz6BG00LYZLKMVI',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: body,
      );
      return json.decode(response.body);
    } catch (err) {
      throw Exception(err.toString());
    }
  }


