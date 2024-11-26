import 'quiz.dart';

class Answer{
  final Question question;
  final String inputAnswer;
  Answer({required this.question, required this.inputAnswer});

  bool isCorrect(){
    return inputAnswer == question.goodAnswer;
  }
}

class Submission {
  List<Answer> answers = [];

  //calculate score
  int getScore(){ 
  int score = 0;
    for(Answer userAnswers in answers){
      if(userAnswers.isCorrect()){
        score ++;
      }
    }
      return score;
  }

  //retrieve user's answer for a specific question
  Answer ? getAnswerFor (Question question)
  {
    for (Answer userAnswers in answers){
      if(userAnswers.question == question){
      return userAnswers;
      } 
    }
    return null;
  }

  //add or update an answer
  void addAnswer(Question question, String inputAnswer){
    //check for existing answers of the question in a list
    for(int i = 0; i < answers.length; i++){
      if(answers[i].question == question){
        //updating existing answer
        answers[i] = Answer(question: question, inputAnswer: inputAnswer);
        return;
      }
    }
      //adding a new answer
      answers.add(Answer(question: question, inputAnswer: inputAnswer));
  }

  //remove all answers
  void removeAnswer(){
    answers.clear();
  }

}