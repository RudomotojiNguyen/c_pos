enum UpdateAppType { none, warning, force }

enum ScreenSize { extraLarge, large, normal, small }

enum BannerPosition {
  top('Top'),
  topRight('Top_Right'),
  top2('Top_2'),
  topLeft1('Top_Left_1');

  final String value;

  const BannerPosition(this.value);
}

enum AppAxis { row, column }

enum ApplyChannel {
  all(1, 'Online & Offline'),
  online(2, 'Online'),
  offline(3, 'Offline');

  final int value;
  final String title;

  const ApplyChannel(this.value, this.title);
}

enum OperationType { add, minus }

enum QuantitySelect { single, multiple }

enum FilterParams {
  sortByOutstanding('sort_by_outstanding'),
  sortBySale('sort_by_sale'),
  isInstallment('is_installment'),
  sortByPrice('sort_by_price');

  final String value;

  const FilterParams(this.value);
}

enum SortBy {
  asc('ASC'),
  desc('DESC');

  final String value;

  const SortBy(this.value);
}

enum Operation { add, remove }

enum NavigateTo { detail, list }
