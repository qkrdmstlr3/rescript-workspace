// 성능 및 js와의 상호운용을 위해 unboxed제공

@unboxed
type name = Name(string)
let studentName = Name("Joe")

@unboxed
type greeting = {message: string}
let hi = {message: "hello!"}

// 잘못된 예제, renderDot이 로컬좌표가 아닌 전역좌표를 가져와야한다
type coordinates = {x: float, y: float}

let renderDot = coordinates => {
  Js.log3("Pretend to draw at:", coordinates.x, coordinates.y)
}

let toWorldCoordinates = localCoordinates => {
  {
    x: localCoordinates.x +. 10.,
    y: localCoordinates.x +. 20.,
  }
}

let playerLocalCoordinates = {x: 20.5, y: 30.5}

renderDot(playerLocalCoordinates)

// 잘된 예제
type coordinates2 = {x: float, y: float}
@unboxed type localCoordinates = Local(coordinates2)
@unboxed type worldCoordinates = World(coordinates2)

let renderDot = (World(coordinates2)) => {
  Js.log3("Pretend to draw at:", coordinates2.x, coordinates2.y)
}

let toWorldCoordinates = (Local(coordinates2)) => {
  World({
    x: coordinates2.x +. 10.,
    y: coordinates2.x +. 20.,
  })
}

let playerLocalCoordinates = Local({x: 20.5, y: 30.5})

// This now errors!
// renderDot(playerLocalCoordinates)
// We're forced to do this instead:
renderDot(playerLocalCoordinates->toWorldCoordinates)
