import 'package:c_pos/presentation/mixins/mixins.dart';
import 'package:c_pos/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/configs/box.dart';
import '../../../../../common/di/injection/injection.dart';
import '../../../../../common/extensions/extension.dart';
import '../../../../../data/models/company_model.dart';
import '../../../../../data/models/store_model.dart';
import '../../../../../gen/gen.dart';
import '../../../../theme/app_radius.dart';
import '../../../../theme/colors.dart';
import '../../global_bloc/global_core_bloc.dart';
import '../../login/bloc/auth_bloc.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({super.key});

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> with DialogHelper {
  final AuthBloc _authBloc = getIt.get<AuthBloc>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 16.sp),
      color: Colors.white,
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: _buildBaseInfo(),
            ),
            _buildUserCompany(),
          ],
        ),
      ),
    );
  }

  ///
  /// Widget
  ///
  Widget _buildUserCompany() {
    return BlocSelector<AuthBloc, AuthState, CompanyModel?>(
      bloc: _authBloc,
      selector: (state) => state.userCompany,
      builder: (context, state) {
        if (state == null) return BoxSpacer.blank;
        return XBaseButton(
          onPressed: () => _buildUserCompanyOverlay(context, state),
          padding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 4.sp),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(AppRadius.l),
            border: Border.all(color: AppColors.neutral3Color, width: 1.sp),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(state.getName, style: AppFont.t.s(10)),
              Icon(Icons.arrow_drop_down,
                  size: 12.sp, color: AppColors.iconColor),
            ],
          ),
        );
      },
    );
  }

  Widget _currentUserStore() {
    return BlocSelector<AuthBloc, AuthState, StoreModel?>(
      bloc: _authBloc,
      selector: (state) => state.currentUserStore,
      builder: (context, state) {
        if (state == null) return BoxSpacer.blank;
        return Text(state.getStoreName, style: AppFont.t.s(10));
      },
    );
  }

  Widget _buildBaseInfo() {
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
                    style: AppFont.t.w600,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  if (state.userInfo!.getUserCode.isNotNullOrEmpty) ...[
                    Text(
                      'MNV: ${state.userInfo?.getUserCode ?? ''}',
                      style: AppFont.t.s(10),
                    ),
                  ],
                  if (state.userInfo!.getStoreName.isNotNullOrEmpty) ...[
                    Text(
                      'CH:  ${state.userInfo?.getStoreName ?? ''}',
                      style: AppFont.t.s(10),
                    ),
                  ],
                  _currentUserStore(),
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

  Future<void> _buildUserCompanyOverlay(
      BuildContext context, CompanyModel? companySelected) async {
    final res = await showXBottomSheet(
      context,
      body: UserCompanyDialog(companySelected: companySelected),
    );

    if (res != null) {
      _authBloc.add(UpdateCurrentUserCompanyEvent(company: res));
    }
  }
}

class UserCompanyDialog extends StatelessWidget {
  const UserCompanyDialog({super.key, this.companySelected});
  final CompanyModel? companySelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const HeaderDialog(title: 'Công ty'),
        BoxSpacer.s16,
        _buildUserCompanyList(),
      ],
    );
  }

  Widget _buildUserCompanyList() {
    return BlocBuilder<GlobalCoreBloc, GlobalCoreState>(
      bloc: getIt.get<GlobalCoreBloc>(),
      builder: (context, state) {
        return ListView.builder(
          itemCount: state.companies.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            CompanyModel company = state.companies[index];
            bool isSelected = company.id == companySelected?.id;
            return XBaseButton(
                padding:
                    EdgeInsets.symmetric(horizontal: 16.sp, vertical: 8.sp),
                onPressed: () {
                  Navigator.pop(context, company);
                },
                child: Row(
                  children: [
                    Expanded(child: Text(company.getName, style: AppFont.t)),
                    if (isSelected) ...[
                      Icon(
                        Icons.check,
                        size: 12.sp,
                        color: AppColors.primaryColor,
                      ),
                    ],
                  ],
                ));
          },
        );
      },
    );
  }
}
