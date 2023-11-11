#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>

int main()
{
    float gewicht, groesse, bmi;

    printf("\n#\n# BMI\n#\n");
    printf("Gewicht in kg eingeben: ");
    scanf("%f", &gewicht);

    printf("Größe in cm eingeben: ");
    scanf("%f", &groesse);

    bmi = ((gewicht) / ((groesse/100 * groesse/100)  ));

    printf("\n\nBMI liegt bei: %.2f\n\n", bmi);
    return 0;
}
   