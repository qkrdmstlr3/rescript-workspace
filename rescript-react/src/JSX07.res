// styling
// js에서 작동하는 것은 거의 rescript에서도 작동한다

// inline
// camel case
let comp1 = <div style={ReactDOM.Style.make(~color="444444", ~fontSize="68px", ())} />

// global css
// %%raw 표현식으로 css파일을 가져온다
// %%raw("require('./styles/main.css')")
%%raw("import './styles/main.css'")

// css module
/*
.root {
  color: red
}
*/
// {..} : https://rescript-lang.org/docs/manual/latest/object#type-declaration
@module external styles: {..} = "./styles.module.css"
let app00 = <div className={styles["root"]} />

// css-in-js (ex. emotionJS)
let container = Emotion.css({
  "color": "#fff",
})
let app01 = <div className={container} />

//
module Styles = {
  open Emotion
  let container = css({
    "color": "#fff",
  })
}
let app02 = <div className={Styles.container} />

//
let container02 = Emotion.rawCss(`
  color: #fff;
  background-color: red;
`)

let app03 = <div className={container02} />
