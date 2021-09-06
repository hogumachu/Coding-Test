// 출처 : 프로그래머스 위클리 챌린지 6주차
// https://programmers.co.kr/learn/courses/30/lessons/85002
// 풀이 : hogumachu

import Foundation

func solution(_ weights:[Int], _ head2head:[String]) -> [Int] {
    // 결과 정보를 저장하기 위한 배열
    // num: 등 번호, rate: 승률, overWeightWinCount: 나보다 무게 높은 사람 이긴 수, weight: 몸무게
    var info: [(num: Int, rate: Double, overWeightWinCount: Int, weight: Int)] = []

    // weight 만큼 반복
    for i in 0..<weights.count {
        // 이긴 횟수와 진 횟수를 세기 위한 값과 나보다 몸무게 많이 나간 사람 이긴 횟수 세기 위한 값
        var winCount = 0
        var loseCount = 0
        var overWeightWinCount = 0
        for j in 0..<weights.count {
            // 만약 이겼으면
            if head2head[i][j] == "W"  {
                // winCount 증가
                winCount += 1
                // 무게가 높다면
                if weights[i] < weights[j] {
                    // overWeightWinCount 증가
                    overWeightWinCount += 1
                }
            // 만약 졌으면
            } else if head2head[i][j] == "L" {
                // loseCount 증가
                loseCount += 1
            }
        }
        // 만약 경기를 한번도 안했으면 승률을 0으로 설정
        let rate = winCount + loseCount == 0 ? 0.0 : Double(winCount) / Double(winCount + loseCount)
        // 저장함
        info.append((i + 1, rate, overWeightWinCount, weights[i]))
    }

    // 1. 승률 높으면 앞으로
    // 2. 승률이 동일하면 자신보다 무거운 복서 이긴 횟수가 크면 앞으로
    // 3. 1, 2가 동일하면 자신의 몸무게가 무거우면 앞으로
    // 4. 1, 2, 3 이 모두 동일하면 등번호가 작은 순서로
    // 위 룰로 정렬
    info.sort {
        // 승률이 같고
        if $0.rate == $1.rate {
            // 무거운 복서 이긴 횟수가 같고
            if $0.overWeightWinCount == $1.overWeightWinCount {
                // 몸무게가 같으면
                if $0.weight == $1.weight {
                    // 등번호가 작은 순서로 정렬
                    return $0.num < $1.num
                } else {
                    // 몸무게가 큰 순서로 정렬
                    return $0.weight > $1.weight
                }
            // 자신보다 무거운 복서 이긴 횟수로 정렬
            } else {
                return $0.overWeightWinCount > $1.overWeightWinCount
            }
        // 승률이 높은 순서로 정렬
        } else {
            return $0.rate > $1.rate
        }
    }

    // 결과 저장
    var result: [Int] = []

    // result 에 등 번호(num) 저장
    for info in info {
        result.append(info.num)
    }

    return result
}

// String 을 배열처럼 접근하기 위한 extension
extension String {
    subscript (index: Int) -> String {
        return String(self[self.index(self.startIndex, offsetBy: index)])
    }
}
