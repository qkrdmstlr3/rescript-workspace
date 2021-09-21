// useContext
// 컴포넌트 트리를 통해 props데이터를 전달(전역 상태관리)

// let value = React.useContext(myContext)
// 현재 context의 값은 <MyContext.Provider>의 props값에 의해서 결정된다

module ThemeContext = {
  let context = React.createContext("light")

  module Provider = {
    let provider = React.Context.provider(context)

    @react.component
    let make = (~value, ~children) => {
      React.createElement(provider, {"value": value, "children": children})
    }
  }
}

module ThemedButton = {
  @react.component
  let make = () => {
    let theme = React.useContext(ThemeContext.context)
    let (color, backgroundColor) = switch theme {
    | "dark" => ("#ffffff", "#222222")
    | "light" | _ => ("#000000", "#eeeeee")
    }

    let style = ReactDOMStyle.make(~color, ~backgroundColor, ())

    <button style> {React.string("I am a styled button!")} </button>
  }
}

module Toolbar = {
  @react.component
  let make = () => {
    <div> <ThemedButton /> </div>
  }
}

@react.component
let make = () => {
  <ThemeContext.Provider value="dark"> <div> <Toolbar /> </div> </ThemeContext.Provider>
}
