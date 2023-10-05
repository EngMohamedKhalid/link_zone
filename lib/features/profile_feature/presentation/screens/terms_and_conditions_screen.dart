import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../app/utils/app_strings.dart';
import '../../../../app/widgets/default_app_bar_widget.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBarWidget(
        title: AppStrings.termsAndConditions.tr(),
      ),
      body: Container(

      ),
    );
  }
}
