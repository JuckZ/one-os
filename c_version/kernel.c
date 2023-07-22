void hello_world() {
    const char* str = "Hello, World";
    char* video_mem = (char*) 0xb8000;
    while (*str != 0) {
        *video_mem = *str;
        str++;
        video_mem += 2;
    }
}
