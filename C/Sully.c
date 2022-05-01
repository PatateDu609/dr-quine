#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <stdlib.h>
#include <string.h>

#define NB 5
#define STR "#include <stdio.h>%1$c#include <unistd.h>%1$c#include <fcntl.h>%1$c#include <stdlib.h>%1$c#include <string.h>%1$c%1$c#define NB %5$d%1$c#define STR %3$c%6$s%3$c%1$c%1$cvoid get_name(int tmp, char *str)%1$c{%1$c%2$csprintf(str, %3$cSully_%4$cd.c%3$c, tmp ? NB - 1 : NB);%1$c}%1$c%1$cvoid compile(int tmp, char *name)%1$c{%1$c%2$cchar command[128];%1$c%2$csprintf(command, %3$cgcc %4$cs -o Sully_%4$cd%3$c, name, tmp ? NB - 1 : NB);%1$c%2$csystem(command);%1$c}%1$c%1$cvoid run(int tmp)%1$c{%1$c%2$cchar cmd[16];%1$c%2$csprintf(cmd, %3$c./Sully_%4$cd%3$c, tmp ? NB - 1 : NB);%1$c%2$csystem(cmd);%1$c}%1$c%1$cint should_decrease()%1$c{%1$c%2$cchar current_name[16];%1$c%2$csprintf(current_name, %3$cSully_%4$cd.c%3$c, NB);%1$c%2$creturn !strcmp(current_name, __FILE__);%1$c}%1$c%1$cint main()%1$c{%1$c%2$cif (NB <= 0)%1$c%2$c%2$creturn (0);%1$c%2$cint tmp = should_decrease();%1$c%2$cchar name[16];%1$c%2$cget_name(tmp, name);%1$c%2$cint fd = open(name, O_WRONLY | O_TRUNC | O_CREAT, 0644);%1$c%2$cif (fd == -1)%1$c%2$c%2$creturn (1);%1$c%2$cdprintf(fd, STR, 10, 9, 34, 37, tmp ? NB - 1 : NB, STR);%1$c%2$cclose(fd);%1$c%2$ccompile(tmp, name);%1$c%2$crun(tmp);%1$c%2$creturn 0;%1$c}%1$c"

void get_name(int tmp, char *str)
{
	sprintf(str, "Sully_%d.c", tmp ? NB - 1 : NB);
}

void compile(int tmp, char *name)
{
	char command[128];
	sprintf(command, "gcc %s -o Sully_%d", name, tmp ? NB - 1 : NB);
	system(command);
}

void run(int tmp)
{
	char cmd[16];
	sprintf(cmd, "./Sully_%d", tmp ? NB - 1 : NB);
	system(cmd);
}

int should_decrease()
{
	char current_name[16];
	sprintf(current_name, "Sully_%d.c", NB);
	return !strcmp(current_name, __FILE__);
}

int main()
{
	if (NB <= 0)
		return (0);
	int tmp = should_decrease();
	char name[16];
	get_name(tmp, name);
	int fd = open(name, O_WRONLY | O_TRUNC | O_CREAT, 0644);
	if (fd == -1)
		return (1);
	dprintf(fd, STR, 10, 9, 34, 37, tmp ? NB - 1 : NB, STR);
	close(fd);
	compile(tmp, name);
	run(tmp);
	return 0;
}
