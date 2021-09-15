// variant 의 사촌 개념
// #으로 시작, 대문자로 시작할 필요는 없다

let myColor = #red
let myLabel = #"aria-hidden"
let myNumber = #7

let render = (myColor: [#red | #green | #blue]) => {
  switch myColor {
  | #blue => Js.log("Hello blue!")
  | #red
  | #green =>
    Js.log("Hello other colors")
  }
}

type red = [#Ruby | #Redwood | #Rust]
type blue = [#Sapphire | #Neon | #Navy]

// Contains all constructors of red and blue.
// Also adds #Papayawhip
type color = [red | blue | #Papayawhip]

let myColor2: color = #Ruby

switch myColor2 {
| #...blue => Js.log("This blue-ish")
| #...red => Js.log("This red-ish")
| other => Js.log2("Other color than red and blue: ", other)
}

type preferredColors = [#white | #blue]

let myColor3: preferredColors = #blue

let displayColor = v => {
  switch v {
  | #red => "Hello red"
  | #green => "Hello green"
  | #white => "Hey white!"
  | #blue => "Hey blue!"
  }
}

Js.log(displayColor(myColor3))

//
// Only #Red allowed. Closed.
let basic: [#Red] = #Red

// May contain #Red, or any other value. Open
// here, foreground will actually be inferred as [> #Red | #Green]
let foreground: [> #Red] = #Green

// The value must be, at most, one of #Red or #Blue
// Only #Red and #Blue are valid values
let background: [< #Red | #Blue] = #Red
