#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>
#define OPEN open("Grace_kid.c", O_CREAT | O_WRONLY | O_TRUNC, 0644)
#define STR "#include <stdio.h>%1$c#include <fcntl.h>%1$c#include <unistd.h>%1$c#define OPEN open(%2$cGrace_kid.c%2$c, O_CREAT | O_WRONLY | O_TRUNC, 0644)%1$c#define STR %2$c%3$s%2$c%1$c#define MAIN(code) int main() {code}%1$c%1$cMAIN(int fd = OPEN; if (fd == -1) return 1; dprintf(fd, STR, 10, 34, STR); close(fd); return (0);)%1$c"
#define MAIN(code) int main() {code}

MAIN(int fd = OPEN; if (fd == -1) return 1; dprintf(fd, STR, 10, 34, STR); close(fd); return (0);)
