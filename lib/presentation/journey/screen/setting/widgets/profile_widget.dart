import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/configs/box.dart';
import '../../../../../common/di/injection/injection.dart';
import '../../../../../common/extensions/extension.dart';
import '../../../../../gen/gen.dart';
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
        Assets.svg.person.svg(width: 40.sp),
        BoxSpacer.s24,
        Expanded(
          child: BlocBuilder<AuthBloc, AuthState>(
            buildWhen: buildWhen,
            bloc: _authBloc,
            builder: (context, state) {
              if (state.userInfo == null) return BoxSpacer.blank;
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    state.userInfo?.getFullName ?? '',
                    style: AppFont.t.s(14),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  if (state.userInfo!.getUserCode.isNotNullOrEmpty) ...[
                    BoxSpacer.s4,
                    Text(
                      'MNV: ${state.userInfo?.getUserCode ?? ''}',
                      style: AppFont.t.s(12),
                    ),
                  ],
                  if (state.userInfo!.getStoreName.isNotNullOrEmpty) ...[
                    BoxSpacer.s4,
                    Text(
                      'CH:  ${state.userInfo?.getStoreName ?? ''}',
                      style: AppFont.t.s(12),
                    ),
                  ],
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  ///--- method ---///
  bool buildWhen(previous, current) =>
      current is GetProfileSuccess || current is LoginSuccess;
}
