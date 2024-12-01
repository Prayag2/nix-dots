#pragma once

#include <iostream>
#include <array>
#include <vector>
#include <map>
#include <utility>

// Overload for std::pair
template <typename T1, typename T2>
std::ostream& operator<<(std::ostream& os, const std::pair<T1, T2>& p) {
    os << "(" << p.first << ", " << p.second << ")";
    return os;
}

// Overload for std::vector
template <typename T>
std::ostream& operator<<(std::ostream& os, const std::vector<T>& vec) {
    os << "[";
    for (size_t i = 0; i < vec.size(); ++i) {
        os << vec[i];
        if (i != vec.size() - 1) os << ", ";
    }
    os << "]";
    return os;
}

// Overload for std::array
template <typename T, size_t N>
std::ostream& operator<<(std::ostream& os, const std::array<T, N>& arr) {
    os << "[";
    for (size_t i = 0; i < N; ++i) {
        os << arr[i];
        if (i != N - 1) os << ", ";
    }
    os << "]";
    return os;
}

// Overload for std::map
template <typename K, typename V>
std::ostream& operator<<(std::ostream& os, const std::map<K, V>& m) {
    os << "{";
    for (auto it = m.begin(); it != m.end(); ++it) {
        os << it->first << ": " << it->second;
        if (std::next(it) != m.end()) os << ", ";
    }
    os << "}";
    return os;
}

// Overload for C-style arrays (only if size is known at compile time)
template <typename T, size_t N>
typename std::enable_if<!std::is_same<T, char>::value, std::ostream&>::type
operator<<(std::ostream& os, const T (&arr)[N]) {
    os << "[";
    for (size_t i = 0; i < N; ++i) {
        os << arr[i];
        if (i != N - 1) os << ", ";
    }
    os << "]";
    return os;
}
