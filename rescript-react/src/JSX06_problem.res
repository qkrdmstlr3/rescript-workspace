// context
// props는 탑 다운형식으로만 가능
// 컴포넌트끼리 같은 값을 공유하는 방법을 제공

type theme = Light | Dark

module Button = {
  @react.component
  let make = (~theme) => {
    let className = switch theme {
    | Light => "theme-light"
    | Dark => "theme-black"
    }
    <button className> {React.string("Click me")} </button>
  }
}

module ThemedButton = {
  @react.component
  let make = (~theme) => {
    <Button theme />
  }
}

module Toolbar = {
  @react.component
  let make = (~theme) => {
    <div> <ThemedButton theme /> </div>
  }
}

// 여기서 자식까지 내려간다
@react.component
let make = () => {
  <Toolbar theme=Dark />
}
