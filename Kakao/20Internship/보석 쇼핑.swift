// 출처 : 프로그래머스 2020 카카오 인턴십 보석 쇼핑
// https://programmers.co.kr/learn/courses/30/lessons/67258
// 풀이 : hogumachu
// 투포인터로 풀 수 있는 문제
// 처음에는 투포인터를 왼쪽 오른쪽 왔다 갔다 했는데 시간 초과
// 검색하여 풀이법을 보니 size 에 따라 변경하였음 left, right 를 증가시켰음
// 또 Set을 단순히 count 로 사용하여 유니크한 값들이 몇 개가 있는 지 얻는 방법도 알았음

import Foundation

func solution(_ gems:[String]) -> [Int] {
    // Set(Array).count 이런 방식으로 배열 안의 유니크한 값들이 몇 개가 존재하는 지 알 수 있음.
    let n = Set(gems).count

    // 초기 값 설정
    var dict: [String: Int] = [gems[0]: 1]

    // start 와 end 는 현재 gems 의 시작과 끝 전체로 설정함
    var start = 0
    var end = gems.count - 1

    // left 와 right 값을 설정하고 size 는 dict 에 넣어둔 초기 값 1 로 시작 (size 는 유니크한 값들이 몇 개 있는 지에 대한 값임)
    var left = 0
    var right = 0
    var size = 1

    while left < gems.count && right < gems.count {
        // size 가 n 과 같다면 (현재 모든 유니크한 값들이 포함이 되어 있다면)
        if size == n {
            // 해당 조건일 때 start, end 값을 갱신함
            if end - start == right - left {
                if left < start {
                    start = left
                    end = right
                }
            } else if end - start > right - left {
                start = left
                end = right
            }

            // dict 에 값이 1에서 0이 된다면 더이상 그 값은 포함하지 않는 것이므로 size를 -1 함
            if dict[gems[left]]! == 1 {
                dict[gems[left]]! -= 1
                size -= 1
            } else {
                dict[gems[left]]! -= 1
            }
            left += 1
        } else {
            right += 1

            // right 가 크기를 넘어갈 때는 멈춤
            if right == gems.count {
                break
            }

            // dict에 right 에 대한 값이 없거나 0 일 때
            if dict[gems[right]] == nil || dict[gems[right]] == 0 {
                // 값을 1로 설정하고 size 를 1 증가 시킴 (새로운 유니크한 값이 dict 에 포함되었기 때문)
                dict[gems[right]] = 1
                size += 1
            } else {
                dict[gems[right]]! += 1
            }
        }
    }

    return [start + 1, end + 1]
}
