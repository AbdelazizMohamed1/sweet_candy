import 'package:flutter/material.dart';
import 'package:sweet_candy/shared/text.dart';
import 'package:sweet_candy/shared/width.dart';

import '../../generated/l10n.dart';
import '../../shared/widgets/back_arrow_text_icon.dart';

class CheckOutScreen extends StatefulWidget {
   CheckOutScreen({super.key});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
   List<Map<String, String>> dataFromApi = [
     {"date": "2024-08-25", "document": "Doc1", "debtor": "150", "creditor": "50", "balance": "100"},
     {"date": "2024-08-26", "document": "Doc2", "debtor": "200", "creditor": "100", "balance": "100"},
     {"date": "2024-08-27", "document": "Doc3", "debtor": "250", "creditor": "50", "balance": "200"},
   ];

   double totalDebtor = 0;

   double totalCreditor = 0;

   double totalBalance = 0;

   @override
   void initState() {
     super.initState();
     calculateTotals();
   }
   void calculateTotals() {
     totalDebtor = dataFromApi.fold(0, (sum, item) => sum + double.tryParse(item["debtor"] ?? "0")!);
     totalCreditor = dataFromApi.fold(0, (sum, item) => sum + double.tryParse(item["creditor"] ?? "0")!);
     totalBalance = dataFromApi.fold(0, (sum, item) => sum + double.tryParse(item["balance"] ?? "0")!);
   }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            BackArrowTextIcon(
                text: S.of(context).thank_you,
                hasIcon: false,
                hasText: true,
                hasArrow: true),
            Column(
              children: [
                Text(S.of(context).checkout_successful,style: text24W400(context),),
                Container(
                  margin: EdgeInsets.all(20),
                  width: fullWidth(context: context),
                  child: Table(
                    border: TableBorder.all(),
                    children: [
                      TableRow(
                        decoration: BoxDecoration(color: Colors.grey[300]),
                        children: [
                          Container(
                            height: 60, // ارتفاع الخلية
                            alignment: Alignment.center,
                            child: Text(S.of(context).date, style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
                          ),
                          Container(
                            height: 60,
                            alignment: Alignment.center,
                            child: Text(S.of(context).document, style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
                          ),
                          Container(
                            height: 60,
                            alignment: Alignment.center,
                            child: Text(S.of(context).debtor, style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
                          ),
                          Container(
                            height: 60,
                            alignment: Alignment.center,
                            child: Text(S.of(context).creditor, style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
                          ),
                          Container(
                            height: 60,
                            alignment: Alignment.center,
                            child: Text(S.of(context).balance, style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                      ...dataFromApi.map((row) {
                        return TableRow(
                          children: [
                            Container(
                              height: 60,
                              alignment: Alignment.center,
                              child: Text(row["date"]!),
                            ),
                            Container(
                              height: 60,
                              alignment: Alignment.center,
                              child: Text(row["document"]!),
                            ),
                            Container(
                              height: 60,
                              alignment: Alignment.center,
                              child: Text(row["debtor"]!),
                            ),
                            Container(
                              height: 60,
                              alignment: Alignment.center,
                              child: Text(row["creditor"]!),
                            ),
                            Container(
                              height: 60,
                              alignment: Alignment.center,
                              child: Text(row["balance"]!),
                            ),
                          ],
                        );
                      }).toList(),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Column(

                    children: [
                      Text(
                        'Total Debtor: $totalDebtor',
                        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Total Creditor: $totalCreditor',
                        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Total Balance: $totalBalance',
                        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
            )
        ),

    );
  }
}
