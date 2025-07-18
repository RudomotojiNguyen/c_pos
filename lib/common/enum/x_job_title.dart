enum XJobTitle {
  none,
  gd, // Giám đốc
  rsm, // Quản lý vùng
  asm, // Quản lý khu vực
  ql, // Quản lý cửa hàng
  tl, // Trợ lý cửa hàng
  ktbh, // Kế toán bán hàng
  tvbh, // Tư vấn bán hàng
  ktpm, // Hỗ trợ kỹ thuật
  tdkh, // Tiếp đón khách hàng
  ktpc, // Kỹ thuật phần cứng
  gdnhpk, // Giám đốc ngành hàng phụ kiện
  nvnhpk, // NV phụ trách ngành hàng PK
  adminNhpk, // Admin ngành hàng phụ kiện
  cdpk, // nhân viên chuyên doanh phụ kiện
  qlCskh, // quản lý CR
  cskh, // nhân viên CR
  ctvCskh, // cộng tác viên CR
  adminGdnhpk, // Admin giám đốc ngành hàng phụ kiện
  ktnb, // Kế toán nội bộ
  qlDp, // Trưởng bộ phận điều phối
  mkt, // Nhân viên marketing
  qlMkt, // Trưởng marketing
  dp, // Điều phối
  qlKtnb, // Trưởng kế toán nội bộ
  nvQa, // Nhân viên kiểm định chất lượng (Kiểm soát/QA)
  hvQl, // Học việc quản lý
  hvTl, // Học việc trợ lý
  adminMkt, // Admin marketing
  tradeMkt, // Trade marketing
  tradeMktManager, // Trade marketing manager
  crLeaderLqd, // Team leader CR LQĐ
  crLeaderTqk, // Team leader CR TQK
}

extension XUserPermissionExtension on XJobTitle {
  static const Map<int, XJobTitle> map = {
    1: XJobTitle.gd,
    2: XJobTitle.rsm,
    3: XJobTitle.asm,
    4: XJobTitle.ql,
    5: XJobTitle.tl,
    6: XJobTitle.ktbh,
    7: XJobTitle.tvbh,
    8: XJobTitle.ktpm,
    9: XJobTitle.tdkh,
    10: XJobTitle.ktpc,
    11: XJobTitle.gdnhpk,
    12: XJobTitle.nvnhpk,
    13: XJobTitle.adminNhpk,
    14: XJobTitle.cdpk,
    15: XJobTitle.qlCskh,
    16: XJobTitle.cskh,
    17: XJobTitle.ctvCskh,
    18: XJobTitle.adminGdnhpk,
    19: XJobTitle.ktnb,
    20: XJobTitle.qlDp,
    21: XJobTitle.mkt,
    22: XJobTitle.qlMkt,
    23: XJobTitle.dp,
    24: XJobTitle.qlKtnb,
    25: XJobTitle.nvQa,
    40: XJobTitle.hvQl,
    41: XJobTitle.hvTl,
    57: XJobTitle.adminMkt,
    94: XJobTitle.tradeMkt,
    106: XJobTitle.tradeMktManager,
    88: XJobTitle.crLeaderLqd,
    89: XJobTitle.crLeaderTqk,
  };
}
