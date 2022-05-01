#include <stdio.h>

/*
	Global scope
*/

void printer()
{
	char *str = "#include <stdio.h>%1$c%1$c/*%1$c%2$cGlobal scope%1$c*/%1$c%1$cvoid printer()%1$c{%1$c%2$cchar *str = %4$c%3$s%4$c;%1$c%2$cprintf(str, 10, 9, str, 34);%1$c}%1$c%1$cint main()%1$c{%1$c%2$c/*%1$c%2$c%2$cLocal scope%1$c%2$c*/%1$c%2$cprinter();%1$c%2$creturn (0);%1$c}%1$c";
	printf(str, 10, 9, str, 34);
}

int main()
{
	/*
		Local scope
	*/
	printer();
	return (0);
}
