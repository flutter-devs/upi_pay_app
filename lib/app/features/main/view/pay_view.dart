import 'package:flutter/material.dart';
import 'package:upi_pay_app/app/features/main/view/main_view.dart';

class PayView extends StatelessWidget {
  const PayView({Key? key}) : super(key: key);

  static const routeName = '/pay';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => const MainView()));
                },
                style: ButtonStyle(
                  fixedSize:
                  MaterialStateProperty.all(const Size.fromHeight(42)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          50), // Adjust the radius as needed
                    ),
                  ),
                ),
                child: const Text('Start payment'),
              ),
          ),
        ],
      ),
    );
  }
}
