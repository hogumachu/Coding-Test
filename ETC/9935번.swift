// 출처 : 백준 문자열 폭발
// https://www.acmicpc.net/problem/9935
// 풀이 : hogumachu

let str = readLine()!
// readLine!.split() ~ > readLine()
let bomb:[Character] = Array(readLine()!)
// 위와 동일
var stack: [Character] = []

str.forEach({
    stack.append($0)
    if $0 == bomb.last {
        if bomb.count <= stack.count {
            var popOrder = true
            for i in 0..<bomb.count {
                if bomb[bomb.count - 1 - i] != stack[stack.count - 1 - i] {
                    popOrder = false
                    break
                }
            }
            if popOrder {
                for _ in 0..<bomb.count {
                    stack.removeLast()
                }
            }
        }
    }

})
let result = String(stack)
// result 에 대한 것을 reduce로 진행하였는데 시간 초과 났음 ;
print(stack.isEmpty ? "FRULA" : result)
