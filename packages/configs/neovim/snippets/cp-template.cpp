// TL: 1s
#include <bits/stdc++.h>
using namespace std;

#ifndef ONLINE_JUDGE
#define VARNAME(x) #x
#define ll long long
#define vi vector<int>
#define all(x) x.begin(), x.end()
#define PI 3.1415926535897932384626

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
#endif

/*
 *
 *   mmmm mmmmmmm   mm   mmmmm mmmmmmm
 *  #"   "   #      ##   #   "#   #   
 *  "#mmm    #     #  #  #mmmm"   #   
 *      "#   #     #mm#  #   "m   #   
 *  "mmm#"   #    #    # #    "   #   
 *
 */

void soln() {

}

int main() {
    ios::sync_with_stdio(0);
    cin.tie(0);
    int t {};
    cin >> t;

    for (int tn = 0; tn < t; tn++) {
        soln();
    }

    return 0;
}
