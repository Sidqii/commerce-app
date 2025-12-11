bool isInvalid(String url) {
  if (url == '-') return true;

  if (url.isEmpty) return true;

  if (url == 'null') return true;

  if (url.trim().isEmpty) return true;

  return false;
}
