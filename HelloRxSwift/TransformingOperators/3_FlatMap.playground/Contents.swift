import UIKit
import RxSwift
import RxRelay

let disposeBag = DisposeBag()

struct Student {
    var score: BehaviorRelay<Int>
}

let john = Student(score: BehaviorRelay(value: 80))
let mary = Student(score: BehaviorRelay(value: 70))

let student = PublishSubject<Student>()

student.asObservable()
    .flatMap { $0.score.asObservable() }
    .subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)

student.onNext(john)
john.score.accept(100) // change value

student.onNext(mary)
mary.score.accept(50)

john.score.accept(40)
