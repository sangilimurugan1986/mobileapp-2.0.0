enum DataType {
  Numeric,
  AlphaNumeric,
  SingleSelect,
  Decimal,
  Date,
  Custom,
}

String getDataType(DataType type) {
  switch (type) {
    case DataType.AlphaNumeric:
      return 'Alpha Numeric';
    case DataType.Date:
      return 'Date';
    case DataType.Decimal:
      return 'Decimal';
    case DataType.Numeric:
      return 'Numeric';
    case DataType.SingleSelect:
      return 'Single Select';
    case DataType.Custom:
      return 'Custom';
  }
}
