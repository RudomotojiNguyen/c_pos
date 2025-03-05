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
    // return Stack(
    //   alignment: Alignment.center,
    //   clipBehavior: Clip.none,
    //   children: [
    //     Container(
    //       padding: EdgeInsets.symmetric(
    //         horizontal: 12.sp,
    //         vertical: 4.sp,
    //       ),
    //       decoration: BoxDecoration(
    //         color: AppColors.white,
    //         borderRadius: BorderRadius.circular(32.sp),
    //         boxShadow: [
    //           BoxShadow(
    //             color: Colors.black.withOpacity(0.2),
    //             blurRadius: 16.sp,
    //             offset: const Offset(0, .1), // changes position of shadow
    //           ),
    //         ],
    //       ),
    //       child: Row(
    //         children: [
    //           BlocBuilder<MainBloc, MainState>(
    //             builder: (context, state) {
    //               bool isSelect = state.tabIndex == TabIndex.tool;
    //               return XButton(
    //                 type: XButtonType.transparent,
    //                 child: isSelect
    //                     ? Assets.svg.homeEnanle.svg(width: 24.sp)
    //                     : Assets.svg.homeDisable.svg(width: 24.sp),
    //                 onPressed: () {
    //                   onChangeTab(TabIndex.tool);
    //                 },
    //               );
    //             },
    //           ),
    //           SizedBox(width: 42.sp),
    //           BlocBuilder<MainBloc, MainState>(
    //             builder: (context, state) {
    //               bool isSelect = state.tabIndex == TabIndex.profile;
    //               return XButton(
    //                 type: XButtonType.transparent,
    //                 child: isSelect
    //                     ? Assets.svg.settingEnable.svg(width: 28.sp)
    //                     : Assets.svg.settingDisable.svg(width: 28.sp),
    //                 onPressed: () {
    //                   onChangeTab(TabIndex.profile);
    //                 },
    //               );
    //             },
    //           ),
    //         ],
    //       ),
    //     ),
    //     Positioned(
    //       top: -16.sp,
    //       child: const BtnCreateBill(),
    //     )
    //   ],
    // );
    return const BtnCreateBill();
  }

  ///------ Function ------///
  onChangeTab(TabIndex index) {
    _mainBloc.add(ChangeTabEvent(tabIndex: index));
  }
}
