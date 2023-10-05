import 'package:flutter/material.dart';

import '../../error/failures.dart';
import '../../widgets/custom_alert_dialog.dart';
import '../app_colors.dart';

void errorStateHandler(Failure l){
  globalAlertDialogue(l.cause??"", iconDataColor: AppColors.red,iconData: Icons.close);
}