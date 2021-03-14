// 출처 : 백준 나는야 포켓몬 마스터 이다솜
// https://www.acmicpc.net/problem/1620
// 풀이 : hogumachu
// 처음에 읽는 값이 Int가 아니라면 해당하는 값을 찾아서 리턴하는 것을 했는데
// 결과가 시간 초과였음
// 근데 다른 사람 제출을 보니
// 그냥 Dictionary를 2개를 할당해서 손쉽게 풀어버림

import Foundation

func solution() -> Void {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    var pokemonInt: [String : String] = [:]
    var pokemonString: [String: String] = [:]
    var result: [String] = []
    for i in 1...input[0] {
        let poke = readLine()!
        pokemonInt.updateValue(poke, forKey: String(i))
        pokemonString.updateValue(String(i), forKey: poke)
    }

    for _ in 0..<input[1] {
        let m = readLine()!
        if pokemonInt[m] != nil {
            result.append(pokemonInt[m]!)
        } else {
            result.append(pokemonString[m]!)
        }
    }
    for result in result {
        print(result)
    }
}

solution()
