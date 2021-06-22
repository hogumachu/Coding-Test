// 출처 : 프로그래머스 해시 베스트앨범
// https://programmers.co.kr/learn/courses/30/lessons/42579
// 풀이 : hogumachu

import Foundation

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    var music: [String:[(Int, Int)]] = [:]
    var musicSum: [String:Int] = [:]
    var result: [Int] = []
    for i in 0..<genres.count {
        if music.keys.contains(genres[i]) {
            music[genres[i]]!.append((plays[i], i))
            musicSum[genres[i]]! += plays[i]
        } else {
            music[genres[i]] = [(plays[i], i)]
            musicSum[genres[i]] = plays[i]
        }
    }
    for key in music.keys {
        music[key]!.sort{
            if $0.0 == $1.0 {
                return $0.1 < $1.1
            } else {
                return $0.0 > $1.0
            }

        }
    }
    let order = musicSum.keys.sorted{ musicSum[$0]! > musicSum[$1]! }
    for name in order {
        if music[name]!.count >= 2 {
            result.append(music[name]![0].1)
            result.append(music[name]![1].1)
        } else {
            result.append(music[name]![0].1)
        }
    }
    return result
}
