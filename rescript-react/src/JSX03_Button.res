/* src/Button.res */
module Label = {
  @react.component
  let make = (~title: string) => {
    <div className="myLabel"> {React.string(title)} </div>
  }
}

@react.component
let make = (~children) => {
  <div> <Label title="Getting Started" /> children </div>
}

// 다른 파일에서
// module Label = Button.Label
// let content = <Label title="Test"/>
