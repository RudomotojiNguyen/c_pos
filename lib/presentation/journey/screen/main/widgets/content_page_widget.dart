part of '../main_screen.dart';

class ContentPageWidget extends StatefulWidget {
  const ContentPageWidget({super.key});

  @override
  State<ContentPageWidget> createState() => _ContentPageWidgetState();
}

class _ContentPageWidgetState extends State<ContentPageWidget> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> tabs = [
      // const ToolScreen(),
      HomeScreen(),
      // SettingScreen(),
    ];

    final List<TabIndex> indexTab = [
      TabIndex.tool,
      // TabIndex.profile,
    ];

    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        return IndexedStack(
          index: indexTab.indexOf(state.tabIndex),
          children: [...tabs],
        );
      },
    );
  }
}
