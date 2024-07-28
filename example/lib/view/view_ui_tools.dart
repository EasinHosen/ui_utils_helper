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
              },
            ),
            const Text('Divider'),
            const CustomDivider(),
            CustomSizedBox.space8H,
            CustomDropDownMenu(
              selectedOption: 'Option 1',
              hintText: 'Select an option',
              onChange: (value) {
                setState(() {});
              },
              list: const ['Option 1', 'Option 2', 'Option 3'],
              borderRadius: BorderRadius.circular(8),
              headerTitle: 'Dropdown Header Title',
              hasHeaderTitle: true,
            ),
            CustomSizedBox.space8H,
            const Text('Toggle Switch'),
            CustomAnimatedToggleSwitch(
              onChanged: (value) {
                setState(() {});
              },
              width: 60,
              height: 30,
              childLeft: const Text("En"),
              childRight: const Text("Sp"),
            ),
          ],
        ),
      ),
    );
  }
}
