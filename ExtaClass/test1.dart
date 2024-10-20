import 'dart:io';
 
void main()
{
    int direction = 0;
    // Read input from STDIN
    //int.parse(stdin.readLineSync() as String
    String? instructions  = stdin.readLineSync(); 
    
    /* Enter your code here. Print output to STDOUT */
    if(instructions != null){
        for( var instruction in instructions.split("")){
            switch(instruction){
                case 'R': {
                    direction++;
                    break;
                }
                case 'L':{
                    direction--;
                    break;
                }
            }
        }   
    }
    print(direction);
    
}