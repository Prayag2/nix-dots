/*
 * A very basic module which provides abstractions for array and variable input
 * I use this when practicing competitive programming
 */
#ifndef INP_H
#define INP_H
#include <iostream>
#include <vector>

namespace Inp {
  template <typename T>
  T& var() {
    static T inpVar;
    std::cin >> inpVar;
    return inpVar;
  }

  template <typename T>
  std::vector<T>& arr() {
    int N {var<int>()};
    static std::vector<T> inpArr(N);
    for (size_t i {0}; i < N; i++) {
      std::cin >> inpArr[i];
    }
    return inpArr;
  }

  template <typename T>
  std::vector<T>& arr(int N) {
    static std::vector<T> inpArr(N);
    for (size_t i {0}; i < N; i++) {
      std::cin >> inpArr[i];
    }
    return inpArr;
  }
}

#endif
