import UIKit
import RxSwift

let disposeBag = DisposeBag()

let numbers = Observable.of(2,3,4)

let observable = numbers.startWith(1)

observable.subscribe(onNext: {
    print($0)
}).disposed(by: disposeBag)
