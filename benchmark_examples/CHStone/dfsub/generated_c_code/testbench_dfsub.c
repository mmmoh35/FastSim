#include<stdio.h>
#include<string.h>
#include<stdlib.h>
#include <time.h>
#define COL 2
#define INPUT 30000


int main(){
	  clock_t t;
	  t = clock();
	  FILE *fp,*fp1;
	  fp=fopen("input.txt","r");
	  fp1=fopen("output.txt","r");
	  
	
	  int index=0;
	  unsigned long long input[COL];	  
       	  unsigned long long out;
	  unsigned long long a_input_rom[INPUT],b_input_rom[INPUT],z_output_rom[INPUT];
	  int error=0;	  
	  int inp_no=0;
	  while(!feof(fp))
		{			

			char line [ 1000 ];
			char line1 [ 1000 ];			
			fscanf(fp,"%s",line);			
			input[index]=atof(line);
			index = (index+1)%COL;			
			if(index==0){				
				fscanf(fp1,"%s",&line1);
				out=atof(line1);
				a_input_rom[inp_no]=input[0];
				b_input_rom[inp_no]=input[1];
				z_output_rom[inp_no]=out;
				inp_no++;								
			}
			
		}

		int ap_clk=0;
		int ap_done=0;
		int ap_idle=0;
		int ap_ready=1;
		int ap_return=0;
		int ap_rst=0;
		int ap_start=1;
		int d=0;
		int *ap_clk1=&ap_clk;
		int *ap_done1=&ap_done;
		int *ap_idle1=&ap_idle;
		int *ap_ready1=&ap_ready;
		int *ap_return1=&ap_return;
		int *ap_rst1=&ap_rst;
		int *ap_start1=&ap_start;
		int *dummy=&d;
		top_main(ap_clk1,ap_done1,ap_idle1,ap_ready1,ap_return1,ap_rst1,ap_start1,dummy,a_input_rom,b_input_rom,z_output_rom);		


		t = clock() - t;
		double time_taken = ((double)t)/CLOCKS_PER_SEC;
		printf("Time taken: %f seconds \n", time_taken);
}
