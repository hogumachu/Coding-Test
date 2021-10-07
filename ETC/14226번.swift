// 출처 : 백준 이모티콘
// https://www.acmicpc.net/problem/14226
// 풀이 : hogumachu

let s = Int(readLine()!)!
var queue: [(count: Int, time: Int, copyCount: Int)] = []
var queueIndex = 0
var result = 0
var visited: [[Int]] = Array(repeating: [], count: s * 2 + 1)

queue.append((1, 0, 0))

while queueIndex < queue.count {
    let now = queue[queueIndex]
    queueIndex += 1

    if now.count == s {
        result = now.time
        break
    }

    makeEmoji(now.count, now.time, now.copyCount)
}

func makeEmoji(_ count: Int, _ time: Int, _ copyCount: Int) {
    if count < visited.count && !visited[count].contains(copyCount) {
        visited[count].append(copyCount)
        // 1. 복사
        queue.append((count, time + 1, count))
        // 2. 붙여넣기
        queue.append((count + copyCount, time + 1, copyCount))
        // 3. 삭제
        if count - 1 > 0 {
            queue.append((count - 1, time + 1, copyCount))
        }
    }
}

print(result)
