// 출처 : 프로그래머스 월간 코드 챌린지 시즌1 풍선 터뜨리기
// https://programmers.co.kr/learn/courses/30/lessons/68646
// 풀이 : hogumachu

import Foundation

func solution(_ a:[Int]) -> Int {
    // 풍선은 좌측 끝과 우측 끝일 경우 모두 살릴 수 있으므로 결과는 최소 2 이상이다
    // 만약 풍선 수가 2 이하이면 전부 살릴 수 있으므로 count 만큼 return
    if a.count <= 2 {
        return a.count
    }

    // 현재 index 를 기준으로 왼쪽의 최솟값을 저장할 left 와 오른쪽의 최솟값을 저장할 right 생성
    var left: [Int] = Array(repeating: 0, count: a.count)
    var right: [Int] = Array(repeating: 0, count: a.count)

    // 가장 왼쪽과 가장 오른쪽은 무조건 살릴 수 있으므로 result 는 2로 설정하고 시작
    var result = 2

    // left와 right 의 초기 값을 설정
    left[0] = a[0]
    right[a.count - 1] = a[a.count - 1]

    // 현재의 index 의 값과 이전 의 최솟값과 비교하여 left 값을 갱신
    for i in 1..<left.count {
        left[i] = min(left[i - 1], a[i])
    }

    // 현재의 index 의 값과 이전 의 최솟값과 비교하여 right 값을 갱신
    for i in stride(from: a.count - 2, through: 0, by: -1) {
        right[i] = min(a[i], right[i + 1])
    }

    // 만약 왼쪽과 오른쪽을 비교했을 때 내 자신이 최대값이면 살릴 수 없고 그렇지 않으면 살릴 수 있음
    for i in 1..<a.count - 1 {
        if a[i] == max(a[i], left[i - 1], right[i + 1]) {
            continue
        } else {
            result += 1
        }
    }

    return result
}
