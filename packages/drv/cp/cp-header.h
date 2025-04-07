#ifndef CPHEADER_H
#define CPHEADER_H
#include <bits/stdc++.h>
using namespace std;

#define VARNAME(x) #x
template <typename T>
ostream& operator<<(ostream& out, const vector<T>& arr);
template <typename T>
ostream& operator<<(ostream& out, const set<T>& arr);
template <typename T>
ostream& operator<<(ostream& out, const unordered_set<T>& arr);
template <typename T, typename U>
ostream& operator<<(ostream& out, const unordered_map<T, U>& arr);
template <typename T, typename U>
ostream& operator<<(ostream& out, const map<T, U>& arr);
template <typename T>
ostream& operator<<(ostream& out, const queue<T>& qu);
template <typename T>
ostream& operator<<(ostream& out, const stack<T>& st);
template <typename T, int N>
ostream& operator<<(ostream& out, const array<T, N>& arr);
template <typename T, typename U>
ostream& operator<<(ostream& out, const pair<T, U>& p);
template <typename T>
ostream& operator<<(ostream& out, const priority_queue<T>& pq);
template <typename T>
ostream& operator<<(ostream& out, const unordered_multiset<T>& ms);
template <typename T>
ostream& operator<<(ostream& out, const multiset<T>& ms);
template <typename T>
ostream& operator<<(ostream& out, const deque<T>& dq);
vector<string> split(const char* str);

void printer(const vector<string>& identifiers, const int i);
template <typename T, typename... Args>
void printer(const vector<string>& identifiers, const int i, T arg, Args&&... args);

template <typename T>
ostream& operator<<(ostream& out, const vector<T>& arr) {
    size_t N {arr.size()};
    out << "[";
    for (size_t i {0}; i < N; i++) {
        out << arr[i];
        if (i < N-1) out << ", ";
    }
    out << "]";
    return out;
}

template <typename T>
ostream& operator<<(ostream& out, const set<T>& arr) {
    size_t N {arr.size()};
    out << "{";
    for (size_t i {0}; i < N; i++) {
        out << arr[i];
        if (i < N-1) out << ", ";
    }
    out << "}";
    return out;
}

template <typename T>
ostream& operator<<(ostream& out, const unordered_set<T>& arr) {
    size_t N {arr.size()};
    out << "{";
    for (size_t i {0}; i < N; i++) {
        out << arr[i];
        if (i < N-1) out << ", ";
    }
    out << "}";
    return out;
}

template <typename T, int N>
ostream& operator<<(ostream& out, const array<T, N>& arr) {
    out << "[";
    for (size_t i {0}; i < N; i++) {
        out << arr[i];
        if (i < N-1) out << ", ";
    }
    out << "]";
    return out;
}

template <typename T>
ostream& operator<<(ostream& out, const stack<T>& st) {
    stack<T> copy {st};
    size_t i {0}, N {st.size()};
    out << "[";
    while (!copy.empty()) {
        if (i == 0) out << "T: ";
        out << copy.top();
        if (i < N-1) out << ", ";
        copy.pop();
        i++;
    }
    out << "]";
    return out;
}

template <typename T>
ostream& operator<<(ostream& out, const queue<T>& qu) {
    queue<T> copy {qu};
    size_t i {0}, N {qu.size()};
    out << "[";
    while (!copy.empty()) {
        if (i == 0) out << "F: ";
        out << copy.front();
        if (i == N-1) out << " :B";
        if (i < N-1) out << ", ";
        copy.pop();
        i++;
    }
    out << "]";
    return out;
}

template <typename T, typename U>
ostream& operator<<(ostream& out, const map<T, U>& arr) {
    size_t i {0}, N {arr.size()};
    out << "{";
    for (const auto& el : arr) {
        out << el.first << ": " << el.second;
        if (i < N-1) out << ", ";
        i++;
    }
    out << "}";
    return out;
}

template <typename T, typename U>
ostream& operator<<(ostream& out, const unordered_map<T, U>& arr) {
    size_t i {0}, N {arr.size()};
    out << "{";
    for (const auto& el : arr) {
        out << el.first << ": " << el.second;
        if (i < N-1) out << ", ";
        i++;
    }
    out << "}";
    return out;
}

template <typename T, typename U>
ostream& operator<<(ostream& out, const pair<T, U>& p) {
    out << "(" << p.first << ", " << p.second << ")";
    return out;
}

template <typename T>
ostream& operator<<(ostream& out, const priority_queue<T>& pq) {
    priority_queue<T> copy {pq};
    size_t i {0}, N {pq.size()};
    out << "[";
    while (!copy.empty()) {
        if (i == 0) out << "F: ";
        out << copy.front();
        if (i == N-1) out << " :B";
        if (i < N-1) out << ", ";
        copy.pop();
        i++;
    }
    out << "]";
    return out;
}

template <typename T>
ostream& operator<<(ostream& out, const unordered_multiset<T>& ms) {
    out << "{";
    for (auto it = ms.begin(); it != ms.end(); ++it)
        out << (it != ms.begin() ? ", " : "") << *it;
    return out << "}";
}

template <typename T>
ostream& operator<<(ostream& out, const multiset<T>& ms) {
    out << "{";
    for (auto it = ms.begin(); it != ms.end(); ++it)
        out << (it != ms.begin() ? ", " : "") << *it;
    return out << "}";
}

template <typename T>
ostream& operator<<(ostream& out, const deque<T>& dq) {
    out << "[F: ";
    for (auto it = dq.begin(); it != dq.end(); ++it)
        out << (it != dq.begin() ? ", " : "") << *it;
    return out << ": B]";
}

vector<string> split(const char* str) {
    stringstream ss(str);
    vector<string> tokens;

    string token;
    while (getline(ss, token, ',')) {
        tokens.push_back(token);
    }
    return tokens;
}

void printer(const vector<string>& identifiers, const int i) {};
template <typename T, typename... Args>
void printer(const vector<string>& identifiers, const int i, T arg, Args&&... args) {
    for (const char c : identifiers[i]) {
        if (c == ' ') continue;
        cout << c;
    }
    cout << " = " << arg << endl;
    printer(identifiers, i+1, args...);
}

#define print(...) \
    printer(split(#__VA_ARGS__), 0, __VA_ARGS__);
#endif // CPHEADER_H
