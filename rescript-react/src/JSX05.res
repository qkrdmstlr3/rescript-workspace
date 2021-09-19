// ref
@react.component
let make = () => {
  let clicks = React.useRef(0)

  let onClick = _ => {
    clicks.current = clicks.current + 1
    // clicks.current 값을 변경해도 컴포넌트가 다시 렌더링되지 않는다
  }

  <div onClick> {Js.Int.toString(clicks.current)->React.string} </div>
}

@send external focus: Dom.element => unit = "focus"
@react.component
let make02 = () => {
  let textInput = React.useRef(Js.Nullable.null)

  let focusInput = () =>
    switch textInput.current->Js.Nullable.toOption {
    | Some(dom) => dom->focus
    | None => ()
    }

  let onClick = _ => focusInput()

  // let onClick = _ => focusInput()을 통해 <input> 요소의 속성으로 지정
  <div>
    <input type_="text" ref={ReactDOM.Ref.domRef(textInput)} />
    <input type_="button" value="Focus the text input" onClick />
  </div>
}
