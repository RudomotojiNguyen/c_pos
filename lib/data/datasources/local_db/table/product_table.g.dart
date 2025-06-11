// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_table.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetProductTableCollection on Isar {
  IsarCollection<ProductTable> get productTables => this.collection();
}

const ProductTableSchema = CollectionSchema(
  name: r'ProductTable',
  id: -430222909457296107,
  properties: {
    r'accessoryGroupCode': PropertySchema(
      id: 0,
      name: r'accessoryGroupCode',
      type: IsarType.string,
    ),
    r'accessoryGroupId': PropertySchema(
      id: 1,
      name: r'accessoryGroupId',
      type: IsarType.string,
    ),
    r'appearTimes': PropertySchema(
      id: 2,
      name: r'appearTimes',
      type: IsarType.long,
    ),
    r'attachedImei': PropertySchema(
      id: 3,
      name: r'attachedImei',
      type: IsarType.string,
    ),
    r'barCode': PropertySchema(
      id: 4,
      name: r'barCode',
      type: IsarType.string,
    ),
    r'belongBillDetailId': PropertySchema(
      id: 5,
      name: r'belongBillDetailId',
      type: IsarType.string,
    ),
    r'belongToWarrantyImei': PropertySchema(
      id: 6,
      name: r'belongToWarrantyImei',
      type: IsarType.bool,
    ),
    r'brand': PropertySchema(
      id: 7,
      name: r'brand',
      type: IsarType.string,
    ),
    r'cartId': PropertySchema(
      id: 8,
      name: r'cartId',
      type: IsarType.long,
    ),
    r'code': PropertySchema(
      id: 9,
      name: r'code',
      type: IsarType.string,
    ),
    r'comboId': PropertySchema(
      id: 10,
      name: r'comboId',
      type: IsarType.string,
    ),
    r'companyId': PropertySchema(
      id: 11,
      name: r'companyId',
      type: IsarType.long,
    ),
    r'createdAt': PropertySchema(
      id: 12,
      name: r'createdAt',
      type: IsarType.string,
    ),
    r'customerDiscountForProductStr': PropertySchema(
      id: 13,
      name: r'customerDiscountForProductStr',
      type: IsarType.string,
    ),
    r'discountAmount': PropertySchema(
      id: 14,
      name: r'discountAmount',
      type: IsarType.double,
    ),
    r'discountByHandStr': PropertySchema(
      id: 15,
      name: r'discountByHandStr',
      type: IsarType.string,
    ),
    r'discountPrice': PropertySchema(
      id: 16,
      name: r'discountPrice',
      type: IsarType.double,
    ),
    r'discountProgramId': PropertySchema(
      id: 17,
      name: r'discountProgramId',
      type: IsarType.long,
    ),
    r'discountType': PropertySchema(
      id: 18,
      name: r'discountType',
      type: IsarType.long,
    ),
    r'discountValue': PropertySchema(
      id: 19,
      name: r'discountValue',
      type: IsarType.double,
    ),
    r'externalImeiId': PropertySchema(
      id: 20,
      name: r'externalImeiId',
      type: IsarType.string,
    ),
    r'externalImeiNo': PropertySchema(
      id: 21,
      name: r'externalImeiNo',
      type: IsarType.string,
    ),
    r'flexibleComboId': PropertySchema(
      id: 22,
      name: r'flexibleComboId',
      type: IsarType.string,
    ),
    r'flexibleComboItemId': PropertySchema(
      id: 23,
      name: r'flexibleComboItemId',
      type: IsarType.string,
    ),
    r'fromPrice': PropertySchema(
      id: 24,
      name: r'fromPrice',
      type: IsarType.double,
    ),
    r'fulfillmentType': PropertySchema(
      id: 25,
      name: r'fulfillmentType',
      type: IsarType.long,
    ),
    r'image': PropertySchema(
      id: 26,
      name: r'image',
      type: IsarType.string,
    ),
    r'imeiStr': PropertySchema(
      id: 27,
      name: r'imeiStr',
      type: IsarType.string,
    ),
    r'isComboProduct': PropertySchema(
      id: 28,
      name: r'isComboProduct',
      type: IsarType.bool,
    ),
    r'isLostProduct': PropertySchema(
      id: 29,
      name: r'isLostProduct',
      type: IsarType.bool,
    ),
    r'isRepurchasePrice': PropertySchema(
      id: 30,
      name: r'isRepurchasePrice',
      type: IsarType.bool,
    ),
    r'itemId': PropertySchema(
      id: 31,
      name: r'itemId',
      type: IsarType.string,
    ),
    r'listedPrice': PropertySchema(
      id: 32,
      name: r'listedPrice',
      type: IsarType.double,
    ),
    r'merchantId': PropertySchema(
      id: 33,
      name: r'merchantId',
      type: IsarType.long,
    ),
    r'note': PropertySchema(
      id: 34,
      name: r'note',
      type: IsarType.string,
    ),
    r'originalPrice': PropertySchema(
      id: 35,
      name: r'originalPrice',
      type: IsarType.double,
    ),
    r'parentProductId': PropertySchema(
      id: 36,
      name: r'parentProductId',
      type: IsarType.string,
    ),
    r'productCategory': PropertySchema(
      id: 37,
      name: r'productCategory',
      type: IsarType.long,
    ),
    r'productChildComboStr': PropertySchema(
      id: 38,
      name: r'productChildComboStr',
      type: IsarType.string,
    ),
    r'productChildStr': PropertySchema(
      id: 39,
      name: r'productChildStr',
      type: IsarType.string,
    ),
    r'productChildType': PropertySchema(
      id: 40,
      name: r'productChildType',
      type: IsarType.byte,
      enumMap: _ProductTableproductChildTypeEnumValueMap,
    ),
    r'productCode': PropertySchema(
      id: 41,
      name: r'productCode',
      type: IsarType.string,
    ),
    r'productCodeVat': PropertySchema(
      id: 42,
      name: r'productCodeVat',
      type: IsarType.string,
    ),
    r'productId': PropertySchema(
      id: 43,
      name: r'productId',
      type: IsarType.string,
    ),
    r'productInComboQuantity': PropertySchema(
      id: 44,
      name: r'productInComboQuantity',
      type: IsarType.long,
    ),
    r'productName': PropertySchema(
      id: 45,
      name: r'productName',
      type: IsarType.string,
    ),
    r'productNameVat': PropertySchema(
      id: 46,
      name: r'productNameVat',
      type: IsarType.string,
    ),
    r'productTradeName': PropertySchema(
      id: 47,
      name: r'productTradeName',
      type: IsarType.string,
    ),
    r'productType': PropertySchema(
      id: 48,
      name: r'productType',
      type: IsarType.byte,
      enumMap: _ProductTableproductTypeEnumValueMap,
    ),
    r'productWebCategory': PropertySchema(
      id: 49,
      name: r'productWebCategory',
      type: IsarType.long,
    ),
    r'promotionId': PropertySchema(
      id: 50,
      name: r'promotionId',
      type: IsarType.long,
    ),
    r'quantity': PropertySchema(
      id: 51,
      name: r'quantity',
      type: IsarType.long,
    ),
    r'repurchasePrice': PropertySchema(
      id: 52,
      name: r'repurchasePrice',
      type: IsarType.double,
    ),
    r'returnSellingPrice': PropertySchema(
      id: 53,
      name: r'returnSellingPrice',
      type: IsarType.long,
    ),
    r'selectImeiReason': PropertySchema(
      id: 54,
      name: r'selectImeiReason',
      type: IsarType.string,
    ),
    r'sellingPrice': PropertySchema(
      id: 55,
      name: r'sellingPrice',
      type: IsarType.double,
    ),
    r'status': PropertySchema(
      id: 56,
      name: r'status',
      type: IsarType.long,
    ),
    r'toPrice': PropertySchema(
      id: 57,
      name: r'toPrice',
      type: IsarType.double,
    ),
    r'totalQuantityInStock': PropertySchema(
      id: 58,
      name: r'totalQuantityInStock',
      type: IsarType.long,
    ),
    r'totalQuantityInStore': PropertySchema(
      id: 59,
      name: r'totalQuantityInStore',
      type: IsarType.long,
    ),
    r'totalQuantityInTransfer': PropertySchema(
      id: 60,
      name: r'totalQuantityInTransfer',
      type: IsarType.long,
    ),
    r'unitId': PropertySchema(
      id: 61,
      name: r'unitId',
      type: IsarType.long,
    ),
    r'warrantyAddress': PropertySchema(
      id: 62,
      name: r'warrantyAddress',
      type: IsarType.string,
    ),
    r'warrantyDescription': PropertySchema(
      id: 63,
      name: r'warrantyDescription',
      type: IsarType.string,
    ),
    r'warrantyMonthNo': PropertySchema(
      id: 64,
      name: r'warrantyMonthNo',
      type: IsarType.long,
    ),
    r'warrantyPackageId': PropertySchema(
      id: 65,
      name: r'warrantyPackageId',
      type: IsarType.long,
    ),
    r'warrantyPhone': PropertySchema(
      id: 66,
      name: r'warrantyPhone',
      type: IsarType.string,
    ),
    r'warrantyReasonId': PropertySchema(
      id: 67,
      name: r'warrantyReasonId',
      type: IsarType.long,
    ),
    r'warrantyReasonName': PropertySchema(
      id: 68,
      name: r'warrantyReasonName',
      type: IsarType.string,
    ),
    r'wholesalePrice': PropertySchema(
      id: 69,
      name: r'wholesalePrice',
      type: IsarType.double,
    )
  },
  estimateSize: _productTableEstimateSize,
  serialize: _productTableSerialize,
  deserialize: _productTableDeserialize,
  deserializeProp: _productTableDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'replacedWarrantyProduct': LinkSchema(
      id: -4697711767684760299,
      name: r'replacedWarrantyProduct',
      target: r'ProductTable',
      single: true,
    ),
    r'productsGift': LinkSchema(
      id: 7430769507470497752,
      name: r'productsGift',
      target: r'ProductTable',
      single: false,
    ),
    r'productsAttach': LinkSchema(
      id: -6354753507187001068,
      name: r'productsAttach',
      target: r'ProductTable',
      single: false,
    ),
    r'productsWarranty': LinkSchema(
      id: -2422344224974256649,
      name: r'productsWarranty',
      target: r'ProductTable',
      single: false,
    ),
    r'vouchers': LinkSchema(
      id: -2352622683454902743,
      name: r'vouchers',
      target: r'VoucherTable',
      single: false,
    )
  },
  embeddedSchemas: {},
  getId: _productTableGetId,
  getLinks: _productTableGetLinks,
  attach: _productTableAttach,
  version: '3.1.0+1',
);

int _productTableEstimateSize(
  ProductTable object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.accessoryGroupCode;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.accessoryGroupId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.attachedImei;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.barCode;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.belongBillDetailId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.brand;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.code;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.comboId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.createdAt;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.customerDiscountForProductStr;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.discountByHandStr;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.externalImeiId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.externalImeiNo;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.flexibleComboId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.flexibleComboItemId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.image;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.imeiStr;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.itemId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.note;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.parentProductId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.productChildComboStr;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.productChildStr;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.productCode;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.productCodeVat;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.productId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.productName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.productNameVat;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.productTradeName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.selectImeiReason;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.warrantyAddress;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.warrantyDescription;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.warrantyPhone;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.warrantyReasonName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _productTableSerialize(
  ProductTable object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.accessoryGroupCode);
  writer.writeString(offsets[1], object.accessoryGroupId);
  writer.writeLong(offsets[2], object.appearTimes);
  writer.writeString(offsets[3], object.attachedImei);
  writer.writeString(offsets[4], object.barCode);
  writer.writeString(offsets[5], object.belongBillDetailId);
  writer.writeBool(offsets[6], object.belongToWarrantyImei);
  writer.writeString(offsets[7], object.brand);
  writer.writeLong(offsets[8], object.cartId);
  writer.writeString(offsets[9], object.code);
  writer.writeString(offsets[10], object.comboId);
  writer.writeLong(offsets[11], object.companyId);
  writer.writeString(offsets[12], object.createdAt);
  writer.writeString(offsets[13], object.customerDiscountForProductStr);
  writer.writeDouble(offsets[14], object.discountAmount);
  writer.writeString(offsets[15], object.discountByHandStr);
  writer.writeDouble(offsets[16], object.discountPrice);
  writer.writeLong(offsets[17], object.discountProgramId);
  writer.writeLong(offsets[18], object.discountType);
  writer.writeDouble(offsets[19], object.discountValue);
  writer.writeString(offsets[20], object.externalImeiId);
  writer.writeString(offsets[21], object.externalImeiNo);
  writer.writeString(offsets[22], object.flexibleComboId);
  writer.writeString(offsets[23], object.flexibleComboItemId);
  writer.writeDouble(offsets[24], object.fromPrice);
  writer.writeLong(offsets[25], object.fulfillmentType);
  writer.writeString(offsets[26], object.image);
  writer.writeString(offsets[27], object.imeiStr);
  writer.writeBool(offsets[28], object.isComboProduct);
  writer.writeBool(offsets[29], object.isLostProduct);
  writer.writeBool(offsets[30], object.isRepurchasePrice);
  writer.writeString(offsets[31], object.itemId);
  writer.writeDouble(offsets[32], object.listedPrice);
  writer.writeLong(offsets[33], object.merchantId);
  writer.writeString(offsets[34], object.note);
  writer.writeDouble(offsets[35], object.originalPrice);
  writer.writeString(offsets[36], object.parentProductId);
  writer.writeLong(offsets[37], object.productCategory);
  writer.writeString(offsets[38], object.productChildComboStr);
  writer.writeString(offsets[39], object.productChildStr);
  writer.writeByte(offsets[40], object.productChildType.index);
  writer.writeString(offsets[41], object.productCode);
  writer.writeString(offsets[42], object.productCodeVat);
  writer.writeString(offsets[43], object.productId);
  writer.writeLong(offsets[44], object.productInComboQuantity);
  writer.writeString(offsets[45], object.productName);
  writer.writeString(offsets[46], object.productNameVat);
  writer.writeString(offsets[47], object.productTradeName);
  writer.writeByte(offsets[48], object.productType.index);
  writer.writeLong(offsets[49], object.productWebCategory);
  writer.writeLong(offsets[50], object.promotionId);
  writer.writeLong(offsets[51], object.quantity);
  writer.writeDouble(offsets[52], object.repurchasePrice);
  writer.writeLong(offsets[53], object.returnSellingPrice);
  writer.writeString(offsets[54], object.selectImeiReason);
  writer.writeDouble(offsets[55], object.sellingPrice);
  writer.writeLong(offsets[56], object.status);
  writer.writeDouble(offsets[57], object.toPrice);
  writer.writeLong(offsets[58], object.totalQuantityInStock);
  writer.writeLong(offsets[59], object.totalQuantityInStore);
  writer.writeLong(offsets[60], object.totalQuantityInTransfer);
  writer.writeLong(offsets[61], object.unitId);
  writer.writeString(offsets[62], object.warrantyAddress);
  writer.writeString(offsets[63], object.warrantyDescription);
  writer.writeLong(offsets[64], object.warrantyMonthNo);
  writer.writeLong(offsets[65], object.warrantyPackageId);
  writer.writeString(offsets[66], object.warrantyPhone);
  writer.writeLong(offsets[67], object.warrantyReasonId);
  writer.writeString(offsets[68], object.warrantyReasonName);
  writer.writeDouble(offsets[69], object.wholesalePrice);
}

ProductTable _productTableDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ProductTable(
    accessoryGroupId: reader.readStringOrNull(offsets[1]),
    appearTimes: reader.readLongOrNull(offsets[2]),
    barCode: reader.readStringOrNull(offsets[4]),
    belongToWarrantyImei: reader.readBoolOrNull(offsets[6]),
    brand: reader.readStringOrNull(offsets[7]),
    cartId: reader.readLongOrNull(offsets[8]),
    code: reader.readStringOrNull(offsets[9]),
    comboId: reader.readStringOrNull(offsets[10]),
    companyId: reader.readLongOrNull(offsets[11]),
    createdAt: reader.readStringOrNull(offsets[12]),
    discountAmount: reader.readDoubleOrNull(offsets[14]),
    discountByHandStr: reader.readStringOrNull(offsets[15]),
    discountPrice: reader.readDoubleOrNull(offsets[16]),
    discountProgramId: reader.readLongOrNull(offsets[17]),
    discountType: reader.readLongOrNull(offsets[18]),
    discountValue: reader.readDoubleOrNull(offsets[19]),
    externalImeiNo: reader.readStringOrNull(offsets[21]),
    flexibleComboItemId: reader.readStringOrNull(offsets[23]),
    fromPrice: reader.readDoubleOrNull(offsets[24]),
    fulfillmentType: reader.readLongOrNull(offsets[25]),
    image: reader.readStringOrNull(offsets[26]),
    imeiStr: reader.readStringOrNull(offsets[27]),
    isComboProduct: reader.readBoolOrNull(offsets[28]),
    itemId: reader.readStringOrNull(offsets[31]),
    listedPrice: reader.readDoubleOrNull(offsets[32]),
    merchantId: reader.readLongOrNull(offsets[33]),
    note: reader.readStringOrNull(offsets[34]),
    originalPrice: reader.readDoubleOrNull(offsets[35]),
    parentProductId: reader.readStringOrNull(offsets[36]),
    productCategory: reader.readLongOrNull(offsets[37]),
    productChildType: _ProductTableproductChildTypeValueEnumMap[
            reader.readByteOrNull(offsets[40])] ??
        ProductType.normal,
    productCode: reader.readStringOrNull(offsets[41]),
    productCodeVat: reader.readStringOrNull(offsets[42]),
    productId: reader.readStringOrNull(offsets[43]),
    productInComboQuantity: reader.readLongOrNull(offsets[44]),
    productName: reader.readStringOrNull(offsets[45]),
    productNameVat: reader.readStringOrNull(offsets[46]),
    productTradeName: reader.readStringOrNull(offsets[47]),
    productType: _ProductTableproductTypeValueEnumMap[
            reader.readByteOrNull(offsets[48])] ??
        ProductType.normal,
    productWebCategory: reader.readLongOrNull(offsets[49]),
    promotionId: reader.readLongOrNull(offsets[50]),
    quantity: reader.readLongOrNull(offsets[51]),
    repurchasePrice: reader.readDoubleOrNull(offsets[52]),
    returnSellingPrice: reader.readLongOrNull(offsets[53]),
    selectImeiReason: reader.readStringOrNull(offsets[54]),
    sellingPrice: reader.readDoubleOrNull(offsets[55]),
    status: reader.readLongOrNull(offsets[56]),
    toPrice: reader.readDoubleOrNull(offsets[57]),
    totalQuantityInStock: reader.readLongOrNull(offsets[58]),
    totalQuantityInStore: reader.readLongOrNull(offsets[59]),
    totalQuantityInTransfer: reader.readLongOrNull(offsets[60]),
    unitId: reader.readLongOrNull(offsets[61]),
    warrantyAddress: reader.readStringOrNull(offsets[62]),
    warrantyDescription: reader.readStringOrNull(offsets[63]),
    warrantyMonthNo: reader.readLongOrNull(offsets[64]),
    warrantyPackageId: reader.readLongOrNull(offsets[65]),
    warrantyPhone: reader.readStringOrNull(offsets[66]),
    wholesalePrice: reader.readDoubleOrNull(offsets[69]),
  );
  object.accessoryGroupCode = reader.readStringOrNull(offsets[0]);
  object.attachedImei = reader.readStringOrNull(offsets[3]);
  object.belongBillDetailId = reader.readStringOrNull(offsets[5]);
  object.customerDiscountForProductStr = reader.readStringOrNull(offsets[13]);
  object.externalImeiId = reader.readStringOrNull(offsets[20]);
  object.flexibleComboId = reader.readStringOrNull(offsets[22]);
  object.id = id;
  object.isLostProduct = reader.readBoolOrNull(offsets[29]);
  object.isRepurchasePrice = reader.readBoolOrNull(offsets[30]);
  object.productChildComboStr = reader.readStringOrNull(offsets[38]);
  object.productChildStr = reader.readStringOrNull(offsets[39]);
  object.warrantyReasonId = reader.readLongOrNull(offsets[67]);
  object.warrantyReasonName = reader.readStringOrNull(offsets[68]);
  return object;
}

P _productTableDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readBoolOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readLongOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readLongOrNull(offset)) as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    case 13:
      return (reader.readStringOrNull(offset)) as P;
    case 14:
      return (reader.readDoubleOrNull(offset)) as P;
    case 15:
      return (reader.readStringOrNull(offset)) as P;
    case 16:
      return (reader.readDoubleOrNull(offset)) as P;
    case 17:
      return (reader.readLongOrNull(offset)) as P;
    case 18:
      return (reader.readLongOrNull(offset)) as P;
    case 19:
      return (reader.readDoubleOrNull(offset)) as P;
    case 20:
      return (reader.readStringOrNull(offset)) as P;
    case 21:
      return (reader.readStringOrNull(offset)) as P;
    case 22:
      return (reader.readStringOrNull(offset)) as P;
    case 23:
      return (reader.readStringOrNull(offset)) as P;
    case 24:
      return (reader.readDoubleOrNull(offset)) as P;
    case 25:
      return (reader.readLongOrNull(offset)) as P;
    case 26:
      return (reader.readStringOrNull(offset)) as P;
    case 27:
      return (reader.readStringOrNull(offset)) as P;
    case 28:
      return (reader.readBoolOrNull(offset)) as P;
    case 29:
      return (reader.readBoolOrNull(offset)) as P;
    case 30:
      return (reader.readBoolOrNull(offset)) as P;
    case 31:
      return (reader.readStringOrNull(offset)) as P;
    case 32:
      return (reader.readDoubleOrNull(offset)) as P;
    case 33:
      return (reader.readLongOrNull(offset)) as P;
    case 34:
      return (reader.readStringOrNull(offset)) as P;
    case 35:
      return (reader.readDoubleOrNull(offset)) as P;
    case 36:
      return (reader.readStringOrNull(offset)) as P;
    case 37:
      return (reader.readLongOrNull(offset)) as P;
    case 38:
      return (reader.readStringOrNull(offset)) as P;
    case 39:
      return (reader.readStringOrNull(offset)) as P;
    case 40:
      return (_ProductTableproductChildTypeValueEnumMap[
              reader.readByteOrNull(offset)] ??
          ProductType.normal) as P;
    case 41:
      return (reader.readStringOrNull(offset)) as P;
    case 42:
      return (reader.readStringOrNull(offset)) as P;
    case 43:
      return (reader.readStringOrNull(offset)) as P;
    case 44:
      return (reader.readLongOrNull(offset)) as P;
    case 45:
      return (reader.readStringOrNull(offset)) as P;
    case 46:
      return (reader.readStringOrNull(offset)) as P;
    case 47:
      return (reader.readStringOrNull(offset)) as P;
    case 48:
      return (_ProductTableproductTypeValueEnumMap[
              reader.readByteOrNull(offset)] ??
          ProductType.normal) as P;
    case 49:
      return (reader.readLongOrNull(offset)) as P;
    case 50:
      return (reader.readLongOrNull(offset)) as P;
    case 51:
      return (reader.readLongOrNull(offset)) as P;
    case 52:
      return (reader.readDoubleOrNull(offset)) as P;
    case 53:
      return (reader.readLongOrNull(offset)) as P;
    case 54:
      return (reader.readStringOrNull(offset)) as P;
    case 55:
      return (reader.readDoubleOrNull(offset)) as P;
    case 56:
      return (reader.readLongOrNull(offset)) as P;
    case 57:
      return (reader.readDoubleOrNull(offset)) as P;
    case 58:
      return (reader.readLongOrNull(offset)) as P;
    case 59:
      return (reader.readLongOrNull(offset)) as P;
    case 60:
      return (reader.readLongOrNull(offset)) as P;
    case 61:
      return (reader.readLongOrNull(offset)) as P;
    case 62:
      return (reader.readStringOrNull(offset)) as P;
    case 63:
      return (reader.readStringOrNull(offset)) as P;
    case 64:
      return (reader.readLongOrNull(offset)) as P;
    case 65:
      return (reader.readLongOrNull(offset)) as P;
    case 66:
      return (reader.readStringOrNull(offset)) as P;
    case 67:
      return (reader.readLongOrNull(offset)) as P;
    case 68:
      return (reader.readStringOrNull(offset)) as P;
    case 69:
      return (reader.readDoubleOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _ProductTableproductChildTypeEnumValueMap = {
  'normal': 0,
  'imei': 1,
  'combo': 2,
  'warranty': 3,
  'gift': 4,
  'attach': 5,
};
const _ProductTableproductChildTypeValueEnumMap = {
  0: ProductType.normal,
  1: ProductType.imei,
  2: ProductType.combo,
  3: ProductType.warranty,
  4: ProductType.gift,
  5: ProductType.attach,
};
const _ProductTableproductTypeEnumValueMap = {
  'normal': 0,
  'imei': 1,
  'combo': 2,
  'warranty': 3,
  'gift': 4,
  'attach': 5,
};
const _ProductTableproductTypeValueEnumMap = {
  0: ProductType.normal,
  1: ProductType.imei,
  2: ProductType.combo,
  3: ProductType.warranty,
  4: ProductType.gift,
  5: ProductType.attach,
};

Id _productTableGetId(ProductTable object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _productTableGetLinks(ProductTable object) {
  return [
    object.replacedWarrantyProduct,
    object.productsGift,
    object.productsAttach,
    object.productsWarranty,
    object.vouchers
  ];
}

void _productTableAttach(
    IsarCollection<dynamic> col, Id id, ProductTable object) {
  object.id = id;
  object.replacedWarrantyProduct.attach(
      col, col.isar.collection<ProductTable>(), r'replacedWarrantyProduct', id);
  object.productsGift
      .attach(col, col.isar.collection<ProductTable>(), r'productsGift', id);
  object.productsAttach
      .attach(col, col.isar.collection<ProductTable>(), r'productsAttach', id);
  object.productsWarranty.attach(
      col, col.isar.collection<ProductTable>(), r'productsWarranty', id);
  object.vouchers
      .attach(col, col.isar.collection<VoucherTable>(), r'vouchers', id);
}

extension ProductTableQueryWhereSort
    on QueryBuilder<ProductTable, ProductTable, QWhere> {
  QueryBuilder<ProductTable, ProductTable, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ProductTableQueryWhere
    on QueryBuilder<ProductTable, ProductTable, QWhereClause> {
  QueryBuilder<ProductTable, ProductTable, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ProductTableQueryFilter
    on QueryBuilder<ProductTable, ProductTable, QFilterCondition> {
  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      accessoryGroupCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'accessoryGroupCode',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      accessoryGroupCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'accessoryGroupCode',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      accessoryGroupCodeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'accessoryGroupCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      accessoryGroupCodeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'accessoryGroupCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      accessoryGroupCodeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'accessoryGroupCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      accessoryGroupCodeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'accessoryGroupCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      accessoryGroupCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'accessoryGroupCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      accessoryGroupCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'accessoryGroupCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      accessoryGroupCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'accessoryGroupCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      accessoryGroupCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'accessoryGroupCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      accessoryGroupCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'accessoryGroupCode',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      accessoryGroupCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'accessoryGroupCode',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      accessoryGroupIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'accessoryGroupId',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      accessoryGroupIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'accessoryGroupId',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      accessoryGroupIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'accessoryGroupId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      accessoryGroupIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'accessoryGroupId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      accessoryGroupIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'accessoryGroupId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      accessoryGroupIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'accessoryGroupId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      accessoryGroupIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'accessoryGroupId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      accessoryGroupIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'accessoryGroupId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      accessoryGroupIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'accessoryGroupId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      accessoryGroupIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'accessoryGroupId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      accessoryGroupIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'accessoryGroupId',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      accessoryGroupIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'accessoryGroupId',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      appearTimesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'appearTimes',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      appearTimesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'appearTimes',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      appearTimesEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'appearTimes',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      appearTimesGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'appearTimes',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      appearTimesLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'appearTimes',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      appearTimesBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'appearTimes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      attachedImeiIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'attachedImei',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      attachedImeiIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'attachedImei',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      attachedImeiEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'attachedImei',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      attachedImeiGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'attachedImei',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      attachedImeiLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'attachedImei',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      attachedImeiBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'attachedImei',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      attachedImeiStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'attachedImei',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      attachedImeiEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'attachedImei',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      attachedImeiContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'attachedImei',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      attachedImeiMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'attachedImei',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      attachedImeiIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'attachedImei',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      attachedImeiIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'attachedImei',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      barCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'barCode',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      barCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'barCode',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      barCodeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'barCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      barCodeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'barCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      barCodeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'barCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      barCodeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'barCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      barCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'barCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      barCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'barCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      barCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'barCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      barCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'barCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      barCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'barCode',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      barCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'barCode',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      belongBillDetailIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'belongBillDetailId',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      belongBillDetailIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'belongBillDetailId',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      belongBillDetailIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'belongBillDetailId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      belongBillDetailIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'belongBillDetailId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      belongBillDetailIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'belongBillDetailId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      belongBillDetailIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'belongBillDetailId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      belongBillDetailIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'belongBillDetailId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      belongBillDetailIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'belongBillDetailId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      belongBillDetailIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'belongBillDetailId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      belongBillDetailIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'belongBillDetailId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      belongBillDetailIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'belongBillDetailId',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      belongBillDetailIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'belongBillDetailId',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      belongToWarrantyImeiIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'belongToWarrantyImei',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      belongToWarrantyImeiIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'belongToWarrantyImei',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      belongToWarrantyImeiEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'belongToWarrantyImei',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      brandIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'brand',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      brandIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'brand',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition> brandEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'brand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      brandGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'brand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition> brandLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'brand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition> brandBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'brand',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      brandStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'brand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition> brandEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'brand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition> brandContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'brand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition> brandMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'brand',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      brandIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'brand',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      brandIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'brand',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      cartIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cartId',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      cartIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cartId',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition> cartIdEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cartId',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      cartIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cartId',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      cartIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cartId',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition> cartIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cartId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition> codeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'code',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      codeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'code',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition> codeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      codeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition> codeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition> codeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'code',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      codeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition> codeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition> codeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition> codeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'code',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      codeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'code',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      codeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'code',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      comboIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'comboId',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      comboIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'comboId',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      comboIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'comboId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      comboIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'comboId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      comboIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'comboId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      comboIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'comboId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      comboIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'comboId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      comboIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'comboId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      comboIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'comboId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      comboIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'comboId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      comboIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'comboId',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      comboIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'comboId',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      companyIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'companyId',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      companyIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'companyId',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      companyIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'companyId',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      companyIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'companyId',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      companyIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'companyId',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      companyIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'companyId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      createdAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      createdAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      createdAtEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      createdAtGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      createdAtLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      createdAtBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      createdAtStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'createdAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      createdAtEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'createdAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      createdAtContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'createdAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      createdAtMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'createdAt',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      createdAtIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      createdAtIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'createdAt',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      customerDiscountForProductStrIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'customerDiscountForProductStr',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      customerDiscountForProductStrIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'customerDiscountForProductStr',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      customerDiscountForProductStrEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customerDiscountForProductStr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      customerDiscountForProductStrGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'customerDiscountForProductStr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      customerDiscountForProductStrLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'customerDiscountForProductStr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      customerDiscountForProductStrBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'customerDiscountForProductStr',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      customerDiscountForProductStrStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'customerDiscountForProductStr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      customerDiscountForProductStrEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'customerDiscountForProductStr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      customerDiscountForProductStrContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'customerDiscountForProductStr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      customerDiscountForProductStrMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'customerDiscountForProductStr',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      customerDiscountForProductStrIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customerDiscountForProductStr',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      customerDiscountForProductStrIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'customerDiscountForProductStr',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      discountAmountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'discountAmount',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      discountAmountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'discountAmount',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      discountAmountEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'discountAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      discountAmountGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'discountAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      discountAmountLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'discountAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      discountAmountBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'discountAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      discountByHandStrIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'discountByHandStr',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      discountByHandStrIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'discountByHandStr',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      discountByHandStrEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'discountByHandStr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      discountByHandStrGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'discountByHandStr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      discountByHandStrLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'discountByHandStr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      discountByHandStrBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'discountByHandStr',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      discountByHandStrStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'discountByHandStr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      discountByHandStrEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'discountByHandStr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      discountByHandStrContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'discountByHandStr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      discountByHandStrMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'discountByHandStr',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      discountByHandStrIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'discountByHandStr',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      discountByHandStrIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'discountByHandStr',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      discountPriceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'discountPrice',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      discountPriceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'discountPrice',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      discountPriceEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'discountPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      discountPriceGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'discountPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      discountPriceLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'discountPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      discountPriceBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'discountPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      discountProgramIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'discountProgramId',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      discountProgramIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'discountProgramId',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      discountProgramIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'discountProgramId',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      discountProgramIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'discountProgramId',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      discountProgramIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'discountProgramId',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      discountProgramIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'discountProgramId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      discountTypeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'discountType',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      discountTypeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'discountType',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      discountTypeEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'discountType',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      discountTypeGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'discountType',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      discountTypeLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'discountType',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      discountTypeBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'discountType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      discountValueIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'discountValue',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      discountValueIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'discountValue',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      discountValueEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'discountValue',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      discountValueGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'discountValue',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      discountValueLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'discountValue',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      discountValueBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'discountValue',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      externalImeiIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'externalImeiId',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      externalImeiIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'externalImeiId',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      externalImeiIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'externalImeiId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      externalImeiIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'externalImeiId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      externalImeiIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'externalImeiId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      externalImeiIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'externalImeiId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      externalImeiIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'externalImeiId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      externalImeiIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'externalImeiId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      externalImeiIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'externalImeiId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      externalImeiIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'externalImeiId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      externalImeiIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'externalImeiId',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      externalImeiIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'externalImeiId',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      externalImeiNoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'externalImeiNo',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      externalImeiNoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'externalImeiNo',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      externalImeiNoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'externalImeiNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      externalImeiNoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'externalImeiNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      externalImeiNoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'externalImeiNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      externalImeiNoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'externalImeiNo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      externalImeiNoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'externalImeiNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      externalImeiNoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'externalImeiNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      externalImeiNoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'externalImeiNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      externalImeiNoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'externalImeiNo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      externalImeiNoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'externalImeiNo',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      externalImeiNoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'externalImeiNo',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      flexibleComboIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'flexibleComboId',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      flexibleComboIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'flexibleComboId',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      flexibleComboIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'flexibleComboId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      flexibleComboIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'flexibleComboId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      flexibleComboIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'flexibleComboId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      flexibleComboIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'flexibleComboId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      flexibleComboIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'flexibleComboId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      flexibleComboIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'flexibleComboId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      flexibleComboIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'flexibleComboId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      flexibleComboIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'flexibleComboId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      flexibleComboIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'flexibleComboId',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      flexibleComboIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'flexibleComboId',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      flexibleComboItemIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'flexibleComboItemId',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      flexibleComboItemIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'flexibleComboItemId',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      flexibleComboItemIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'flexibleComboItemId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      flexibleComboItemIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'flexibleComboItemId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      flexibleComboItemIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'flexibleComboItemId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      flexibleComboItemIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'flexibleComboItemId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      flexibleComboItemIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'flexibleComboItemId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      flexibleComboItemIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'flexibleComboItemId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      flexibleComboItemIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'flexibleComboItemId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      flexibleComboItemIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'flexibleComboItemId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      flexibleComboItemIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'flexibleComboItemId',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      flexibleComboItemIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'flexibleComboItemId',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      fromPriceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fromPrice',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      fromPriceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fromPrice',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      fromPriceEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fromPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      fromPriceGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fromPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      fromPriceLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fromPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      fromPriceBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fromPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      fulfillmentTypeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fulfillmentType',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      fulfillmentTypeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fulfillmentType',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      fulfillmentTypeEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fulfillmentType',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      fulfillmentTypeGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fulfillmentType',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      fulfillmentTypeLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fulfillmentType',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      fulfillmentTypeBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fulfillmentType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      imageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'image',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      imageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'image',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition> imageEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'image',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      imageGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'image',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition> imageLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'image',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition> imageBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'image',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      imageStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'image',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition> imageEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'image',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition> imageContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'image',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition> imageMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'image',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      imageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'image',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      imageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'image',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      imeiStrIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'imeiStr',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      imeiStrIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'imeiStr',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      imeiStrEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imeiStr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      imeiStrGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'imeiStr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      imeiStrLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'imeiStr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      imeiStrBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'imeiStr',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      imeiStrStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'imeiStr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      imeiStrEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'imeiStr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      imeiStrContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'imeiStr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      imeiStrMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'imeiStr',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      imeiStrIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imeiStr',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      imeiStrIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'imeiStr',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      isComboProductIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isComboProduct',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      isComboProductIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isComboProduct',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      isComboProductEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isComboProduct',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      isLostProductIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isLostProduct',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      isLostProductIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isLostProduct',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      isLostProductEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isLostProduct',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      isRepurchasePriceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isRepurchasePrice',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      isRepurchasePriceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isRepurchasePrice',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      isRepurchasePriceEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isRepurchasePrice',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      itemIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'itemId',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      itemIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'itemId',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition> itemIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'itemId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      itemIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'itemId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      itemIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'itemId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition> itemIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'itemId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      itemIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'itemId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      itemIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'itemId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      itemIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'itemId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition> itemIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'itemId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      itemIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'itemId',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      itemIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'itemId',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      listedPriceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'listedPrice',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      listedPriceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'listedPrice',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      listedPriceEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'listedPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      listedPriceGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'listedPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      listedPriceLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'listedPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      listedPriceBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'listedPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      merchantIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'merchantId',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      merchantIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'merchantId',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      merchantIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'merchantId',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      merchantIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'merchantId',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      merchantIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'merchantId',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      merchantIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'merchantId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition> noteIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'note',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      noteIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'note',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition> noteEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'note',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      noteGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'note',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition> noteLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'note',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition> noteBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'note',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      noteStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'note',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition> noteEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'note',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition> noteContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'note',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition> noteMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'note',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      noteIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'note',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      noteIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'note',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      originalPriceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'originalPrice',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      originalPriceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'originalPrice',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      originalPriceEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'originalPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      originalPriceGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'originalPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      originalPriceLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'originalPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      originalPriceBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'originalPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      parentProductIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'parentProductId',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      parentProductIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'parentProductId',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      parentProductIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'parentProductId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      parentProductIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'parentProductId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      parentProductIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'parentProductId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      parentProductIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'parentProductId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      parentProductIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'parentProductId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      parentProductIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'parentProductId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      parentProductIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'parentProductId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      parentProductIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'parentProductId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      parentProductIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'parentProductId',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      parentProductIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'parentProductId',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productCategoryIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'productCategory',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productCategoryIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'productCategory',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productCategoryEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'productCategory',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productCategoryGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'productCategory',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productCategoryLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'productCategory',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productCategoryBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'productCategory',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productChildComboStrIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'productChildComboStr',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productChildComboStrIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'productChildComboStr',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productChildComboStrEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'productChildComboStr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productChildComboStrGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'productChildComboStr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productChildComboStrLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'productChildComboStr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productChildComboStrBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'productChildComboStr',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productChildComboStrStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'productChildComboStr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productChildComboStrEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'productChildComboStr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productChildComboStrContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'productChildComboStr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productChildComboStrMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'productChildComboStr',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productChildComboStrIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'productChildComboStr',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productChildComboStrIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'productChildComboStr',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productChildStrIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'productChildStr',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productChildStrIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'productChildStr',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productChildStrEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'productChildStr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productChildStrGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'productChildStr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productChildStrLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'productChildStr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productChildStrBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'productChildStr',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productChildStrStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'productChildStr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productChildStrEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'productChildStr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productChildStrContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'productChildStr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productChildStrMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'productChildStr',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productChildStrIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'productChildStr',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productChildStrIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'productChildStr',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productChildTypeEqualTo(ProductType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'productChildType',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productChildTypeGreaterThan(
    ProductType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'productChildType',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productChildTypeLessThan(
    ProductType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'productChildType',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productChildTypeBetween(
    ProductType lower,
    ProductType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'productChildType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'productCode',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'productCode',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productCodeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'productCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productCodeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'productCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productCodeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'productCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productCodeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'productCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'productCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'productCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'productCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'productCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'productCode',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'productCode',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productCodeVatIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'productCodeVat',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productCodeVatIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'productCodeVat',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productCodeVatEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'productCodeVat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productCodeVatGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'productCodeVat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productCodeVatLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'productCodeVat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productCodeVatBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'productCodeVat',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productCodeVatStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'productCodeVat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productCodeVatEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'productCodeVat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productCodeVatContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'productCodeVat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productCodeVatMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'productCodeVat',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productCodeVatIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'productCodeVat',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productCodeVatIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'productCodeVat',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'productId',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'productId',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'productId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'productId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'productId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'productId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'productId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'productId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'productId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'productId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'productId',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'productId',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productInComboQuantityIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'productInComboQuantity',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productInComboQuantityIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'productInComboQuantity',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productInComboQuantityEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'productInComboQuantity',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productInComboQuantityGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'productInComboQuantity',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productInComboQuantityLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'productInComboQuantity',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productInComboQuantityBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'productInComboQuantity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'productName',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'productName',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'productName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'productName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'productName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'productName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'productName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'productName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'productName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'productName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'productName',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'productName',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productNameVatIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'productNameVat',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productNameVatIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'productNameVat',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productNameVatEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'productNameVat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productNameVatGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'productNameVat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productNameVatLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'productNameVat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productNameVatBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'productNameVat',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productNameVatStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'productNameVat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productNameVatEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'productNameVat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productNameVatContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'productNameVat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productNameVatMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'productNameVat',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productNameVatIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'productNameVat',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productNameVatIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'productNameVat',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productTradeNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'productTradeName',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productTradeNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'productTradeName',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productTradeNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'productTradeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productTradeNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'productTradeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productTradeNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'productTradeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productTradeNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'productTradeName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productTradeNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'productTradeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productTradeNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'productTradeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productTradeNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'productTradeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productTradeNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'productTradeName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productTradeNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'productTradeName',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productTradeNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'productTradeName',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productTypeEqualTo(ProductType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'productType',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productTypeGreaterThan(
    ProductType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'productType',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productTypeLessThan(
    ProductType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'productType',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productTypeBetween(
    ProductType lower,
    ProductType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'productType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productWebCategoryIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'productWebCategory',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productWebCategoryIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'productWebCategory',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productWebCategoryEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'productWebCategory',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productWebCategoryGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'productWebCategory',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productWebCategoryLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'productWebCategory',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productWebCategoryBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'productWebCategory',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      promotionIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'promotionId',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      promotionIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'promotionId',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      promotionIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'promotionId',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      promotionIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'promotionId',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      promotionIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'promotionId',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      promotionIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'promotionId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      quantityIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'quantity',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      quantityIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'quantity',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      quantityEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quantity',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      quantityGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'quantity',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      quantityLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'quantity',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      quantityBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'quantity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      repurchasePriceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'repurchasePrice',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      repurchasePriceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'repurchasePrice',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      repurchasePriceEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'repurchasePrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      repurchasePriceGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'repurchasePrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      repurchasePriceLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'repurchasePrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      repurchasePriceBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'repurchasePrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      returnSellingPriceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'returnSellingPrice',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      returnSellingPriceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'returnSellingPrice',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      returnSellingPriceEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'returnSellingPrice',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      returnSellingPriceGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'returnSellingPrice',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      returnSellingPriceLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'returnSellingPrice',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      returnSellingPriceBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'returnSellingPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      selectImeiReasonIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'selectImeiReason',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      selectImeiReasonIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'selectImeiReason',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      selectImeiReasonEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'selectImeiReason',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      selectImeiReasonGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'selectImeiReason',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      selectImeiReasonLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'selectImeiReason',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      selectImeiReasonBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'selectImeiReason',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      selectImeiReasonStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'selectImeiReason',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      selectImeiReasonEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'selectImeiReason',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      selectImeiReasonContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'selectImeiReason',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      selectImeiReasonMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'selectImeiReason',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      selectImeiReasonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'selectImeiReason',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      selectImeiReasonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'selectImeiReason',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      sellingPriceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sellingPrice',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      sellingPriceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sellingPrice',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      sellingPriceEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sellingPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      sellingPriceGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sellingPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      sellingPriceLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sellingPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      sellingPriceBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sellingPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      statusIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'status',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      statusIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'status',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition> statusEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      statusGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      statusLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition> statusBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'status',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      toPriceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'toPrice',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      toPriceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'toPrice',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      toPriceEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'toPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      toPriceGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'toPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      toPriceLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'toPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      toPriceBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'toPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      totalQuantityInStockIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'totalQuantityInStock',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      totalQuantityInStockIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'totalQuantityInStock',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      totalQuantityInStockEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalQuantityInStock',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      totalQuantityInStockGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalQuantityInStock',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      totalQuantityInStockLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalQuantityInStock',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      totalQuantityInStockBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalQuantityInStock',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      totalQuantityInStoreIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'totalQuantityInStore',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      totalQuantityInStoreIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'totalQuantityInStore',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      totalQuantityInStoreEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalQuantityInStore',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      totalQuantityInStoreGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalQuantityInStore',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      totalQuantityInStoreLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalQuantityInStore',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      totalQuantityInStoreBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalQuantityInStore',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      totalQuantityInTransferIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'totalQuantityInTransfer',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      totalQuantityInTransferIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'totalQuantityInTransfer',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      totalQuantityInTransferEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalQuantityInTransfer',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      totalQuantityInTransferGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalQuantityInTransfer',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      totalQuantityInTransferLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalQuantityInTransfer',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      totalQuantityInTransferBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalQuantityInTransfer',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      unitIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'unitId',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      unitIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'unitId',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition> unitIdEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unitId',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      unitIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'unitId',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      unitIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'unitId',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition> unitIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'unitId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      warrantyAddressIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'warrantyAddress',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      warrantyAddressIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'warrantyAddress',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      warrantyAddressEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'warrantyAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      warrantyAddressGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'warrantyAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      warrantyAddressLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'warrantyAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      warrantyAddressBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'warrantyAddress',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      warrantyAddressStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'warrantyAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      warrantyAddressEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'warrantyAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      warrantyAddressContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'warrantyAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      warrantyAddressMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'warrantyAddress',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      warrantyAddressIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'warrantyAddress',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      warrantyAddressIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'warrantyAddress',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      warrantyDescriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'warrantyDescription',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      warrantyDescriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'warrantyDescription',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      warrantyDescriptionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'warrantyDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      warrantyDescriptionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'warrantyDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      warrantyDescriptionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'warrantyDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      warrantyDescriptionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'warrantyDescription',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      warrantyDescriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'warrantyDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      warrantyDescriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'warrantyDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      warrantyDescriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'warrantyDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      warrantyDescriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'warrantyDescription',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      warrantyDescriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'warrantyDescription',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      warrantyDescriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'warrantyDescription',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      warrantyMonthNoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'warrantyMonthNo',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      warrantyMonthNoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'warrantyMonthNo',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      warrantyMonthNoEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'warrantyMonthNo',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      warrantyMonthNoGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'warrantyMonthNo',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      warrantyMonthNoLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'warrantyMonthNo',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      warrantyMonthNoBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'warrantyMonthNo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      warrantyPackageIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'warrantyPackageId',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      warrantyPackageIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'warrantyPackageId',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      warrantyPackageIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'warrantyPackageId',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      warrantyPackageIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'warrantyPackageId',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      warrantyPackageIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'warrantyPackageId',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      warrantyPackageIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'warrantyPackageId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      warrantyPhoneIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'warrantyPhone',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      warrantyPhoneIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'warrantyPhone',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      warrantyPhoneEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'warrantyPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      warrantyPhoneGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'warrantyPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      warrantyPhoneLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'warrantyPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      warrantyPhoneBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'warrantyPhone',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      warrantyPhoneStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'warrantyPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      warrantyPhoneEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'warrantyPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      warrantyPhoneContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'warrantyPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      warrantyPhoneMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'warrantyPhone',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      warrantyPhoneIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'warrantyPhone',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      warrantyPhoneIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'warrantyPhone',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      warrantyReasonIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'warrantyReasonId',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      warrantyReasonIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'warrantyReasonId',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      warrantyReasonIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'warrantyReasonId',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      warrantyReasonIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'warrantyReasonId',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      warrantyReasonIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'warrantyReasonId',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      warrantyReasonIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'warrantyReasonId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      warrantyReasonNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'warrantyReasonName',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      warrantyReasonNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'warrantyReasonName',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      warrantyReasonNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'warrantyReasonName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      warrantyReasonNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'warrantyReasonName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      warrantyReasonNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'warrantyReasonName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      warrantyReasonNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'warrantyReasonName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      warrantyReasonNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'warrantyReasonName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      warrantyReasonNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'warrantyReasonName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      warrantyReasonNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'warrantyReasonName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      warrantyReasonNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'warrantyReasonName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      warrantyReasonNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'warrantyReasonName',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      warrantyReasonNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'warrantyReasonName',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      wholesalePriceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'wholesalePrice',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      wholesalePriceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'wholesalePrice',
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      wholesalePriceEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'wholesalePrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      wholesalePriceGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'wholesalePrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      wholesalePriceLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'wholesalePrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      wholesalePriceBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'wholesalePrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension ProductTableQueryObject
    on QueryBuilder<ProductTable, ProductTable, QFilterCondition> {}

extension ProductTableQueryLinks
    on QueryBuilder<ProductTable, ProductTable, QFilterCondition> {
  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      replacedWarrantyProduct(FilterQuery<ProductTable> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'replacedWarrantyProduct');
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      replacedWarrantyProductIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'replacedWarrantyProduct', 0, true, 0, true);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition> productsGift(
      FilterQuery<ProductTable> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'productsGift');
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productsGiftLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'productsGift', length, true, length, true);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productsGiftIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'productsGift', 0, true, 0, true);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productsGiftIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'productsGift', 0, false, 999999, true);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productsGiftLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'productsGift', 0, true, length, include);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productsGiftLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'productsGift', length, include, 999999, true);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productsGiftLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'productsGift', lower, includeLower, upper, includeUpper);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productsAttach(FilterQuery<ProductTable> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'productsAttach');
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productsAttachLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'productsAttach', length, true, length, true);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productsAttachIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'productsAttach', 0, true, 0, true);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productsAttachIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'productsAttach', 0, false, 999999, true);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productsAttachLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'productsAttach', 0, true, length, include);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productsAttachLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'productsAttach', length, include, 999999, true);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productsAttachLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'productsAttach', lower, includeLower, upper, includeUpper);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productsWarranty(FilterQuery<ProductTable> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'productsWarranty');
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productsWarrantyLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'productsWarranty', length, true, length, true);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productsWarrantyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'productsWarranty', 0, true, 0, true);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productsWarrantyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'productsWarranty', 0, false, 999999, true);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productsWarrantyLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'productsWarranty', 0, true, length, include);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productsWarrantyLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'productsWarranty', length, include, 999999, true);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      productsWarrantyLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'productsWarranty', lower, includeLower, upper, includeUpper);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition> vouchers(
      FilterQuery<VoucherTable> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'vouchers');
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      vouchersLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'vouchers', length, true, length, true);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      vouchersIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'vouchers', 0, true, 0, true);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      vouchersIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'vouchers', 0, false, 999999, true);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      vouchersLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'vouchers', 0, true, length, include);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      vouchersLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'vouchers', length, include, 999999, true);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterFilterCondition>
      vouchersLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'vouchers', lower, includeLower, upper, includeUpper);
    });
  }
}

extension ProductTableQuerySortBy
    on QueryBuilder<ProductTable, ProductTable, QSortBy> {
  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      sortByAccessoryGroupCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accessoryGroupCode', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      sortByAccessoryGroupCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accessoryGroupCode', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      sortByAccessoryGroupId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accessoryGroupId', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      sortByAccessoryGroupIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accessoryGroupId', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy> sortByAppearTimes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'appearTimes', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      sortByAppearTimesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'appearTimes', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy> sortByAttachedImei() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attachedImei', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      sortByAttachedImeiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attachedImei', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy> sortByBarCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'barCode', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy> sortByBarCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'barCode', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      sortByBelongBillDetailId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'belongBillDetailId', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      sortByBelongBillDetailIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'belongBillDetailId', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      sortByBelongToWarrantyImei() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'belongToWarrantyImei', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      sortByBelongToWarrantyImeiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'belongToWarrantyImei', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy> sortByBrand() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brand', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy> sortByBrandDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brand', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy> sortByCartId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cartId', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy> sortByCartIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cartId', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy> sortByCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'code', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy> sortByCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'code', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy> sortByComboId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comboId', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy> sortByComboIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comboId', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy> sortByCompanyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyId', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy> sortByCompanyIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyId', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      sortByCustomerDiscountForProductStr() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerDiscountForProductStr', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      sortByCustomerDiscountForProductStrDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerDiscountForProductStr', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      sortByDiscountAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discountAmount', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      sortByDiscountAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discountAmount', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      sortByDiscountByHandStr() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discountByHandStr', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      sortByDiscountByHandStrDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discountByHandStr', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy> sortByDiscountPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discountPrice', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      sortByDiscountPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discountPrice', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      sortByDiscountProgramId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discountProgramId', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      sortByDiscountProgramIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discountProgramId', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy> sortByDiscountType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discountType', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      sortByDiscountTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discountType', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy> sortByDiscountValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discountValue', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      sortByDiscountValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discountValue', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      sortByExternalImeiId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'externalImeiId', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      sortByExternalImeiIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'externalImeiId', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      sortByExternalImeiNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'externalImeiNo', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      sortByExternalImeiNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'externalImeiNo', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      sortByFlexibleComboId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'flexibleComboId', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      sortByFlexibleComboIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'flexibleComboId', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      sortByFlexibleComboItemId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'flexibleComboItemId', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      sortByFlexibleComboItemIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'flexibleComboItemId', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy> sortByFromPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fromPrice', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy> sortByFromPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fromPrice', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      sortByFulfillmentType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fulfillmentType', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      sortByFulfillmentTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fulfillmentType', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy> sortByImage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'image', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy> sortByImageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'image', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy> sortByImeiStr() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imeiStr', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy> sortByImeiStrDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imeiStr', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      sortByIsComboProduct() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isComboProduct', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      sortByIsComboProductDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isComboProduct', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy> sortByIsLostProduct() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLostProduct', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      sortByIsLostProductDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLostProduct', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      sortByIsRepurchasePrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isRepurchasePrice', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      sortByIsRepurchasePriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isRepurchasePrice', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy> sortByItemId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemId', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy> sortByItemIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemId', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy> sortByListedPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'listedPrice', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      sortByListedPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'listedPrice', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy> sortByMerchantId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'merchantId', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      sortByMerchantIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'merchantId', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy> sortByNote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy> sortByNoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy> sortByOriginalPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'originalPrice', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      sortByOriginalPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'originalPrice', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      sortByParentProductId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentProductId', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      sortByParentProductIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentProductId', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      sortByProductCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productCategory', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      sortByProductCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productCategory', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      sortByProductChildComboStr() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productChildComboStr', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      sortByProductChildComboStrDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productChildComboStr', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      sortByProductChildStr() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productChildStr', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      sortByProductChildStrDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productChildStr', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      sortByProductChildType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productChildType', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      sortByProductChildTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productChildType', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy> sortByProductCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productCode', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      sortByProductCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productCode', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      sortByProductCodeVat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productCodeVat', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      sortByProductCodeVatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productCodeVat', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy> sortByProductId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productId', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy> sortByProductIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productId', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      sortByProductInComboQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productInComboQuantity', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      sortByProductInComboQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productInComboQuantity', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy> sortByProductName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productName', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      sortByProductNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productName', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      sortByProductNameVat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productNameVat', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      sortByProductNameVatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productNameVat', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      sortByProductTradeName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productTradeName', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      sortByProductTradeNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productTradeName', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy> sortByProductType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productType', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      sortByProductTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productType', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      sortByProductWebCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productWebCategory', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      sortByProductWebCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productWebCategory', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy> sortByPromotionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promotionId', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      sortByPromotionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promotionId', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy> sortByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy> sortByQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      sortByRepurchasePrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'repurchasePrice', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      sortByRepurchasePriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'repurchasePrice', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      sortByReturnSellingPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'returnSellingPrice', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      sortByReturnSellingPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'returnSellingPrice', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      sortBySelectImeiReason() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'selectImeiReason', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      sortBySelectImeiReasonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'selectImeiReason', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy> sortBySellingPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sellingPrice', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      sortBySellingPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sellingPrice', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy> sortByToPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'toPrice', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy> sortByToPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'toPrice', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      sortByTotalQuantityInStock() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalQuantityInStock', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      sortByTotalQuantityInStockDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalQuantityInStock', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      sortByTotalQuantityInStore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalQuantityInStore', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      sortByTotalQuantityInStoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalQuantityInStore', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      sortByTotalQuantityInTransfer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalQuantityInTransfer', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      sortByTotalQuantityInTransferDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalQuantityInTransfer', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy> sortByUnitId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitId', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy> sortByUnitIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitId', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      sortByWarrantyAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warrantyAddress', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      sortByWarrantyAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warrantyAddress', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      sortByWarrantyDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warrantyDescription', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      sortByWarrantyDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warrantyDescription', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      sortByWarrantyMonthNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warrantyMonthNo', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      sortByWarrantyMonthNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warrantyMonthNo', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      sortByWarrantyPackageId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warrantyPackageId', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      sortByWarrantyPackageIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warrantyPackageId', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy> sortByWarrantyPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warrantyPhone', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      sortByWarrantyPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warrantyPhone', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      sortByWarrantyReasonId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warrantyReasonId', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      sortByWarrantyReasonIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warrantyReasonId', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      sortByWarrantyReasonName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warrantyReasonName', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      sortByWarrantyReasonNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warrantyReasonName', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      sortByWholesalePrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wholesalePrice', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      sortByWholesalePriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wholesalePrice', Sort.desc);
    });
  }
}

extension ProductTableQuerySortThenBy
    on QueryBuilder<ProductTable, ProductTable, QSortThenBy> {
  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      thenByAccessoryGroupCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accessoryGroupCode', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      thenByAccessoryGroupCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accessoryGroupCode', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      thenByAccessoryGroupId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accessoryGroupId', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      thenByAccessoryGroupIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accessoryGroupId', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy> thenByAppearTimes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'appearTimes', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      thenByAppearTimesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'appearTimes', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy> thenByAttachedImei() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attachedImei', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      thenByAttachedImeiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attachedImei', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy> thenByBarCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'barCode', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy> thenByBarCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'barCode', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      thenByBelongBillDetailId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'belongBillDetailId', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      thenByBelongBillDetailIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'belongBillDetailId', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      thenByBelongToWarrantyImei() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'belongToWarrantyImei', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      thenByBelongToWarrantyImeiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'belongToWarrantyImei', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy> thenByBrand() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brand', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy> thenByBrandDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brand', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy> thenByCartId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cartId', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy> thenByCartIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cartId', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy> thenByCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'code', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy> thenByCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'code', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy> thenByComboId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comboId', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy> thenByComboIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comboId', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy> thenByCompanyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyId', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy> thenByCompanyIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyId', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      thenByCustomerDiscountForProductStr() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerDiscountForProductStr', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      thenByCustomerDiscountForProductStrDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerDiscountForProductStr', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      thenByDiscountAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discountAmount', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      thenByDiscountAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discountAmount', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      thenByDiscountByHandStr() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discountByHandStr', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      thenByDiscountByHandStrDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discountByHandStr', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy> thenByDiscountPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discountPrice', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      thenByDiscountPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discountPrice', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      thenByDiscountProgramId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discountProgramId', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      thenByDiscountProgramIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discountProgramId', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy> thenByDiscountType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discountType', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      thenByDiscountTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discountType', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy> thenByDiscountValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discountValue', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      thenByDiscountValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discountValue', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      thenByExternalImeiId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'externalImeiId', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      thenByExternalImeiIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'externalImeiId', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      thenByExternalImeiNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'externalImeiNo', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      thenByExternalImeiNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'externalImeiNo', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      thenByFlexibleComboId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'flexibleComboId', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      thenByFlexibleComboIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'flexibleComboId', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      thenByFlexibleComboItemId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'flexibleComboItemId', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      thenByFlexibleComboItemIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'flexibleComboItemId', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy> thenByFromPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fromPrice', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy> thenByFromPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fromPrice', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      thenByFulfillmentType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fulfillmentType', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      thenByFulfillmentTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fulfillmentType', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy> thenByImage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'image', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy> thenByImageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'image', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy> thenByImeiStr() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imeiStr', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy> thenByImeiStrDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imeiStr', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      thenByIsComboProduct() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isComboProduct', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      thenByIsComboProductDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isComboProduct', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy> thenByIsLostProduct() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLostProduct', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      thenByIsLostProductDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLostProduct', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      thenByIsRepurchasePrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isRepurchasePrice', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      thenByIsRepurchasePriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isRepurchasePrice', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy> thenByItemId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemId', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy> thenByItemIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemId', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy> thenByListedPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'listedPrice', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      thenByListedPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'listedPrice', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy> thenByMerchantId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'merchantId', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      thenByMerchantIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'merchantId', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy> thenByNote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy> thenByNoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy> thenByOriginalPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'originalPrice', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      thenByOriginalPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'originalPrice', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      thenByParentProductId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentProductId', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      thenByParentProductIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentProductId', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      thenByProductCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productCategory', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      thenByProductCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productCategory', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      thenByProductChildComboStr() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productChildComboStr', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      thenByProductChildComboStrDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productChildComboStr', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      thenByProductChildStr() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productChildStr', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      thenByProductChildStrDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productChildStr', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      thenByProductChildType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productChildType', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      thenByProductChildTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productChildType', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy> thenByProductCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productCode', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      thenByProductCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productCode', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      thenByProductCodeVat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productCodeVat', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      thenByProductCodeVatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productCodeVat', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy> thenByProductId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productId', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy> thenByProductIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productId', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      thenByProductInComboQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productInComboQuantity', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      thenByProductInComboQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productInComboQuantity', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy> thenByProductName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productName', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      thenByProductNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productName', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      thenByProductNameVat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productNameVat', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      thenByProductNameVatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productNameVat', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      thenByProductTradeName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productTradeName', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      thenByProductTradeNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productTradeName', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy> thenByProductType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productType', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      thenByProductTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productType', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      thenByProductWebCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productWebCategory', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      thenByProductWebCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productWebCategory', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy> thenByPromotionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promotionId', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      thenByPromotionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promotionId', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy> thenByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy> thenByQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      thenByRepurchasePrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'repurchasePrice', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      thenByRepurchasePriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'repurchasePrice', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      thenByReturnSellingPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'returnSellingPrice', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      thenByReturnSellingPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'returnSellingPrice', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      thenBySelectImeiReason() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'selectImeiReason', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      thenBySelectImeiReasonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'selectImeiReason', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy> thenBySellingPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sellingPrice', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      thenBySellingPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sellingPrice', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy> thenByToPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'toPrice', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy> thenByToPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'toPrice', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      thenByTotalQuantityInStock() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalQuantityInStock', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      thenByTotalQuantityInStockDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalQuantityInStock', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      thenByTotalQuantityInStore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalQuantityInStore', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      thenByTotalQuantityInStoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalQuantityInStore', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      thenByTotalQuantityInTransfer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalQuantityInTransfer', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      thenByTotalQuantityInTransferDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalQuantityInTransfer', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy> thenByUnitId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitId', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy> thenByUnitIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitId', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      thenByWarrantyAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warrantyAddress', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      thenByWarrantyAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warrantyAddress', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      thenByWarrantyDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warrantyDescription', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      thenByWarrantyDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warrantyDescription', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      thenByWarrantyMonthNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warrantyMonthNo', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      thenByWarrantyMonthNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warrantyMonthNo', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      thenByWarrantyPackageId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warrantyPackageId', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      thenByWarrantyPackageIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warrantyPackageId', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy> thenByWarrantyPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warrantyPhone', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      thenByWarrantyPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warrantyPhone', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      thenByWarrantyReasonId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warrantyReasonId', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      thenByWarrantyReasonIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warrantyReasonId', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      thenByWarrantyReasonName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warrantyReasonName', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      thenByWarrantyReasonNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warrantyReasonName', Sort.desc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      thenByWholesalePrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wholesalePrice', Sort.asc);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QAfterSortBy>
      thenByWholesalePriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wholesalePrice', Sort.desc);
    });
  }
}

extension ProductTableQueryWhereDistinct
    on QueryBuilder<ProductTable, ProductTable, QDistinct> {
  QueryBuilder<ProductTable, ProductTable, QDistinct>
      distinctByAccessoryGroupCode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'accessoryGroupCode',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QDistinct>
      distinctByAccessoryGroupId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'accessoryGroupId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QDistinct> distinctByAppearTimes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'appearTimes');
    });
  }

  QueryBuilder<ProductTable, ProductTable, QDistinct> distinctByAttachedImei(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'attachedImei', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QDistinct> distinctByBarCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'barCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QDistinct>
      distinctByBelongBillDetailId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'belongBillDetailId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QDistinct>
      distinctByBelongToWarrantyImei() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'belongToWarrantyImei');
    });
  }

  QueryBuilder<ProductTable, ProductTable, QDistinct> distinctByBrand(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'brand', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QDistinct> distinctByCartId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cartId');
    });
  }

  QueryBuilder<ProductTable, ProductTable, QDistinct> distinctByCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'code', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QDistinct> distinctByComboId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'comboId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QDistinct> distinctByCompanyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'companyId');
    });
  }

  QueryBuilder<ProductTable, ProductTable, QDistinct> distinctByCreatedAt(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QDistinct>
      distinctByCustomerDiscountForProductStr({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'customerDiscountForProductStr',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QDistinct>
      distinctByDiscountAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'discountAmount');
    });
  }

  QueryBuilder<ProductTable, ProductTable, QDistinct>
      distinctByDiscountByHandStr({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'discountByHandStr',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QDistinct>
      distinctByDiscountPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'discountPrice');
    });
  }

  QueryBuilder<ProductTable, ProductTable, QDistinct>
      distinctByDiscountProgramId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'discountProgramId');
    });
  }

  QueryBuilder<ProductTable, ProductTable, QDistinct> distinctByDiscountType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'discountType');
    });
  }

  QueryBuilder<ProductTable, ProductTable, QDistinct>
      distinctByDiscountValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'discountValue');
    });
  }

  QueryBuilder<ProductTable, ProductTable, QDistinct> distinctByExternalImeiId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'externalImeiId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QDistinct> distinctByExternalImeiNo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'externalImeiNo',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QDistinct> distinctByFlexibleComboId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'flexibleComboId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QDistinct>
      distinctByFlexibleComboItemId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'flexibleComboItemId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QDistinct> distinctByFromPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fromPrice');
    });
  }

  QueryBuilder<ProductTable, ProductTable, QDistinct>
      distinctByFulfillmentType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fulfillmentType');
    });
  }

  QueryBuilder<ProductTable, ProductTable, QDistinct> distinctByImage(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'image', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QDistinct> distinctByImeiStr(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'imeiStr', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QDistinct>
      distinctByIsComboProduct() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isComboProduct');
    });
  }

  QueryBuilder<ProductTable, ProductTable, QDistinct>
      distinctByIsLostProduct() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isLostProduct');
    });
  }

  QueryBuilder<ProductTable, ProductTable, QDistinct>
      distinctByIsRepurchasePrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isRepurchasePrice');
    });
  }

  QueryBuilder<ProductTable, ProductTable, QDistinct> distinctByItemId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'itemId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QDistinct> distinctByListedPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'listedPrice');
    });
  }

  QueryBuilder<ProductTable, ProductTable, QDistinct> distinctByMerchantId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'merchantId');
    });
  }

  QueryBuilder<ProductTable, ProductTable, QDistinct> distinctByNote(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'note', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QDistinct>
      distinctByOriginalPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'originalPrice');
    });
  }

  QueryBuilder<ProductTable, ProductTable, QDistinct> distinctByParentProductId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'parentProductId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QDistinct>
      distinctByProductCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'productCategory');
    });
  }

  QueryBuilder<ProductTable, ProductTable, QDistinct>
      distinctByProductChildComboStr({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'productChildComboStr',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QDistinct> distinctByProductChildStr(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'productChildStr',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QDistinct>
      distinctByProductChildType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'productChildType');
    });
  }

  QueryBuilder<ProductTable, ProductTable, QDistinct> distinctByProductCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'productCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QDistinct> distinctByProductCodeVat(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'productCodeVat',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QDistinct> distinctByProductId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'productId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QDistinct>
      distinctByProductInComboQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'productInComboQuantity');
    });
  }

  QueryBuilder<ProductTable, ProductTable, QDistinct> distinctByProductName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'productName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QDistinct> distinctByProductNameVat(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'productNameVat',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QDistinct>
      distinctByProductTradeName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'productTradeName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QDistinct> distinctByProductType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'productType');
    });
  }

  QueryBuilder<ProductTable, ProductTable, QDistinct>
      distinctByProductWebCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'productWebCategory');
    });
  }

  QueryBuilder<ProductTable, ProductTable, QDistinct> distinctByPromotionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'promotionId');
    });
  }

  QueryBuilder<ProductTable, ProductTable, QDistinct> distinctByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quantity');
    });
  }

  QueryBuilder<ProductTable, ProductTable, QDistinct>
      distinctByRepurchasePrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'repurchasePrice');
    });
  }

  QueryBuilder<ProductTable, ProductTable, QDistinct>
      distinctByReturnSellingPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'returnSellingPrice');
    });
  }

  QueryBuilder<ProductTable, ProductTable, QDistinct>
      distinctBySelectImeiReason({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'selectImeiReason',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QDistinct> distinctBySellingPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sellingPrice');
    });
  }

  QueryBuilder<ProductTable, ProductTable, QDistinct> distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }

  QueryBuilder<ProductTable, ProductTable, QDistinct> distinctByToPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'toPrice');
    });
  }

  QueryBuilder<ProductTable, ProductTable, QDistinct>
      distinctByTotalQuantityInStock() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalQuantityInStock');
    });
  }

  QueryBuilder<ProductTable, ProductTable, QDistinct>
      distinctByTotalQuantityInStore() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalQuantityInStore');
    });
  }

  QueryBuilder<ProductTable, ProductTable, QDistinct>
      distinctByTotalQuantityInTransfer() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalQuantityInTransfer');
    });
  }

  QueryBuilder<ProductTable, ProductTable, QDistinct> distinctByUnitId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unitId');
    });
  }

  QueryBuilder<ProductTable, ProductTable, QDistinct> distinctByWarrantyAddress(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'warrantyAddress',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QDistinct>
      distinctByWarrantyDescription({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'warrantyDescription',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QDistinct>
      distinctByWarrantyMonthNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'warrantyMonthNo');
    });
  }

  QueryBuilder<ProductTable, ProductTable, QDistinct>
      distinctByWarrantyPackageId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'warrantyPackageId');
    });
  }

  QueryBuilder<ProductTable, ProductTable, QDistinct> distinctByWarrantyPhone(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'warrantyPhone',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QDistinct>
      distinctByWarrantyReasonId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'warrantyReasonId');
    });
  }

  QueryBuilder<ProductTable, ProductTable, QDistinct>
      distinctByWarrantyReasonName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'warrantyReasonName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProductTable, ProductTable, QDistinct>
      distinctByWholesalePrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'wholesalePrice');
    });
  }
}

extension ProductTableQueryProperty
    on QueryBuilder<ProductTable, ProductTable, QQueryProperty> {
  QueryBuilder<ProductTable, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ProductTable, String?, QQueryOperations>
      accessoryGroupCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'accessoryGroupCode');
    });
  }

  QueryBuilder<ProductTable, String?, QQueryOperations>
      accessoryGroupIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'accessoryGroupId');
    });
  }

  QueryBuilder<ProductTable, int?, QQueryOperations> appearTimesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'appearTimes');
    });
  }

  QueryBuilder<ProductTable, String?, QQueryOperations> attachedImeiProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'attachedImei');
    });
  }

  QueryBuilder<ProductTable, String?, QQueryOperations> barCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'barCode');
    });
  }

  QueryBuilder<ProductTable, String?, QQueryOperations>
      belongBillDetailIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'belongBillDetailId');
    });
  }

  QueryBuilder<ProductTable, bool?, QQueryOperations>
      belongToWarrantyImeiProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'belongToWarrantyImei');
    });
  }

  QueryBuilder<ProductTable, String?, QQueryOperations> brandProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'brand');
    });
  }

  QueryBuilder<ProductTable, int?, QQueryOperations> cartIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cartId');
    });
  }

  QueryBuilder<ProductTable, String?, QQueryOperations> codeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'code');
    });
  }

  QueryBuilder<ProductTable, String?, QQueryOperations> comboIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'comboId');
    });
  }

  QueryBuilder<ProductTable, int?, QQueryOperations> companyIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'companyId');
    });
  }

  QueryBuilder<ProductTable, String?, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<ProductTable, String?, QQueryOperations>
      customerDiscountForProductStrProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'customerDiscountForProductStr');
    });
  }

  QueryBuilder<ProductTable, double?, QQueryOperations>
      discountAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'discountAmount');
    });
  }

  QueryBuilder<ProductTable, String?, QQueryOperations>
      discountByHandStrProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'discountByHandStr');
    });
  }

  QueryBuilder<ProductTable, double?, QQueryOperations>
      discountPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'discountPrice');
    });
  }

  QueryBuilder<ProductTable, int?, QQueryOperations>
      discountProgramIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'discountProgramId');
    });
  }

  QueryBuilder<ProductTable, int?, QQueryOperations> discountTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'discountType');
    });
  }

  QueryBuilder<ProductTable, double?, QQueryOperations>
      discountValueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'discountValue');
    });
  }

  QueryBuilder<ProductTable, String?, QQueryOperations>
      externalImeiIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'externalImeiId');
    });
  }

  QueryBuilder<ProductTable, String?, QQueryOperations>
      externalImeiNoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'externalImeiNo');
    });
  }

  QueryBuilder<ProductTable, String?, QQueryOperations>
      flexibleComboIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'flexibleComboId');
    });
  }

  QueryBuilder<ProductTable, String?, QQueryOperations>
      flexibleComboItemIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'flexibleComboItemId');
    });
  }

  QueryBuilder<ProductTable, double?, QQueryOperations> fromPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fromPrice');
    });
  }

  QueryBuilder<ProductTable, int?, QQueryOperations> fulfillmentTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fulfillmentType');
    });
  }

  QueryBuilder<ProductTable, String?, QQueryOperations> imageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'image');
    });
  }

  QueryBuilder<ProductTable, String?, QQueryOperations> imeiStrProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'imeiStr');
    });
  }

  QueryBuilder<ProductTable, bool?, QQueryOperations> isComboProductProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isComboProduct');
    });
  }

  QueryBuilder<ProductTable, bool?, QQueryOperations> isLostProductProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isLostProduct');
    });
  }

  QueryBuilder<ProductTable, bool?, QQueryOperations>
      isRepurchasePriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isRepurchasePrice');
    });
  }

  QueryBuilder<ProductTable, String?, QQueryOperations> itemIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'itemId');
    });
  }

  QueryBuilder<ProductTable, double?, QQueryOperations> listedPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'listedPrice');
    });
  }

  QueryBuilder<ProductTable, int?, QQueryOperations> merchantIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'merchantId');
    });
  }

  QueryBuilder<ProductTable, String?, QQueryOperations> noteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'note');
    });
  }

  QueryBuilder<ProductTable, double?, QQueryOperations>
      originalPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'originalPrice');
    });
  }

  QueryBuilder<ProductTable, String?, QQueryOperations>
      parentProductIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'parentProductId');
    });
  }

  QueryBuilder<ProductTable, int?, QQueryOperations> productCategoryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'productCategory');
    });
  }

  QueryBuilder<ProductTable, String?, QQueryOperations>
      productChildComboStrProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'productChildComboStr');
    });
  }

  QueryBuilder<ProductTable, String?, QQueryOperations>
      productChildStrProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'productChildStr');
    });
  }

  QueryBuilder<ProductTable, ProductType, QQueryOperations>
      productChildTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'productChildType');
    });
  }

  QueryBuilder<ProductTable, String?, QQueryOperations> productCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'productCode');
    });
  }

  QueryBuilder<ProductTable, String?, QQueryOperations>
      productCodeVatProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'productCodeVat');
    });
  }

  QueryBuilder<ProductTable, String?, QQueryOperations> productIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'productId');
    });
  }

  QueryBuilder<ProductTable, int?, QQueryOperations>
      productInComboQuantityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'productInComboQuantity');
    });
  }

  QueryBuilder<ProductTable, String?, QQueryOperations> productNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'productName');
    });
  }

  QueryBuilder<ProductTable, String?, QQueryOperations>
      productNameVatProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'productNameVat');
    });
  }

  QueryBuilder<ProductTable, String?, QQueryOperations>
      productTradeNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'productTradeName');
    });
  }

  QueryBuilder<ProductTable, ProductType, QQueryOperations>
      productTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'productType');
    });
  }

  QueryBuilder<ProductTable, int?, QQueryOperations>
      productWebCategoryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'productWebCategory');
    });
  }

  QueryBuilder<ProductTable, int?, QQueryOperations> promotionIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'promotionId');
    });
  }

  QueryBuilder<ProductTable, int?, QQueryOperations> quantityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quantity');
    });
  }

  QueryBuilder<ProductTable, double?, QQueryOperations>
      repurchasePriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'repurchasePrice');
    });
  }

  QueryBuilder<ProductTable, int?, QQueryOperations>
      returnSellingPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'returnSellingPrice');
    });
  }

  QueryBuilder<ProductTable, String?, QQueryOperations>
      selectImeiReasonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'selectImeiReason');
    });
  }

  QueryBuilder<ProductTable, double?, QQueryOperations> sellingPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sellingPrice');
    });
  }

  QueryBuilder<ProductTable, int?, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<ProductTable, double?, QQueryOperations> toPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'toPrice');
    });
  }

  QueryBuilder<ProductTable, int?, QQueryOperations>
      totalQuantityInStockProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalQuantityInStock');
    });
  }

  QueryBuilder<ProductTable, int?, QQueryOperations>
      totalQuantityInStoreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalQuantityInStore');
    });
  }

  QueryBuilder<ProductTable, int?, QQueryOperations>
      totalQuantityInTransferProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalQuantityInTransfer');
    });
  }

  QueryBuilder<ProductTable, int?, QQueryOperations> unitIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unitId');
    });
  }

  QueryBuilder<ProductTable, String?, QQueryOperations>
      warrantyAddressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'warrantyAddress');
    });
  }

  QueryBuilder<ProductTable, String?, QQueryOperations>
      warrantyDescriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'warrantyDescription');
    });
  }

  QueryBuilder<ProductTable, int?, QQueryOperations> warrantyMonthNoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'warrantyMonthNo');
    });
  }

  QueryBuilder<ProductTable, int?, QQueryOperations>
      warrantyPackageIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'warrantyPackageId');
    });
  }

  QueryBuilder<ProductTable, String?, QQueryOperations>
      warrantyPhoneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'warrantyPhone');
    });
  }

  QueryBuilder<ProductTable, int?, QQueryOperations>
      warrantyReasonIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'warrantyReasonId');
    });
  }

  QueryBuilder<ProductTable, String?, QQueryOperations>
      warrantyReasonNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'warrantyReasonName');
    });
  }

  QueryBuilder<ProductTable, double?, QQueryOperations>
      wholesalePriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'wholesalePrice');
    });
  }
}
