import UIKit
import RxSwift

// Variable
// `Variable` is planned for future deprecation. Please consider `BehaviorRelay` as a replacement.
//

let disposeBag = DisposeBag()

let variable = Variable("Initial Value")

variable.value = "Hello world"

variable.asObservable()
    .subscribe {
        print($0)
        // output
        // ℹ️ [DEPRECATED] `Variable` is planned for future deprecation. Please consider `BehaviorRelay` as a replacement. Read more at: https://git.io/vNqvx
        // next(Hello world)

    }



let variable2 = Variable([String]())

variable2.value.append("Item 1")

variable2.asObservable()
    .subscribe {
        print($0)
        // output
        // ℹ️ [DEPRECATED] `Variable` is planned for future deprecation. Please consider `BehaviorRelay` as a replacement. Read more at: https://git.io/vNqvx
        // next(Hello world)

    }

variable2.value.append("Item 2")
