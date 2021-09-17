// js랑 주요 매커니즘은 동일
// 사용하는 키워드는 다르다
// revamp + pipe가 더 깔끔하게 만들어줄거다

let myPromise = Js.Promise.make((~resolve, ~reject) => resolve(. 2))
let result = myPromise->Js.Promise.then_(value => {
    Js.log(value)
    Js.Promise.resolve(value + 2)
  }, _)->Js.Promise.then_(value => {
    Js.log(value)
    Js.Promise.resolve(value + 2)
  }, _)->Js.Promise.catch(err => {
    Js.log2("Failure!!", err)
    Js.Promise.resolve(-2)
  }, _)

// 대안 : https://github.com/ryyppy/rescript-promise#usage
