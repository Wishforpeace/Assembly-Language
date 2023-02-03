#include <stdio.h>
#include <math.h>
void print(int w)
{
    int i;
    if (w != 0)
    {
        print(w - 1);
        for (i = 1; i <= w; i++)
        {
            printf("%3d", w);
        }
        printf("\n");
    }
}
int main()
{
    int w = 3;
    print(3);
}