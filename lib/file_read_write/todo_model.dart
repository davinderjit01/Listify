class Todo{
  final List cardList;

  //constructor
  Todo(this.cardList);

  //from json to Todo Object
 Todo.fromJson(Map<String, dynamic>json)
     : cardList = json['cardList'];

 //to json
 Map<String,dynamic> toJson() =>{
   'cardList': cardList
 };
}