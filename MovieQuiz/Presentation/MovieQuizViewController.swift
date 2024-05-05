import UIKit

final class MovieQuizViewController: UIViewController {
    
    private struct QuizQuestion {
      let image: String
      let text: String
      let correctAnswer: Bool
    }
    
    private struct QuizStepViewModel {
      let image: UIImage
      let question: String
      let questionNumber: String
    }
    private struct QuizResultsViewModel {
      let title: String
      let text: String
      let buttonText: String
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    private let questions: [QuizQuestion] = [
            QuizQuestion(
                image: "The Godfather",
                text: "Рейтинг этого фильма больше чем 6?",
                correctAnswer: true),
            QuizQuestion(
                image: "The Dark Knight",
                text: "Рейтинг этого фильма больше чем 6?",
                correctAnswer: true),
            QuizQuestion(
                image: "Kill Bill",
                text: "Рейтинг этого фильма больше чем 6?",
                correctAnswer: true),
            QuizQuestion(
                image: "The Avengers",
                text: "Рейтинг этого фильма больше чем 6?",
                correctAnswer: true),
            QuizQuestion(
                image: "Deadpool",
                text: "Рейтинг этого фильма больше чем 6?",
                correctAnswer: true),
            QuizQuestion(
                image: "The Green Knight",
                text: "Рейтинг этого фильма больше чем 6?",
                correctAnswer: true),
            QuizQuestion(
                image: "Old",
                text: "Рейтинг этого фильма больше чем 6?",
                correctAnswer: false),
            QuizQuestion(
                image: "The Ice Age Adventures of Buck Wild",
                text: "Рейтинг этого фильма больше чем 6?",
                correctAnswer: false),
            QuizQuestion(
                image: "Tesla",
                text: "Рейтинг этого фильма больше чем 6?",
                correctAnswer: false),
            QuizQuestion(
                image: "Vivarium",
                text: "Рейтинг этого фильма больше чем 6?",
                correctAnswer: false)
        ]
    
    private var currentQuestionIndex: Int = 0
    private var correctAnswers = 0
     
    
    @IBOutlet weak var noButton: UIButton!
    @IBOutlet private var yesButton: UIButton!
    @IBOutlet private var imageView: UIImageView!
    @IBOutlet private var textLabel: UILabel!
    @IBOutlet private var counterLabel: UILabel!
    @IBOutlet private var questionTitleLabel: UILabel!
    
    @IBAction func yesButtonClicked(_ sender: Any) {
          let currentQuestion = questions[currentQuestionIndex]
          let givenAnswer = true
          showAnswerResult(isCorrect: givenAnswer == currentQuestion.correctAnswer)
    }
    
    @IBAction func noButtonClicked(_ sender: Any) {
        let currentQuestion = questions[currentQuestionIndex]
        let givenAnswer = false
        showAnswerResult(isCorrect: givenAnswer == currentQuestion.correctAnswer)
    }
    
    override func viewDidLoad() {
        show(quiz: convert(model: questions[currentQuestionIndex]))
        imageView.layer.masksToBounds = true
        configureUI()
        super.viewDidLoad()
    }
    private func configureUI() {
        textLabel.font = UIFont(name: "YSDisplay-Bold", size: 23)
        questionTitleLabel.font = UIFont(name: "YSDisplay-Medium", size: 20)
        counterLabel.font = UIFont(name: "YSDisplay-Medium", size: 20)
        yesButton.titleLabel?.font = UIFont(name: "YSDisplay-Medium", size: 20)
        noButton.titleLabel?.font = UIFont(name: "YSDisplay-Medium", size: 20)
    }

     private func show(quiz step: QuizStepViewModel) {
     imageView.image = step.image
     textLabel.text = step.question
     counterLabel.text = step.questionNumber
     imageView.layer.borderWidth = 0
   }
    private func show(quiz result: QuizResultsViewModel) {
    let alert = UIAlertController(
                title: result.title,
                message: result.text,
                preferredStyle: .alert)
            
     let action = UIAlertAction(title: result.buttonText, style: .default) { _ in
                self.currentQuestionIndex = 0
                self.correctAnswers = 0
                let firstQuestion = self.questions[self.currentQuestionIndex]
                let viewModel = self.convert(model: firstQuestion)
                self.show(quiz: viewModel)
            }
    alert.addAction(action)
    self.present(alert, animated: true, completion: nil)
        }
    
    private func convert(model: QuizQuestion) -> QuizStepViewModel {
        let questionStep = QuizStepViewModel(
            image: UIImage(named: model.image) ?? UIImage(),
            question: model.text,
            questionNumber: "\(currentQuestionIndex + 1)/\(questions.count)")
        return questionStep
    }
    
     private func showNextQuestionOrResults() {
        if currentQuestionIndex == questions.count - 1 {
            let text = "Ваш результат \(correctAnswers)/10"
                       let viewModel = QuizResultsViewModel(
                           title: "Этот раунд окончен!",
                           text: text,
                           buttonText: "Сыграть ещё раз")
                       show(quiz: viewModel)
          
        } else {
            currentQuestionIndex += 1
            
            let nextQuestion = questions[currentQuestionIndex]
            let viewModel = convert(model: nextQuestion)
             show(quiz: viewModel)
        }
    }

    private func showAnswerResult(isCorrect: Bool) {
        if isCorrect {
               correctAnswers += 1
           }
           
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 8
        imageView.layer.borderColor = isCorrect ? UIColor.ypGreen.cgColor : UIColor.ypRed.cgColor
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
               self.showNextQuestionOrResults()
           }
       }
    }


