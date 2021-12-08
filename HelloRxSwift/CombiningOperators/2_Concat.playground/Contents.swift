import UIKit
import RxSwift

let disposeBag = DisposeBag()

let first = Observable.of(1,2,3)
let second = Observable.of(4,5,6)

let observable = Observable.concat([first, second])

observable.subscribe(onNext: {
    print($0)
}).disposed(by: disposeBag)
