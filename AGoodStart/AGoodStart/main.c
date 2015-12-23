//
//  main.c
//  AGoodStart
//
//  Created by Douglas Barreto on 12/23/15.
//  Copyright © 2015 Douglas Mendes. All rights reserved.
//

#include <stdio.h>
#include <math.h>

int main(int argc, const char * argv[]) {
    // insert code here...
    
    double pi = 3.14;
    double intergerPart;
    double floatPart;
    
    floatPart = modf(pi, &intergerPart);
    
    printf("My interger part is: %.0f and my float part is %.2f \ng", intergerPart, floatPart);
    
    return 0;
}




