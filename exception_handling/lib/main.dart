main() {
  birFonksiyon(5);
}

void birFonksiyon(int numara) {
  if (numara < 100) {
    print(numara);
  } else {
    throw "Hata:max 100 olmalı";
  }
}
