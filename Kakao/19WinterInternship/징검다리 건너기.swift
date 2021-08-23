// 출처 : 프로그래머스 2019 카카오 개발자 겨울 인턴십 징검다리 건너기
// https://programmers.co.kr/learn/courses/30/lessons/64062
// 풀이 : hogumachu

// 이분 탐색으로 문제 해결 가능
// 이전에는 투포인터 느낌으로 풀었는데 3개가 시간 초과 났음
// 1억명 정도 건널 수 있는지 없는지
// 건널 수 있다면 left = 1억, right = 2억 으로 하여 1.5 억명 정도가 건널 수 있는지 없는지 판단
// 건널 수 없다면 left = 1, right = 1억 으로 하여 5 천만명 정도가 건널 수 있는지 없는지 판단

import Foundation

func solution(_ stones:[Int], _ k:Int) -> Int {
    func binarySearch(_ mid: Int) -> Bool {
        // mid 명 건너면 징검다리를 못지나갈 수 있는 지 없는 지에 대한 값을 알 수 있음
        var cantMove = 0
        for stone in stones {
            // 만약 mid 명이 해당 돌맹이를 밟았는데 지나갈 수 없다면 cantMove 값을 1 증가
            if stone - mid <= 0 {
                cantMove += 1

                // 만약 k번 연속으로 건널 수 없다면 mid 명으로는 징검다리를 건널 수 없다는 것이므로 true
                if cantMove == k {
                    return true
                }
                // 만약 0 보다 크다면 연속으로 못건너는게 아니므로 cantMove 값을 0으로 초기화함
            } else {
                cantMove = 0
            }
        }

        return false
    }


    // 최소 다리를 1번이라도 건너야하므로 left = 1 로 설정
    var left = 1
    // 최대 stones 의 원소 값이 200_000_000 이므로 right 값을 설정
    var right = 200_000_000

    while left < right {
        let mid = (left + right) / 2

        // 만약 건널 수 있다면 right 의 값을 mid 로 줄여 다시 진행
        if binarySearch(mid) {
            right = mid

        // 만약 건널 수 없다면 left 의 값을 mid + 1 로 늘려 진행
        } else {
            left = mid + 1
        }
    }

    return left
}
