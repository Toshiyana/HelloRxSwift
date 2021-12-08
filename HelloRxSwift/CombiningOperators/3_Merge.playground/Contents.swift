import UIKit
import RxSwift

let disposeBag = DisposeBag()

let left = PublishSubject<Int>()
let right = PublishSubject<Int>()

let source = Observable.of(left.asObservable(), right.asObservable())

let observable = source.merge()

observable.subscribe(onNext: {
    print($0)
}).disposed(by: disposeBag)

// print observable of time-based-diagram
left.onNext(1)
left.onNext(2)
right.onNext(4)
left.onNext(6)
right.onNext(7)

