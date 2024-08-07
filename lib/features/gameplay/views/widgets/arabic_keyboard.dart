import 'package:flutter/material.dart';
import 'package:wordle/features/gameplay/views/widgets/cust_button.dart';

class ArabicKeyboard extends StatelessWidget {
  final List<List<String>> keys = [
    ['ض', 'ص', 'ث', 'ق', 'ف', 'غ', 'ع', 'ه', 'خ', 'ح', 'ج',],
    ['ش', 'س', 'ي', 'ب', 'ل', 'ا', 'ت', 'ن', 'م', 'ك', 'ط'],
    ['ذ','ء', 'ؤ', 'ر', 'ى', 'ة', 'و', 'ز', 'ظ','د'],
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double keyHeight = (constraints.maxHeight - 100) /
            keys.length; // Adjust height based on screen size
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: keys.map((row) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: row.map((key) {
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4,vertical: 5),
                      child: CustButton(
                          func: () {
                            print(key);
                          },
                          text: key),
                    ),
                  );
                }).toList(),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
