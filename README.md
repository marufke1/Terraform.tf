                                                               **TERRAFORM PROJECT COMPLTE DESCRIPTION:** 
                                                                   
**INTRODUCTION:**    I AM GOING TO WRITE THIS TERRAFORM CODE TO CREATE A CUSTOM VPC WITH 2 SUBNETS ONE IS PRIVATE ANOTHER ONE IS PUBLIC ALSO CREATED AN 
INTERNET GATEWAY TO ATTACH WITH PUBLIC SUBNET. THEN I CREATED A ROUTING TABLE AND ASSOCIATING WITH PUBLIC SUBNET. I ALSO CREATED A TWO SECURITY GORUP ONE 
FOR PUBLIC AND THE OTHER ONE IS FOR PRIVATE ACCESS. FINALLY I CREATED 2 EC2 INSTANCES AND DEPLOYING ONE EC2 INSTANCE IN PUBLIC SUBNET AND ANOTHER ONE IS 
IN PRIVATE SUBNET.

**DESCRIPTION:**    AT FIRST I AM GOING TO CREATE MAIN.TF FILE AND INSIDE OF THIS FILE TO DEFINE THE INFORMATION ABOUT "PROVIDER" AND "RESOURCES"

**PROVIDER**        I DEFINED THE PROVIDER AS AN AWS AND ALSO CHOOSE THE REGION WHERE TO DEPLOY ALL THE RESOURCES BY USING TERRAFORM. FINALLY GENERATE 
THE ACCESS KEY AND SECRET ACCESS KEY FROM THE MANAGENEMT CONSOLE THAT ALLOW TO ESTABLISH A CONNECTIO BETWEEN AWS PROVIDER AND TERRAFORM.

**RESOURCE 01:**


