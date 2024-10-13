void main(){ 
List<int> score = [45, 78, 62, 49, 85, 33, 90, 50]; 
var passScore = score.where((score)=>score > 50); 
print(passScore.toList()); 
print("5 students passed"); 
} 

 

 