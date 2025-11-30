#include <stdio.h>
#include <string.h>
#include "../src/sign.h"

int tests_run = 0;
int tests_failed = 0;

void assert_str_equal(const char* expected, const char* actual, const char* name) {
    tests_run++;
    if (strcmp(expected, actual) != 0) {
        tests_failed++;
        printf("FAIL: %s - expected '%s' got '%s'\n", name, expected, actual);
    } else {
        printf("PASS: %s\n", name);
    }
}

int main(void) {
    assert_str_equal("Positive", signOf(10), "positive number");
    assert_str_equal("Negative", signOf(-5), "negative number");
    assert_str_equal("Zero", signOf(0), "zero");

    if (tests_failed > 0) {
        printf("%d tests failed out of %d\n", tests_failed, tests_run);
        return 1;
    }
    printf("All %d tests passed\n", tests_run);
    return 0;
}