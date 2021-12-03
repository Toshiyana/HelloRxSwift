import UIKit
import RxSwift

// Skip Operator

let disposeBag = DisposeBag()

Observable.of("A","B","C","D","E")
    .skip(3)
    .subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)
