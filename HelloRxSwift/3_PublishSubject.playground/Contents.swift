import UIKit
import RxSwift

// Publish Subject
// Publish Subject are very special because it can emit values and you can observe it.

let disposeBag = DisposeBag()

let subject = PublishSubject<String>() // no need default value in ()

// When no subscriber, nothing happen.
// and you have to call onNext() after call subscribe {}
subject.onNext("Issue 1")

subject.subscribe { event in
    print(event)
}

subject.onNext("Issue 2")
subject.onNext("Issue 3")

subject.dispose()

// After dispose, below code isn't called
subject.onCompleted()

subject.onNext("Issue 4")
