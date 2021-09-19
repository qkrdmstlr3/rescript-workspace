// key, ref로 props를 정의할 수 없다
// input type X , input _type O
// aria- X, ariaLabel O

module MyList = {
  @react.component
  let make = (~children: React.element) => {
    <ul> children </ul>
  }
}

let comp =
  <MyList> <li> {React.string("Item 1")} </li> <li> {React.string("Item 2")} </li> </MyList>

// children이 여러개면 props를 사용하는 것이 더 좋을수도
// children의 가장 좋은 사례는 의미적 순서나 구현의 상세를 제외하고 React.element를 전달하는 것

// 타입추론
// 하지만 명시적인 것을 더욱 추천
@react.component
let make = (~onClick, ~msg, ~children) => {
  <div onClick> {React.string(msg)} children </div>
}
// onClick => ReactEvent.Mouse.t => unit
// msg => string
// children => React.element
