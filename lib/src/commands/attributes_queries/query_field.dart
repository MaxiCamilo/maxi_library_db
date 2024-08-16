enum QueryFieldType { field, count, maximum, minimum, average }

class QueryField {
  final QueryFieldType type;
  final String fieldName;
  final String nickName;

  const QueryField({
    this.type = QueryFieldType.field,
    this.fieldName = '',
    this.nickName = '',
  });
}
