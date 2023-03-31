import 'package:flutter/material.dart';
import 'package:relatorio_jw_design_system/relatorio_jw_design_system.dart';

class ComponentListPage extends StatelessWidget {
  const ComponentListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.white,
      appBar: AppBar(
        title: const Text(''),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CustomText(
              text:
                  'Testando a fonte com varias linhas possíveis testando um dois tres quatro',
              type: FontType.body,
            ),
            const Text(
              'Design System Components',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: CustomTextFormField(labelText: 'Text Form Field'),
            ),
            const SizedBox(height: 20),
            const Icon(
              Icons.ac_unit_rounded,
            ),
            CustomButton(
              type: ButtonType.text,
              text: ' ButtonType.text',
              onPressed: () {},
            ),
            CustomButton(
              type: ButtonType.contained,
              text: 'ButtonType.contained',
              onPressed: () {},
            ),
            CustomButton(
              type: ButtonType.outlined,
              text: 'ButtonType.outlined',
              onPressed: () {},
            ),
            const SizedBox(height: 20),
            const Text(
              'Text - font: Montserrat',
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.access_alarm_rounded),
            ),
            const CustomShimmer(
              baseColor: CustomColors.greyHeavy,
            ),
            const SizedBox(height: 20),
            CustomButton(
              type: ButtonType.contained,
              text: 'BottomSheet',
              onPressed: () {
                CustomBottomSheet().showAlertDialog(
                  context,
                );
              },
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: CustomDropDown(
                onChanged: (v) {},
                labelText: 'LabelText',
              ),
            ),
            const Lottie()
          ],
        ),
      ),
    );
  }
}
