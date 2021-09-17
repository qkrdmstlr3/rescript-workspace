// 임시로 캐시에 저장해 계산을 뒤로 미룰 수 있다(프언개에서 배운 것)

let expensiveFilesRead = lazy {
  Js.log("Reading dir")
  // Node.Fs.readdirSync("./pages")
}

// excute
// force호출 후에는 계산을 다시 실행할 수 없다
Lazy.force(expensiveFilesRead)

// pattern matching을 이용해서 계산을 실행할 수도 있다
switch expensiveFilesRead {
| lazy result => Js.log(result)
}

// exception handling
let result = try {
  Lazy.force(expensiveFilesRead)
} catch {
| Not_found => () // empty array of files
}
