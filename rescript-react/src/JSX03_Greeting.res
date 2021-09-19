// Component & props

// 컴포넌트 함수 이름은 항상 make, @react.component속성 추가
// optional표현 가능
@react.component
let make = (~name: option<string>=?) => {
  let greeting = switch name {
  | Some(name) => "Hello " ++ name ++ "!"
  | None => "Hello stranger!"
  }
  <div> {React.string(greeting)} </div>
}
