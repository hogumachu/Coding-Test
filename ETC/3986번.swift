// 출처 : 백준 좋은 단어
// https://www.acmicpc.net/problem/3986
// 풀이 : hogumachu

var result = 0

for _ in 0..<Int(readLine()!)! {
    let values = readLine()!.map { String($0) }
    var stack: [String] = []

    for value in values {
        if stack.isEmpty {
            stack.append(value)
        } else {
            stack.append(value)

            if stack[stack.count - 1] == stack[stack.count - 2] {
                _ = stack.removeLast()
                _ = stack.removeLast()
            }
        }

    }

    if stack.isEmpty {
        result += 1
    }
}

print(result)
