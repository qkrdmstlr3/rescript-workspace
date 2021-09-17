// let binding
// ref로 감싸면 mutable하다
let myValue = ref(5)
myValue.contents = 6
myValue := 7
