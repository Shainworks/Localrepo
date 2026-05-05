Got it — same clean format, no comments, numbered sections 👇

---

## 1

```c
#include <stdio.h>
#include <conio.h>

int IP[64] = {  
    58, 50, 42, 34, 26, 18, 10, 2,  
    60, 52, 44, 36, 28, 20, 12, 4,  
    62, 54, 46, 38, 30, 22, 14, 6,  
    64, 56, 48, 40, 32, 24, 16, 8,  
    57, 49, 41, 33, 25, 17, 9, 1,  
    59, 51, 43, 35, 27, 19, 11, 3,  
    61, 53, 45, 37, 29, 21, 13, 5,  
    63, 55, 47, 39, 31, 23, 15, 7  
};

unsigned long feistel_function(unsigned long right, unsigned long key) {
    return right ^ key;
}

void initial_permutation(unsigned char input[8], unsigned char output[8]) {
    int i;
    for (i = 0; i < 8; i++) {
        output[i] = 0;
    }
    for (i = 0; i < 64; i++) {
        int bit_position = IP[i] - 1;
        int byte_index = bit_position / 8;
        int bit_index = bit_position % 8;
        if (input[byte_index] & (1 << (7 - bit_index))) {
            output[i / 8] |= (1 << (7 - (i % 8)));
        }
    }
}

void des_encrypt(unsigned long plaintext, unsigned long key) {
    unsigned char input[8], output[8];  
    int i;

    for (i = 0; i < 8; i++)
        input[i] = (plaintext >> (56 - i * 8)) & 0xFF;

    initial_permutation(input, output);

    unsigned long permuted_plaintext = 0;
    for (i = 0; i < 8; i++)
        permuted_plaintext |= ((unsigned long)output[i] << (56 - i * 8));

    unsigned long left = (permuted_plaintext >> 32) & 0xFFFFFFFF;
    unsigned long right = permuted_plaintext & 0xFFFFFFFF;

    printf("\nAfter Initial Permutation: L0 = %08lX, R0 = %08lX", left, right);

    for (i = 0; i < 16; i++) {
        unsigned long temp = right;
        right = left ^ feistel_function(right, key);
        left = temp;
        printf("\nRound %2d: L = %08lX, R = %08lX", i + 1, left, right);
    }

    unsigned long ciphertext = (right << 32) | left;
    printf("\nCiphertext: %08lX\n", ciphertext);
}

void main() {
    unsigned long plaintext = 0x0123456789ABCDEF;
    unsigned long key = 0x133457799BBCDFF1;

    clrscr();

    printf("Original Plaintext: %08lX\n", plaintext);

    des_encrypt(plaintext, key);

    getch();
}
```

---

## 2

```c
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>

int gcd(int a, int b) {
    while (b != 0) {
        int temp = b;
        b = a % b;
        a = temp;
    }
    return a;
}

long long mod_exp(long long base, long long exp, long long mod) {
    long long result = 1;
    while (exp > 0) {
        if (exp % 2 == 1) {
            result = (result * base) % mod;
        }
        base = (base * base) % mod;
        exp /= 2;
    }
    return result;
}

int mod_inverse(int e, int phi) {
    int m0 = phi, t, q;
    int x0 = 0, x1 = 1;
    if (phi == 1) return 0;
    while (e > 1) {
        q = e / phi;
        t = phi;
        phi = e % phi, e = t;
        t = x0;
        x0 = x1 - q * x0;
        x1 = t;
    }
    if (x1 < 0) x1 += m0;
    return x1;
}

void generate_keys(int *n, int *e, int *d) {
    int p = 61, q = 53;
    *n = p * q;
    int phi = (p - 1) * (q - 1);
    *e = 3;
    while (gcd(*e, phi) != 1) {
        (*e)++;
    }
    *d = mod_inverse(*e, phi);
}

long long encrypt(int msg, int e, int n) {
    return mod_exp(msg, e, n);
}

long long decrypt(long long cipher, int d, int n) {
    return mod_exp(cipher, d, n);
}

int main() {
    int n, e, d;
    generate_keys(&n, &e, &d);

    printf("Generated RSA Keys:\n");
    printf("Public Key: (n = %d, e = %d)\n", n, e);
    printf("Private Key: (n = %d, d = %d)\n", n, d);

    int message = 42;
    printf("Original Message: %d\n", message);

    long long encrypted = encrypt(message, e, n);
    printf("Encrypted Message: %lld\n", encrypted);

    long long decrypted = decrypt(encrypted, d, n);
    printf("Decrypted Message: %lld\n", decrypted);

    return 0;
}
```

---

If you want, I can also align this with **lab record format (aim, algorithm, output)** which is usually required in exams.
