// array
// push 등으로 바꿀 수 있다.
let myArray = ["hello", "world", "how are you"]
let pushedValue = Js.Array2.push(myArray, "bye")
Js.log(myArray)

// list
// 불변성
// 추가속도 빠름
// 뒤에서 부터 가져오는 것 빠름
// 나머지는 느림
let myList = list{1, 2, 3}

let message = switch myList {
| list{} => "This list is empty"
| list{a, ...rest} => "The head of the list is the string " ++ Js.Int.toString(a)
}
