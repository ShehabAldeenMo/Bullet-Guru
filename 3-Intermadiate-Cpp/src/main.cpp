#include <iostream>
#include <string>

#include "math.hpp"
#include "array.hpp"

using namespace std;

int main()
{
    // std::cout << "Hello World"  << "\n";

    // array <int,10> my_array ;

    // my_array [2] = 100 ;

    // cout <<  my_array [2] << '\n' ;

    auto sub_ = sub(500, 20, 50, 70, 2, 100);
    std::cout << "sub: " << sub_ << '\n'; // Output the maximum value

    // Call1: T: int , U: int , Ts: {int, double}
    // Call2: T: int , U: double , Ts: {}
    // Call3: search function with 0 parameter.

    // std::cout << sum (100,50.5,80.8,1000) << '\n';
}