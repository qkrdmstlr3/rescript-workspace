// hook은 다양한 작업에 대해 컴포넌트 상태를 도입하고 사이드 이펙트를 트리거 할 수 있는 함수

// React.useState > 상태를 가진 값과 업데이트하는 함수
// let (state, setState) = React.useState(_ => initialState)

@react.component
let make = () => {
  let (text, setText) = React.useState(_ => "")

  let onChange = evt => {
    ReactEvent.Form.preventDefault(evt)
    let value = ReactEvent.Form.target(evt)["value"]
    setText(_prev => value)
  }

  <div> <input onChange value=text /> </div>
}

// 자식 컴포넌트로 setState넘기기
module ControlPanel = {
  @react.component
  let make = (~setDarkmode, ~darkmode) => {
    let onClick = evt => {
      ReactEvent.Mouse.preventDefault(evt)
      setDarkmode(prev => !prev)
    }

    let toggleText = "Switch to " ++ ((darkmode ? "light" : "dark") ++ " theme")
    <div> <button onClick> {React.string(toggleText)} </button> </div>
  }
}

@react.component
let make02 = (~content) => {
  let (darkmode, setDarkmode) = React.useState(_ => false)
  let className = darkmode ? "theme-dark" : "theme-light"

  <div className>
    <section> <h1> {React.string("More Infos about Rescript")} </h1> content </section>
    <ControlPanel darkmode setDarkmode />
  </div>
}

// 깔끔한 출력을 위해 React.Uncurried.useState 사용 가능
// let (state, setState) = React.Uncurried.useState(_ => 0)
// setState(. prev => prev + 1)
