class BoatData {
  final String idMiejscowosci;
  final String idLodzi;
  final int idPanelu;
  final int idButli;
  final bool czyUzywana;
  final int rozmiarPanelu;

  BoatData(
    this.idMiejscowosci,
    this.idLodzi,
    this.idPanelu,
    this.idButli,
    this.czyUzywana,
    this.rozmiarPanelu,
  );
}

class DataFromAllBoats {
  final List<BoatData> boats = [
    BoatData('Swinoujscie', 'Nocny Blutus', 12, 40, false, 1),
    BoatData('Miedzyzdroje', 'Pachnąca szprot', 23, 44, true, 2),
    BoatData('Gdansk', 'Marklera', 55, 22, false, 3),
    BoatData('Swinoujscie', 'Nocny Blutus', 11, 2, false, 1),
    BoatData('Miedzyzdroje', 'Bajt', 22, 31, true, 2),
    BoatData('Gdansk', 'Marklera', 23, 44, false, 3),
    // Dodaj więcej elementów według potrzeb
  ];
}
