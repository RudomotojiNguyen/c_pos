import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/configs/box.dart';
import '../../../../../common/di/injection/injection.dart';
import '../../../../../common/extensions/extension.dart';
import '../../../../theme/themes.dart';
import '../../login/bloc/auth_bloc.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({super.key});

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  final AuthBloc _authBloc = getIt.get<AuthBloc>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(20.sp),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.sp),
              border: Border.all(
                color: AppColors.primaryColor,
                width: 1.sp,
              )),
          child: Icon(Icons.person, size: 40.sp),
        ),
        BoxSpacer.s24,
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<AuthBloc, AuthState>(
                buildWhen: buildWhen,
                bloc: _authBloc,
                builder: (context, state) {
                  return Text(
                    state.userInfo?.getFullName ?? '',
                    style: AppFont.t.s(14),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  );
                },
              ),
              BoxSpacer.s4,
              BlocBuilder<AuthBloc, AuthState>(
                buildWhen: buildWhen,
                bloc: _authBloc,
                builder: (context, state) {
                  return Text(
                    'MNV: ${state.userInfo?.getUserCode ?? ''}',
                    style: AppFont.t.s(12),
                  );
                },
              ),
              BoxSpacer.s4,
              BlocBuilder<AuthBloc, AuthState>(
                buildWhen: buildWhen,
                bloc: _authBloc,
                builder: (context, state) {
                  return Text(
                    'CH:  ${state.userInfo?.getStoreName ?? ''}',
                    style: AppFont.t.s(12),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  ///--- method ---///
  bool buildWhen(previous, current) =>
      current is GetProfileSuccess || current is LoginSuccess;
}
