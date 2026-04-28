enum GenreEnum {
  absent;

  String? displayNameTranslate() {
    switch (this) {
      case GenreEnum.absent:
        return null;
    }
  }

  @override
  String toString() => name;
}
