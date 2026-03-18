.data
    msg_fmt: .asciz "Hello, world (printf)\n"
    msg_wrt: .asciz "Hello, world (write)\n"
    msg_err: .asciz "Write failure (stdout)\n"
#define MSG_LEN 21

.text
.global main

main:
    la a0, msg_fmt
    call printf
    li a7, 16
    li a0, 1
    la a1, msg_wrt
    li a2, MSG_LEN
    ecall

    li t0, MSG_LEN

    bne a0, t0, failure

    li a7, 2
    li a0, 0
    ecall
failure:
    li a7, 16
    li a0, 2
    la a1, msg_err
    li a2, 23
    ecall

    li a7, 2
    li a0, 1
    ecall 