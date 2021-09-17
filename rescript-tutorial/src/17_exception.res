// switch List.find(i => i === theItem, myItems) {
// | item => Js.log(item)
// | exception Not_found => Js.log("No such item found!")
// }

// raise로 에러 발생
let myTest = () => {
  Js.Exn.raiseError("Hello!")
}

// try {
//   someOtherJSFunctionThatThrows()
// } catch {
// | Not_found => 1 // catch a ReScript exception
// | Invalid_argument(_) => 1 // catch a second ReScript exception
// | Js.Exn.Error(obj) => 1 // catch the JS exception
// }
