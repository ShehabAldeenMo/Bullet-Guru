#ifndef _MATH_HPP_
#define _MATH_HPP_

#include <string>
#include <type_traits>

using namespace std;
/**
 * Provide function ----> sum two integers.
 */

// two templates parameters.

// Variadic Template ----> template can take more than one argument,
// caller ---> determine number of arguments.

// Number of arguments (base case):

// 1. 0 or more argument.
int sum()
{
    return 0; // return value without any side-effect.
}
// 2. 1 or more argument (DONE).
// Template overloading.
template <typename T>
T sum(const T &a)
{
    return a;
}
// 3. 2 or more argument (DONE).

// T: int ,     U: int ,      Ts: {int, double, int}
template <typename T, typename U, typename... Ts> // parameter packing.
auto sum(const T &a, const U &b, const Ts &...values)
{
    static_assert(std::is_arithmetic_v<T>, "T should be arithmetic");

    // Solution 1: Tail recursion.
    // 1. check number of arguments ---> values.
    // values ---> 0 ---> add a + b.

    // if constexpr ( sizeof...(Ts) > 0 )
    // {
    //     // values > 0 --->
    //         // 1. add a + b ---> result.
    //         // 2. sum (result , values ...)
    //         auto r = a + b;
    //         return sum( r , values ... ); // parameters un-pack.
    // }
    // else
    // {
    //     return a + b;
    // }
    // Solution 2: Folding expression.
    auto r = a + b;
    return r + sum(values...);
}

// function template specialization
template <>
auto sum<string, string>(const string &a, const string &b)
{
    return a.length() + b.length();
}

template <typename T, typename... Ts>
T max(const T &a, const T &b, const Ts &...values)
{

    static_assert(std::is_arithmetic_v<T>, "T should be arithmetic");

    T max = (a > b) ? a : b;
    // Recursively call max with the maximum and the rest of the values
    if constexpr (sizeof...(values) > 0)
    { // Check if there are more values
        return max(max, values...);
    }
    return max; // Return the maximum value
}

template <typename T>
T max(const T &a)
{
    return a;
}

template <typename T, typename... Ts>
T min(const T &a, const T &b, const Ts &...values)
{

    static_assert(std::is_arithmetic_v<T>, "T should be arithmetic");

    T min = (a < b) ? a : b;

    if constexpr (sizeof...(values) > 0)
    {
        return min(min, values...);
    }

    return min;
}

template <typename T>
T min(const T &a)
{
    return a;
}

template <typename T, typename... Ts>
T sub(const T &a, const T &b, const Ts &...values)
{

    static_assert(std::is_arithmetic_v<T>, "T should be arithmetic");

    auto result = a - b;

    if constexpr (sizeof...(values) > 0)
    { // End recursion when there are no more values
        return sub(result, values...);
    }

    return result;
}

template <typename T>
T sub(const T &a)
{
    return a;
}

int sub()
{
    return 0; // return value without any side-effect.
}

string sub(const string &a, const string &b)
{
    return a + '-' + b; // Concatenate `a` and `b` with a dash in between
}

#endif