/*

  ! Em construção -> Consumir API

  class Repositories{
  
  String titulo;
  String descricao;
  String link;

  Repositories(String titulo, String descricao, String link){
    this.titulo = titulo;
    this.descricao = descricao;
    this.link = link;
  }

  /* 
  exemplo saida json github:
  "name": "feedback_screen",
  "description": null,
  "html_url": "https://github.com/anabellon/feedback_screen",
  */

  Repositories.fromJson(Map json) : titulo = json['name'], descricao = json['description'], link = json['html_url']

  // verificar o Map e suas passagens, está errado
  Map toJson(){return {'titulo': titulo, 'descricao': descricao, 'link': link};} 

} */