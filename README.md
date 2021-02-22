## DIGIT Test Automation Framework and Setup Guide
# Preface:
DIGIT, a REST API platform based out of microservices architecture.
# Role of Test Automation:
1. Robust test framework, functions as platform independent test suite
2. Framework handles multi tenant by tuning only environment properties file changes
3. Dynamic test data creations on instant API calls
4. Reusability of code, features with data driven tests
5. Test suites catagirisation to utilise automation suite based on platform test requirements - In-progress
6. Ensure environment specific test data cleanup post test suite complete - In-progress

##### Table of Contents
* [Project Brief](#about-the-project)
* [Tools and Technologies Used](#technology-used)
* [Automation Framework Kick-off](#getting-started)
  * [Pre-requisites](#prerequisites)
  * [KARATE Framework, Source Code, GIT Installation](#installation)
  * [Configurations](#configurations)
* [Run with Command Prompt](#run-with-command-prompt)
* [List Of Tags](#list-of-tags)
* [Test Reporting](#test-reporting)
* [Test Coverage](#test-coverage)
* [Upcoming Services](#upcoming-services)

## Project Brief
DIGIT Test Automation Framework plays a significant role in automating DIGIT workflows of Core, Business and Municipal services. automation test suite solves the problem of validating workflows and functionalities of DIGIT at any given point of code changes. 

DIGIT Test Automation suite with one click brings quick turnaround of quality validations of DIGIT services and workflows without any manual quality engineering test efforts.

DIGIT Test Automation suite also majorly deals with various API services validation. 
it enables to test and validate back end services accross all active environments and as well as tenant ids. 

DIGIT Test Automation suite covers most key role in testing eGov configuration "KAFKA" architecture by validating producing and consuming real time event TOPICS to and from KAFKA Server.

For more details on KARATE framework architecture 
please refer the [KARATE FRAMEWORK Knowldge Base](https://digit-discuss.atlassian.net/wiki/spaces/EPE/pages/1028521985/Automation+Framework+Knowledge+Base)
 
### Tools and Technologies Used
 * [Java](https://www.java.com/en/):      Java version(s): 8.0
 * [JavaScript](https://developer.mozilla.org/en-US/docs/Web/JavaScript)
 * [Karate](https://github.com/intuit/karate/tree/v0.9.6) : 0.9.6
 * [Gherkin](https://cucumber.io/docs/gherkin/reference/)
 * [Cucumber](https://cucumber.io/docs/cucumber/api/)
 BDD framework - Behavior Driven Development is a software development approach 
 
## Automation Framework Kick-Off
### Pre-requisites
 * Two main software utilities required:  JAVA and MAVEN

 The step by step setup guidelines are provided below based on operating system.
 ###### On Windows
 * [JAVA Installl/Configure]
 *(https://www.java.com/en/download/help/windows_manual_download.html)
 [JAVA PATH Setting]: (https://javatutorial.net/set-java-home-windows-10)

 * [maven 3.6.3]
 (https://maven.apache.org/download.cgi)
(https://maven.apache.org/install.html)
###### On Mac
 * [JAVA Installl/Configure] (https://www.java.com/en/download/help/mac_install.html)
 [JAVA PATH Setting]: (https://docs.oracle.com/javase/tutorial/essential/environment/paths.html)

 * [maven 3.6.3]
 (https://www.baeldung.com/install-maven-on-windows-linux-mac)

<!--Installation-->
# KARATE Framework, Source Code, GIT Install
Supported IDEs for Code/Test Runs: (https://github.com/intuit/karate/wiki/IDE-Support)

Visual Studio Setup: (https://visualstudio.microsoft.com/downloads/)
* GIT Installation:
 -Install GIT in your local operating system 
  (https://git-scm.com/downloads)
 (https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
- Create a Local Repository Path Working Directory:
Windows Example: <Local Working Directory path>\test-automation

- Open Visual studio: Ctl+~ (to open terminal) and change path to <Local Working Directory path>
- Perform source code clone to local repository path working directory using git clone
Command: to clone the project repository in the system
git clone https://github.com/egovernments/test-automation.git
git checkout <Your Branch>
git pull origin karate-master
# Check List to ensure to start automation test Runs:
1. JAVA, MAVEN path set in ENVIRONMENT variables
2. Visual studio, GIT installed
3. DIGIT Test Automation Framework is covered with all "Core, Business and Municipal" services feature, pretest, tests, constant, yaml Files.
4. Create environment configuration yaml file at any given path of your local system, per test environment to input while we run automation suite.
 
 Environement configuartion file contains parameters such as host, cityCode, stateCode, user credentials etc.

 Ex:  1. <Local Working Directory path>karate\qa.yaml
      2. <Local Working Directory path>karate\uat.yaml
     
###### Project Level 
  * Create the configuration file for parameters (like: host, cityCode, stateCode, user credentials etc.) as per the environments in any path of your local system as `.yaml` file. 
  
  For ex:`/Users/admin/Desktop/config.yaml`
  * Create the environment config file in below format
  ```yaml
  host: hostUrl
stateCode: pb
cityCode: amritsar
# Super User credentials for login(need to create user manually)
superUser:
  userName: userName
  password: password
  type: EMPLOYEE
# Employee username and password to update an existing user's profile (need to create user manually)
employee:
  userName: userName
  password: password
  type: EMPLOYEE
  ```
  * Create multiple config files if execution is required for multiple environments and pass the respective file path while executing the run command
  
### Now we are set to start to start automation test runs from Visual studio IDE terminal

##### Run with Command Prompt
NOTE:
1. Test cases are grouped by TAG names based on DIGIT Services

Ex: AccessControl service feature file is composed of N number of test cases and are tagged as @accessControl

##### Generic Command prompt to start test runs:

1. Running one service feature test cases:

<Local Repository Path Working Directory>mvn clean test "-DconfigPath=<Environment configuration file path>" "-Dkarate.options=--tags <@tagname1>" classpath:com/egov"

Ex: 
<Local Repository Path Working Directory>mvn clean test "-DconfigPath=<Local Working Directory path>\qa.yaml" "-Dkarate.options=--tags @egfMasterBankAccount classpath:com/egov"

2. Running multiple services feature test cases at one shot:

Note: Multiple Services and associated Test cases can be run adding multiple tag names with same command format

Ex: 
<Local Repository Path Working Directory>mvn clean test "-DconfigPath=<Environement configuartion file path>" "-Dkarate.options=--tags <@tagname1,@tagname2,@tagname3,@tagname4" classpath:com/egov"

- Note: 
 @regression is a TAG name to run full set of Core, Business, Municipal Services and assiciated test cases as a suite.
 
<<<<<<< HEAD
##### Caution: avoid running @regression to avoid system performence issues and data consumptions at eGov configuarations.

## List Of all services tags
=======
## Run with Command Prompt
It is possible to specify certain test tags and environment details from command prompt or terminal itself. Steps mentioned below.
 * Open command prompt or terminal on project folder
 * Execute `mvn clean test "-DconfigPath=/path/to/config/file.yaml" "-Dkarate.options=--tags <tag1>,<tag2> classpath:com/egov"`
 ###### For example  
 `mvn clean test "-DconfigPath=/Users/admin/eGovAuto/config.yaml" "-Dkarate.options=--tags @searchMdms,@accessControl classpath:com/egov"`
 
## List Of Tags

* To run all the tests, use the tag `@regression`(this tag excludes `@userOtp` and `@egovWorkflowProcess` testcases from execution to avoid triggering sms service. Use these tags along with `@regression` only if necessary)

* To run the tests based on required services for execution, use below listed tags
>>>>>>> 05eff5862c9d2d7a0755555e792da4630888bd23

The listed tags are available currently in the framework
| Tags          		      | Description   			         |        
| ------------- 		      |:-------------:			         |
| @reports      		      | Reports tests 			         | 
| @searchMdms   		      | Search mdms tests         | 
| @Searcher     		      | Searcher tests            |
| @location     		      | Location tests			         |
| @localization 		      | Loacalization tests		     |
| @userotp      		      | User OTP tests			         |
| @eGovUser				         | User profile update tests |
| @accessControl		      | Access control tests 		   |
| @hrms         		      | HRMS tests				            |
| @collectionServices 	 | Collecetion Service tests	|
| @billingServiceDemand | Billing Demand tests		    |
| @pdfservice           | PDF Service tests			      |
| @billingServiceBill   | Billing Service Bill tests|
| @idGenerate			        | ID generation tests		     |
| @egovWorkflowProcess  | Workflow tests			         |
| @fileStore			         | File store tests			       |
| @pgservices			        | PG Service tests			       | 

## Test Reporting
To determine the test results and analysis the test faliures test reporting is required. This framework can generate two type of test reports
 * Post execution of test runs, framework will automatically generate `karate-summary.html` file which can be found under `./test-automation/target/cucumber-html-reports/overview-features.html`
 * A folder will automatically create under `./target/` folder along with timestamp which will contain `cucumber-html-reports` 
 
<!-- Test Coverage -->
## Test Coverage

DIGIT Test Automation Framework cover validations of below services.
* Test Coverage details
   * Core-services
   * Business-services
   * Municipal-services
   
[Refer Details Product Requirements on Services] :
(https://digit-discuss.atlassian.net/wiki/spaces/EPE/pages/2098331/Product+requirements)