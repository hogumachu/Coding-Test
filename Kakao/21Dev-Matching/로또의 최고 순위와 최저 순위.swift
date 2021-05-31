// 출처 : 프로그래머스 2021 Dev-Matching: 웹 백엔드 개발자(상반기) 로또의 최고 순위와 최저 순위
// https://programmers.co.kr/learn/courses/30/lessons/77484
// 풀이 : hogumachu

import Foundation

func solution(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    var zeroCount = 0
    var winCount = 0
    var result = 7
    for lotto in lottos {
        if lotto == 0 {
            zeroCount += 1
        } else {
            for win in win_nums {
                if lotto == win {
                    winCount += 1
                    break
                }
            }
        }
    }
    if winCount + zeroCount > lottos.count {
        return [1, result-winCount]
    } else {
        if result-winCount == 7 {
            if result-winCount-zeroCount == 7 {
                return [6, 6]
            } else {
                return [result-winCount-zeroCount, 6]
            }
        } else {
            return [result-winCount-zeroCount, result-winCount]
        }

    }

}
