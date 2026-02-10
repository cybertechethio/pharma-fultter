// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ExpenseDetailModel _$ExpenseDetailModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_ExpenseDetailModel', json, ($checkedConvert) {
  final val = _ExpenseDetailModel(
    id: $checkedConvert('id', (v) => JsonTypeConverters.stringFromDynamic(v)),
    expenseDate: $checkedConvert(
      'expenseDate',
      (v) => DateTime.parse(v as String),
    ),
    name: $checkedConvert('name', (v) => v as String),
    amount: $checkedConvert(
      'amount',
      (v) => JsonTypeConverters.stringFromDynamic(v),
    ),
    notes: $checkedConvert('notes', (v) => v as String?),
    attachments: $checkedConvert(
      'attachments',
      (v) => (v as List<dynamic>?)?.map((e) => e as String).toList() ?? [],
    ),
    status: $checkedConvert('status', (v) => v as String?),
    createdAt: $checkedConvert('createdAt', (v) => DateTime.parse(v as String)),
    updatedAt: $checkedConvert(
      'updatedAt',
      (v) => v == null ? null : DateTime.parse(v as String),
    ),
    expensePayments: $checkedConvert(
      'expensePayments',
      (v) =>
          (v as List<dynamic>?)
              ?.map(
                (e) => ExpensePaymentModel.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          [],
    ),
  );
  return val;
});

Map<String, dynamic> _$ExpenseDetailModelToJson(
  _ExpenseDetailModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'expenseDate': instance.expenseDate.toIso8601String(),
  'name': instance.name,
  'amount': instance.amount,
  'notes': ?instance.notes,
  'attachments': instance.attachments,
  'status': ?instance.status,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': ?instance.updatedAt?.toIso8601String(),
  'expensePayments': instance.expensePayments.map((e) => e.toJson()).toList(),
};

_ExpensePaymentModel _$ExpensePaymentModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_ExpensePaymentModel', json, ($checkedConvert) {
  final val = _ExpensePaymentModel(
    id: $checkedConvert('id', (v) => JsonTypeConverters.stringFromDynamic(v)),
    expenseId: $checkedConvert(
      'expenseId',
      (v) => JsonTypeConverters.stringFromDynamic(v),
    ),
    amount: $checkedConvert(
      'amount',
      (v) => JsonTypeConverters.stringFromDynamic(v),
    ),
    createdAt: $checkedConvert('createdAt', (v) => DateTime.parse(v as String)),
    paymentMethods: $checkedConvert(
      'paymentMethods',
      (v) =>
          (v as List<dynamic>?)
              ?.map(
                (e) => ExpensePaymentMethodModel.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList() ??
          [],
    ),
  );
  return val;
});

Map<String, dynamic> _$ExpensePaymentModelToJson(
  _ExpensePaymentModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'expenseId': instance.expenseId,
  'amount': instance.amount,
  'createdAt': instance.createdAt.toIso8601String(),
  'paymentMethods': instance.paymentMethods.map((e) => e.toJson()).toList(),
};

_ExpensePaymentMethodModel _$ExpensePaymentMethodModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_ExpensePaymentMethodModel', json, ($checkedConvert) {
  final val = _ExpensePaymentMethodModel(
    id: $checkedConvert('id', (v) => JsonTypeConverters.stringFromDynamic(v)),
    method: $checkedConvert('method', (v) => v as String),
    amount: $checkedConvert(
      'amount',
      (v) => JsonTypeConverters.stringFromDynamic(v),
    ),
    referenceNumber: $checkedConvert('referenceNumber', (v) => v as String?),
    bankId: $checkedConvert('bankId', (v) => (v as num?)?.toInt()),
    createdAt: $checkedConvert('createdAt', (v) => DateTime.parse(v as String)),
    bankName: $checkedConvert(
      'banks',
      (v) => JsonTypeConverters.bankNameFromDynamic(v),
    ),
    attachment: $checkedConvert('attachment', (v) => v as String?),
  );
  return val;
}, fieldKeyMap: const {'bankName': 'banks'});

Map<String, dynamic> _$ExpensePaymentMethodModelToJson(
  _ExpensePaymentMethodModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'method': instance.method,
  'amount': instance.amount,
  'referenceNumber': ?instance.referenceNumber,
  'bankId': ?instance.bankId,
  'createdAt': instance.createdAt.toIso8601String(),
  'banks': ?instance.bankName,
  'attachment': ?instance.attachment,
};
