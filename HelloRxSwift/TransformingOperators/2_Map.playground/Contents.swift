import UIKit
import RxSwift

let disposeBag = DisposeBag()

Observable.of(1,2,3,4,5)
    .map {
        return $0 * 2
    }.subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)
