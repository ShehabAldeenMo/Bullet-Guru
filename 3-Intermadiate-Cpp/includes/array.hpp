#ifndef _ARRAY_H_
#define _ARRAY_H_

#include <stdio.h>

template <typename T, size_t N>
class array
{
private:
    size_t Max_Size{N};
    T buffer[N];

public:
    explicit array(const T init_value = 0)
    {
        for (auto &i : this->buffer)
        {
            i = init_value;
        }
    }

    T &operator[](const size_t i)
    {
        return buffer[i];
    }

    size_t max_size() const
    {
        return this->Max_Size;
    }
};

#endif