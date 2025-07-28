part of 'trade_in_loading.dart';

class FileVerifyLoading extends StatelessWidget {
  const FileVerifyLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return XContainerLoading(
      childContent: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BoxSpacer.s8,
          const ImageVerifyLoading(),
        ],
      ),
    );
  }
}
