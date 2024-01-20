- **TERRAFORM PROJECT: CUSTOM VPC WITH PRIVATE AND PUBLIC SUBNET ** 
                                                                   
- **INTRODUCTION:**    I AM GOING TO WRITE THIS TERRAFORM CODE TO CREATE A CUSTOM VPC WITH 2 SUBNETS ONE IS PRIVATE ANOTHER ONE IS PUBLIC ALSO CREATE AN 
INTERNET GATEWAY TO ATTACH WITH PUBLIC SUBNET. THEN I CREATE A ROUTING TABLE AND ASSOCIATING WITH PUBLIC SUBNET. I ALSO CREATE A TWO SECURITY GORUP ONE 
FOR PUBLIC AND THE OTHER ONE IS FOR PRIVATE ACCESS. FINALLY I CREATE 2 EC2 INSTANCES AND DEPLOYING ONE EC2 INSTANCE IN PUBLIC SUBNET AND ANOTHER ONE IS 
IN PRIVATE SUBNET.

- **DESCRIPTION:**    AT FIRST I AM GOING TO CREATE **MAIN.TF** FILE AND INSIDE OF THIS FILE TO DEFINE THE INFORMATION ABOUT "PROVIDER" AND "RESOURCES"

- **PROVIDER:**        I DEFINE THE PROVIDER AS AN AWS AND ALSO CHOOSE THE REGION WHERE TO DEPLOY ALL THE RESOURCES BY USING TERRAFORM. FINALLY GENERATE 
THE ACCESS KEY AND SECRET ACCESS KEY FROM THE MANAGENEMT CONSOLE THAT ALLOW TO ESTABLISH A CONNECTION BETWEEN AWS PROVIDER AND TERRAFORM.

- **RESOURCE 01:**     I CREATE A CUSTOM VPC AND DEFINE THE CIDIR BLOCK WITH $$VARIABLE SO THAT IF I WANT TO CUSTOMIZE THE CIDIR BOLCK (RANGE OF THE IP ADDRESS)
IN THE FUTURE THEN EASILY CAN BE ABLE TO CHANGE FROM THE VARIABLE FILE MEANS I DONT NEED TO CHANGE THE VALUE OF THE CIDIR BLOCK FROM THE RESOURCES.

- **RESOURCE 02:**     I CREATE AN INTERNET GATEWAY AND ATTACH IT WITH THE CUSTOM VPC AND THAT ALLOWS TO COMMUNICATE MY INSTNCE WITH OTHER SERVICES OVER THE INTERNET.

- **RESOURCE 03:**     I CHOOSE THE AVILABILITY ZONE TO CREATE PUBLIC SUBNET BECAUSE SUBNET IS ALWAYS DEFINED IN THE AZ AND ALSO PROVIDE THE VALUE OF CIDIR BLOCK
FOR THE SUBNET.

- **RESOURCE 04:**     I CREATE A ROUTING TABLE TO DEFINE THE ROUTING PATH SO THAT INSTANCE CAN COMMUNICATE WITH OTHER RESOUCE ON THE SAME NETWORK (INSIDE OF VPC) AND ALSO DEFINE THE LOCAL ROUTE IF INSTANCE WANTS TO COMMUNICATE TO OTHE SERVER OVER THE INTERNET THEN TRAFFIC WILL GO THROUGH TO THE INTERNET-GATEWAY.

- **RESOURCE 05:**    FINALLY, I ATTACH THE PUBLIC SUBNET WITH THE ROUTING TABLE SO THAT ANY INSTANCE DEPLOYS IN THE PUBLIC SUBNET CAN ACCESS TO OTHER SERVER OVER
 THE INTERNET.

- **RESOURCE 06:**     I CHOOSE DIFFERENT AVILABILITY ZONE TO CREATE PRIVATE SUBNET BECAUSE SUBNET IS ALWAYS DEFINED IN THE AZ AND ALSO PROVIDE THE VALUE OF CIDIR BLOCK
FOR THE SUBNET AND ANY INSTANCE DEPLOYS IN THE PRIVATE SUBNET ONLY CAN ACCESS TO THE OTHER RESOURCES IN THE VPC (MUST BE ON SAME NETWORK).

- **RESOURCE 07:**     I CREATE 2 SECURITY GROUPS. ONE SG IS ATTACHED WITH PRIVATE EC2 AND THE OTHER ONE ATTACH WITH PUBLIC EC2. I ALSO DEFINE THE SG OF PUBLIC EC2 ON
BOSTION SERVER THAT ALLOWS TO ACCESS PRIVATE RESOURCES SECURELY FROM THE INTERNET. IT WILL ALSO REDUCE THE RISK OF POTENTIAL ATTACKS.

- **RESOURCE 08:**     FINALLY, I LAUNCH 2 EC2 INSTANCES ONE IN PRIVATE SUBNET AND OTHE ONE IS IN PUBLIC AND ALSO DEFINE DIFFERENT PARAMETERS FOR THE LAUNCHING
LIKE - IAM, INSTACE TYPES, KEY-PAIR, SECURITY GROUP, SUBNET-ID, USER DATA ETC AND ALL THE PARAMETERS DEFINE WITH VARIABLES.

- **VARIABLE.TF:**     I CREATE **VARIABLE.TF** FILE WHERE ONLY DECLARE THE VARIABLE NAME AND THE VALUE. IF I WANT TO CHANGE WITH ANY PARAMETERS IN THE FUTURE THEN I JUST CAN EASILY CHANGE IT FROM VARIABLE.TF FILE. I DONT NEED TO CHANGE ANYTHING FROM MAIN.TF FILE WHERE I DECALARED ONLY THE INFORMATION ABOUT PROVIDER AND RESOURCES.

- **OUTPUT:**          FINALLY IT SHOWS THE OUTPUT OF THE CODE WHAT ACTUALLY HAS BEEN CREATED IN THE MANAGENEMT CONSOLE BY USING TERRAFROM.

- **CONCLUSION:**      AFTER WRITING ALL THE CODE, NEED TO RUN FEW COMMANDS TO EXECUTE IT.

-  **TERRAFORM INIT:** COMMAND WILL ALOOW TO ESTABLISH A CONNECTION WITH CLOUD PROVIDER AND ALSO INSTALL ALL THE DEPENDENCIES TO ACCESS WITH COLUD PROVIDER BY USING TERRAFORM SUCCESSFULLY.

- **TERRAFORM PLAN:** WILL ALLOW TO SHOW ALL THE RESOURCES WE ARE GOING TO DEFINE IT. EX: CREATE 2 EC2 INSTANCES.

-  **TERRAFORM APPLY:** WILL FINALLY TO EXECUTE THE RESOURCES IN THE MANAGEMENT CONSOLE.

-  **TERRAFORM DESTROY:** WILL ALLOW TO DELETE THE RESOURCES FROM THE MANAGEMENT CONSOLE IF IT IS NO LONGER REQUIRED.

   

   











