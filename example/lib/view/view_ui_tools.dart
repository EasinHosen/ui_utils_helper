import 'package:flutter/material.dart';
import 'package:ui_utils_helper/ui_utils_helper.dart';

class ViewUiTools extends StatefulWidget {
  const ViewUiTools({super.key});

  @override
  State<ViewUiTools> createState() => _ViewUiToolsState();
}

class _ViewUiToolsState extends State<ViewUiTools> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Utils Helper'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomTextField(
              hintText: 'CustomTextField',
              controller: _textEditingController,
              hasHeaderTitle: true,
              headerTitle: 'CustomTextField',
            ),
            CustomSizedBox.space8H,
            CustomButton(
                label: 'show toast',
                onPressed: () {
                  ToastManager.show('Hello Toast');
                }),
          ],
        ),
      ),
    );
  }
}
