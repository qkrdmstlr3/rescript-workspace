// arrow함수로 선언되고 expression을 반환한다

let greet = name => "Hello " ++ name

// labeled arguments
// 함수 호출 시 인자에 이름을 넘겨줄 수 있다
let addCoordinates = (~x: int, ~y: int): int => {
  x + y
}
let result = addCoordinates(~x=5, ~y=6)

// ? 주면 옵셔널도 가능
// let drawCircle: (~color: color, ~radius: int=?, unit) => unit = (
//   ~color: color,
//   ~radius: option<int>=?,
//   (),
// ) => {
//   setColor(color)
//   switch radius {
//   | None => startAt(1, 1)
//   | Some(r_) => startAt(r_, r_)
//   }
// }

// let result = switch payloadRadius {
// | None => drawCircle(~color, ())
// | Some(r) => drawCircle(~color, ~radius=r, ())
// }
// 동일
// let result = drawCircle(~color, ~radius=?payloadRadius, ())

// 기본갑 제공 가능
// let drawCircle = (~radius=1, ~color, ()) => {
//   setColor(color)
//   startAt(radius, radius)
// }

// 재귀함수
// tail recursion제공
let rec listHas = (list, item) =>
  switch list {
  | list{} => false
  | list{a, ...rest} => a === item || listHas(rest, item)
  }

// uncurried function
let add = (. x, y) => x + y
let result2 = add(. 1, 2)

// https://rescript-lang.org/docs/manual/latest/function#tips--tricks
