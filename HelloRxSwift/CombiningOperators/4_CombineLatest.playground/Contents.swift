import UIKit
import RxSwift

let left = PublishSubject<Int>()
let right = PublishSubject<Int>()

let observable = Observable.combineLatest(left, right, resultSelector: {
    lastReft, lastRight in
    return "\(lastReft) \(lastRight)" // you can omit "return"
})

let disposable = observable.subscribe(onNext: { value in
    print(value)
})

left.onNext(1)
right.onNext(2)
left.onNext(6)
right.onNext(3)
left.onNext(4)
