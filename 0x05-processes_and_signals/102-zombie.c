#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>

/**
 * infinite_while - creates an infinite while loop.
 *
 * Return: 0 Always
 */
int infinite_while(void)
{
	while (1)
	{
		sleep(1);
	}
	return (0);
}

/**
 * main - program that creates 5 zombie processes.
 *
 * Return: 0 Always
 */
int main(void)
{
	int i;
	pid_t forkme, self;

	for (i = 0; i < 5; i++)
	{
		forkme = fork();
		self = getpid();
		if (forkme == 0)
			printf("Zombie process created, PID: %u\n", self);
		else
			exit(EXIT_FAILURE);
	}

	infinite_while();

	exit(EXIT_SUCCESS);
}
