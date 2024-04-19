#include <stdio.h>

#ifdef CONFIG_HELLO
#include "hello.h"
#endif

#ifdef CONFIG_BYE
#include "bye.h"
#endif

int main(void) {
    #ifdef CONFIG_HELLO
    hello();
    #endif

    #ifdef CONFIG_BYE
    bye();
    #endif

    return 0;
}
