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
    return const BtnCreateBill();
  }

  ///------ Function ------///
  onChangeTab(TabIndex index) {
    _mainBloc.add(ChangeTabEvent(tabIndex: index));
  }
}
