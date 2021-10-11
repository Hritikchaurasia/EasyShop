

List<String> listFromMap(Map<String, dynamic> map ){
  List<String> l= []; 
  if(map.isEmpty){
    return [];
  }  
  l.clear();
  map.forEach((data,value){
    l.add(value.toString());
  } );

  return l;
}


Map<String,dynamic> listToMap(List<String> list ){
  Map<String,dynamic> map = {};
  var i =0;
  if(list.isEmpty) return map;
  map.clear();
  map = {for(i = 0 ; i<list.length ; i++) i.toString(): list[i] };
  print(map);
  return map;
} 