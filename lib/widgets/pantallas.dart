class Pantalla {
  int id;
  String nombre;
  String foto;

  Pantalla(this.id, this.nombre, this.foto);
}

final Menu = [
  Pantalla(1, "Bienvenida", "hola.png"),
  Pantalla(2, "Formularios", "formulario.png"),
  Pantalla(3, "Consulta Riesgos laborales", "busquedaRL.png"),
  Pantalla(4, "Señales", "senales.png"),
  Pantalla(5, "Recomendaciones", "recomendacion.png"),
  Pantalla(6, "Perfil", "perfil.png"),
];