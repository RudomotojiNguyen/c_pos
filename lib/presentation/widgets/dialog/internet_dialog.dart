import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../common/configs/box.dart';
import '../../../common/di/injection/injection.dart';
import '../../../common/extensions/extension.dart';
import '../../../gen/gen.dart';
import '../../common_bloc/network/internet_bloc.dart';

class InternetDialog extends StatefulWidget {
  const InternetDialog({super.key});

  @override
  State<InternetDialog> createState() => _InternetDialogState();
}

class _InternetDialogState extends State<InternetDialog> {
  final InternetBloc internetBloc = getIt.get<InternetBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<InternetBloc, InternetState>(
      bloc: internetBloc,
      listener: (context, state) {
        if (state is InternetConnected) {
          Navigator.pop(context);
        }
      },
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Mất kết nối !!!',
              style: AppFont.t.s(24).w700,
            ),
            BoxSpacer.s16,
            Lottie.asset(
              Assets.lottie.notconnected,
              width: 300.sp,
            ),
            BoxSpacer.s16,
            Text(
              'Vui lòng kiểm tra lại kết nối mạng',
              style: AppFont.t.s(14),
            ),
          ],
        ),
      ),
    );
  }
}
