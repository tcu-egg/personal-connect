enum Gender {
  none,
  male,
  female,
  other;

  @override
  String toString() {
    switch (this) {
      case Gender.none:
        return '未設定';
      case Gender.male:
        return '男';
      case Gender.female:
        return '女';
      case Gender.other:
        return 'その他';
    }
  }
}
