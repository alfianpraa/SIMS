String? validateEmail(String? value) {
  if (value!.isEmpty) {
    return "email tidak boleh kosong";
  }
  final emailReg = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  if (!emailReg.hasMatch(value)) {
    return "masukkan alamat email yang sesuai";
  }
  return null;
}

String? validatePassword(String? value) {
  if (value!.isEmpty) {
    return "password tidak boleh kosong";
  }
  if (value.length < 8) {
    return "password harus terdiri dari 8 karakter";
  }
  return null;
}

String? validateName(String? value) {
  if (value!.isEmpty) {
    return "nama tidak boleh kosong";
  }
  return null;
}