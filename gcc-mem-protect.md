# &#35; memory protection of gcc

#### &#42; gcc manual : <https://..../>

#### &#42; All off
```bash
$ gcc -m32 -mpreferred-stack-boundary=2 -fno-stack-protector -z execstack -no-pie -z norelro filename.c -o filename
$ gcc -m64 -mpreferred-stack-boundary=4 -fno-stack-protector -z execstack -no-pie -z norelro filename.c -o filename
```

#### &#42; Compile bit(32/64bit)
```bash
$ sudo apt install gcc-multilib # install lib
$ gcc -m32 ... # compile 32bit on 64bit
$ gcc -m64 ... # compile 64bit on 64bit (default option)
```

#### &#42; Fixed dummy between variables(32/64bit)
```bash
$ gcc -mpreferred-stack-boundary=2 ... # 32bit
$ gcc -mpreferred-stack-boundary=4 ... # 64bit
```


#### &#42; ASLR(Address Space Layout Randomization)
```bash
$ sudo echo 0 > /proc/sys/kernel/randomize_va_space     # ASLR off
$ sudo echo 1 > /proc/sys/kernel/randomize_va_space     # Stack, Library on
$ sudo echo 2 > /proc/sys/kernel/randomize_va_space     # All(Stack, Library, Heap) on

$ sudo sysctl -w kernel.randomize_va_space=0
$ sudo sysctl -w kernel.randomize_va_space=1
$ sudo sysctl -w kernel.randomize_va_space=2
```

#### &#42; Canary/SSP(Stack Smashing Protector) 
```bash
$ gcc -fno-stack-protector    # Canary off
$ gcc -fstack-protector       # Canary on
```


#### &#42; NX((None eXecute)/DEP(Data Execution Protection) 
```bash
$ gcc -z execstack            # NX off

$ sudo sysctl -w kernel.exec-shield=0 
```


#### &#42;  PIE(Position Independent Execution)
```bash
$ gcc -no-pie                 # PIE off
$ gcc -fpie                   # .text on
$ gcc -fpie -pie              # All on
```

#### &#42; RELRO(ReLocation Read-Only) 
```bash
$ gcc -z norelro              # RELRO off
$ gcc -z relro                # Partitial-RELRO
$ gcc -z relro -z now         # Full-RELRO on
```

#### &#42; Fortify_source 
```bash
$ gcc -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=0         # Confuse off
$ gcc -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=1         # Partitial-Confuse
$ gcc -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2         # Full-Confuse on
```

