import 'package:flutter/material.dart';

import '../../../../../shared/colors.dart';
import '../../../../../shared/widgets/default_form_field.dart';

class ListContainer extends StatefulWidget {
  ListContainer({super.key, required this.controller,this.onTap, required this.text});
  final TextEditingController controller;
  void Function()? onTap;
  final String text;
  @override
  State<ListContainer> createState() => _ListContainerState(controller: controller);
}

class _ListContainerState extends State<ListContainer> {
  final TextEditingController controller;

  _ListContainerState({required this.controller});
  @override
  Widget build(BuildContext context) {
    return  defaultTextFormField(
        controller: controller,
        textInputType: TextInputType.none,
        readOnly: true,
        hintText: widget.text,
        onTap: widget.onTap
    );
  }
}
