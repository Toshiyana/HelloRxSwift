import UIKit
import RxSwift

let disposeBag = DisposeBag()

// assume that "button" and "textField" are UIComponent.
let button = PublishSubject<Void>()
let textField = PublishSubject<String>()

let observable = button.withLatestFrom(textField)

observable.subscribe(onNext: {
    print($0)
}).disposed(by: disposeBag)

// print text only when button was clicked. (= get the latest text)
textField.onNext("Sw")
textField.onNext("Swi")
textField.onNext("Swif")
textField.onNext("Swift")

button.onNext(())
button.onNext(())
