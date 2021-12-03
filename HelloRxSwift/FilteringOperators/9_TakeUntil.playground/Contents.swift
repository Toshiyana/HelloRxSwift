import UIKit
import RxSwift

// TakeUntil Operator
// It is similar to SkipUntil Operator.

let disposeBag = DisposeBag()

let subject = PublishSubject<String>()
let trigger = PublishSubject<String>()

subject.takeUntil(trigger)
    .subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)

// "1" and "2" is printed
subject.onNext("1")
subject.onNext("2")

trigger.onNext("X")

// "3" is not printed because of triggering
subject.onNext("3")
