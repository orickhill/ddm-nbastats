class AvaliacaoDesenvolvedor {
  int id;
  int estrela;// = models.IntegerField(
  String comentario;// = models.TextField(null=True, blank=True)
  int usuario;// = models.ForeignKey(User, on_delete=models.CASCADE)
  int desenvolvedor;// = models.ForeignKey(

  AvaliacaoDesenvolvedor(this.id, this.estrela, this.comentario, this.usuario, this.desenvolvedor);
}