#include <stdio.h>
int main ()
{
	int score , count = 3 ;
	do 
	{
		printf( "Enter score : " ) ;
		scanf( "%d" , &score ) ;
		switch ( score )
		{
			case 90 ... 100 :
				printf( "得 A\n" ) ;
				break ;
			case 80 ... 89 :
				printf( "得 B\n" ) ;
				break ;
			case 70 ... 79 :
				printf( "得 C\n" ) ;
				break ;
			case 60 ... 69 :
				printf( "得 D\n" ) ;
				break ;
			default :
				printf( "得 F\n" ) ;
				break ;
		}
		count-- ;
	}while ( count > 0 ) ;
}
