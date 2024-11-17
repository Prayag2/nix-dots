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
  std::vector<T>& arr(int U = 0) {
    static std::vector<int> inpArr(U);
    for (size_t i {0}; i < U; i++) {
      std::cin >> inpArr[i];
    }
    return inpArr;
  }
}

#endif
