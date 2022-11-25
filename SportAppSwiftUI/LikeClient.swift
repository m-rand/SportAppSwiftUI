import ComposableArchitecture
import Foundation
import XCTestDynamicOverlay

struct LikeClient {
  var like: @Sendable (Bool, Int) async throws -> Int
}

extension DependencyValues {
  var likeClient: LikeClient {
    get { self[LikeClient.self] }
    set { self[LikeClient.self] = newValue }
  }
}

extension LikeClient: DependencyKey {
  static var liveValue: LikeClient {
    Self(
      like: { liked, number in
        try await Task.sleep(nanoseconds: 500_000_000)
        return liked ? number - 1 : number + 1
      }
    )
  }

  /// This is the "unimplemented" fact dependency that is useful to plug into tests that you want
  /// to prove do not need the dependency.
  static let testValue = Self(
    like: XCTUnimplemented("\(Self.self).like")
  )
}

