// undefined null 이라는 개념이 없다
// option유형으로 감싸서 값의 유무를 나타낸다

let licenseNumber = Some(5)

// let licenseNumber = if personHasACar {
//   Some(5)
// } else {
//   None
// }

switch licenseNumber {
| None => Js.log("The person doesn't have a car")
| Some(number) => Js.log("The person's license number is " ++ Js.Int.toString(number))
}

let x = Some(None)
