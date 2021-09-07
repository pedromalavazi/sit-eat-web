enum QrCodeType {
  RESTAURANT,
  TABLE,
  INVITE,
}

extension QrCodeTypeExtension on QrCodeType {
  String get description {
    switch (this) {
      case QrCodeType.RESTAURANT:
        return 'RESTAURANT';
      case QrCodeType.TABLE:
        return 'TABLE';
      case QrCodeType.INVITE:
        return 'INVITE';
      default:
        return '';
    }
  }

  String get toUpper {
    switch (this) {
      case QrCodeType.RESTAURANT:
        return 'RESTAURANT';
      case QrCodeType.TABLE:
        return 'TABLE';
      case QrCodeType.INVITE:
        return 'INVITE';
      default:
        return '';
    }
  }
}
