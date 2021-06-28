// 출처 : 백준  숨바꼭질 2
// https://www.acmicpc.net/problem/12851
// 풀이 : hogumachu


let input = readLine()!.split(separator: " ").map{Int(String($0))!}

var queue: [Int] = []
var queueIndex = 0
var result = 0
var resultLevel = -1
var values: [Int] = Array(repeating: 100000, count: input[0] > input[1] ? 2 * input[0] + 1 : 2 * input[1] + 1)
queue.append(input[0])
values[input[0]] = 0

while queue.count > queueIndex {
    let select = queue[queueIndex]
    if select == input[1] {
        if resultLevel == -1 {
            resultLevel = values[select]
            result += 1
        } else if values[select] == resultLevel {
            result += 1
        } else {
            break
        }

    } else {
        visit(select)

    }
    queueIndex += 1
}

func visit(_ num: Int) -> Void {
    if num + 1 < values.count {
        if values[num + 1] >= values[num] + 1 {
            values[num + 1] = values[num] + 1
            queue.append(num + 1)
        }
    }
    if num - 1 >= 0 {
        if values[num - 1] >= values[num] + 1 {
            values[num - 1] = values[num] + 1
            queue.append(num - 1)
        }
    }
    if num * 2 < values.count {
        if values[num * 2] >= values[num] + 1 {
            values[num * 2] = values[num] + 1
            queue.append(num * 2)
        }
    }
}
print(resultLevel)
print(result)
