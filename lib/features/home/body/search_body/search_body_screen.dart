import 'package:flutter/material.dart';
import 'package:sweet_candy/shared/colors.dart';
import 'package:sweet_candy/shared/height.dart';
import 'package:sweet_candy/shared/widgets/default_form_field.dart';
import 'package:sweet_candy/shared/widgets/hint_text.dart';

import '../../../../generated/l10n.dart';

class SearchBodyScreen extends StatelessWidget {
   SearchBodyScreen({super.key});
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          defaultTextFormField(controller: searchController, textInputType: TextInputType.text,prefix: const Icon(Icons.search),color: mainBlack),
          SizedBox(height: fullHeight(context: context)/3,),
          HintText(text: S.of(context).enter_your_product_name),
        ],
      ),
    );
  }
}