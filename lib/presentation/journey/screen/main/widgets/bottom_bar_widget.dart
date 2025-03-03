part of '../main_screen.dart';

class BottomBarWidget extends StatefulWidget {
  const BottomBarWidget({super.key});

  @override
  State<BottomBarWidget> createState() => _BottomBarWidgetState();
}

class _BottomBarWidgetState extends State<BottomBarWidget> with DialogHelper {
  late MainBloc _mainBloc;

  @override
  void initState() {
    super.initState();
    _mainBloc = context.read<MainBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 6.sp,
        vertical: 2.sp,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(32.sp),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 16.sp,
            offset: const Offset(0, .1), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          BlocBuilder<MainBloc, MainState>(
            builder: (context, state) {
              bool isSelect = state.tabIndex == TabIndex.tool;
              return XButton(
                type: XButtonType.transparent,
                child: Icon(
                  Icons.settings,
                  size: 28.sp,
                  color: isSelect
                      ? AppColors.primaryColor
                      : AppColors.neutral2Color,
                ),
                onPressed: () {
                  onChangeTab(TabIndex.tool);
                },
              );
            },
          ),
          const BtnCreateBill(),
          BlocBuilder<MainBloc, MainState>(
            builder: (context, state) {
              bool isSelect = state.tabIndex == TabIndex.profile;
              return XButton(
                type: XButtonType.transparent,
                child: Icon(
                  Icons.person,
                  size: 28.sp,
                  color: isSelect
                      ? AppColors.primaryColor
                      : AppColors.neutral2Color,
                ),
                onPressed: () {
                  onChangeTab(TabIndex.profile);
                },
              );
            },
          ),
        ],
      ),
    );
  }

  ///------ Function ------///
  onChangeTab(TabIndex index) {
    _mainBloc.add(ChangeTabEvent(tabIndex: index));
  }
}
