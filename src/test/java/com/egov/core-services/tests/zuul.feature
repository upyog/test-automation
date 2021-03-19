Feature: Business Services - HRMS

        Background:
    * def jsUtils = read('classpath:jsUtils.js')
    * call read('../../common-services/pretests/egovMdmsPretest.feature')
    * def hrmsConstants = read('../../business-services/constants/egov-hrms.yaml')
    * def commonConstants = read('../../common-services/constants/genericConstants.yaml')
    * def apportionConstants = read('../../business-services/constants/apportionService.yaml')
    * def today = getCurrentEpochTime()
    * def tomorrow = getTomorrowEpochTime()
    * def name = 'AUTOEMPLOYEE' + randomString(6)
    * def mobileNumber = '78' + randomMobileNumGen(8)
    * def email = randomString(10) + '@' + randomString(5) + '.com'
    * def employeeStatus = mdmsStateEgovHrms.EmployeeStatus[0].code
    * def dob = 635404414000 + ''
    * def gender = commonConstants.parameters.gender[randomNumber(commonConstants.parameters.gender.length)]
    * def fatherOrHusbandName = 'AUTOEMPFATHER' + randomString(6)
    * def employeeType = mdmsStateEgovHrms.EmployeeType[0].code
    * def hierarchy = mdmsCityEgovLocation.TenantBoundary[0].hierarchyType.code
    * def boundaryType = mdmsCityEgovLocation.TenantBoundary[0].boundary.label
    * def boundary = tenantId
    * def department = mdmsStatecommonMasters.Department[0].code
    * def designation = mdmsStatecommonMasters.Designation[0].code
    * def isCurrentAssignment = true
    * def fromDate = today
    * def dateOfAppointment = today
    * def toDate = null
    * call read('../../business-services/pretest/egovHrmsPretest.feature@searchEmployeeSuccessfullyWithoutEmployeeCodes')
    #* call read('../../municipal-services/tests/PropertyService.feature')
    #* print isCorrespondenceAddress
    * def hierarchyTypeCode = commonConstants.parameters.hierarchyTypeCode
    * def boundaryType = commonConstants.parameters.boundaryType
    # Searching Location for locality and areaCode
    * call read('../../core-services/pretests/location.feature@searchLocationSuccessfully')
    * def localityCode = searchLocationResponseBody.TenantBoundary[0].boundary[0].code
    * def areaCode = searchLocationResponseBody.TenantBoundary[0].boundary[0].area
    * def localityName = searchLocationResponseBody.TenantBoundary[0].boundary[0].name + ', ' + cityCode
    # initialising request payload variables
    * def financialYear = commonConstants.parameters.financialYear
    * def assessmentDate = getPastEpochDate(1)
    * def source = commonConstants.parameters.source
    * def channel = commonConstants.parameters.channel
    * def relationship = commonConstants.parameters.relationship[randomNumber(commonConstants.parameters.relationship.length)]
    * configure headers = read('classpath:websCommonHeaders.js')
    * def cityName = karate.jsonPath(mdmsStatetenant, "$.tenants[?(@.code=='" + tenantId + "')].name")[0]
    * def OccupancyType = mdmsStatePropertyTax.OccupancyType[1].code
    * def UsageCategory = mdmsStatePropertyTax.UsageCategory[0].code
    * def builtUpArea = 2000
    * def UsageCategoryMajor = mdmsStatePropertyTax.UsageCategoryMajor[0].code
    * def landArea = 800
    * def PropertyType = mdmsStatePropertyTax.PropertyType[3].code
    * def noOfFloors = 1
    * def OwnerShipCategory = mdmsStatePropertyTax.OwnerShipCategory[3].code
    * def name = randomString(10)
    * def mobileNumber = '78' + randomMobileNumGen(8)
    * def fatherOrHusbandName = randomString(10)
    * def relationship = commonConstants.parameters.relationship[randomNumber(commonConstants.parameters.relationship.length)]
    * def OwnerType = mdmsStatePropertyTax.OwnerType[5].code
    * def gender = commonConstants.parameters.gender[randomNumber(commonConstants.parameters.gender.length)]
    * def isCorrespondenceAddress = true
    * def source = commonConstants.parameters.source
    * def channel = commonConstants.parameters.channel
    * def addressProofDocumentType0 = mdmsStatePropertyTax.Documents[0].dropdownData[0].code
    * def addressProofDocumentType1 = mdmsStatePropertyTax.Documents[1].dropdownData[0].code
    * def addressProofDocumentType2 = mdmsStatePropertyTax.Documents[2].dropdownData[0].code
    * def addressProofDocumentType3 = mdmsStatePropertyTax.Documents[3].dropdownData[0].code
    * def addressProofDocumentType4 = mdmsStatePropertyTax.Documents[4].dropdownData[0].code
    * def creationReason = commonConstants.parameters.creationReason
    * def businessService = mdmsStatePropertyTax.PTWorkflow[1].businessService
    * def propertyServicesConstants = read('../../municipal-services/constants/propertyServices.yaml')
    
    @zuul_01 @zuul @regression @positive @smoke
        Scenario: Test to create a employee
    * call read('../../business-services/pretest/egovHrmsPretest.feature@createEmployeeSuccessfully')
    * def code = hrmsResponseBody.Employees[0].user.userName
    * assert hrmsResponseBody.ResponseInfo.status == commonConstants.expectedStatus.success
    * assert hrmsResponseBody.Employees[0].user.name == name
    * assert hrmsResponseBody.Employees[0].user.mobileNumber == mobileNumber

    @zuul_02 @zuul  @positive @regression  @municipalServices
    Scenario: Create Property with valid payload
    # Create a property
    * call read('../../municipal-services/pretests/propertyServicesPretest.feature@createPropertySuccessfully')
    # Validate response body
    * match propertyServiceResponseBody.Properties[0].id == "#present"
    * match propertyServiceResponseBody.Properties[0].propertyId == "#present"
    * match propertyServiceResponseBody.Properties[0].status == "INWORKFLOW"
    * match propertyServiceResponseBody.Properties[0].tenantId == tenantId

    @zuul_05  @zuul @regression @negative
        Scenario: Test to apportion a bill with AmountPaid as a NULL
     * def amountPaid = {}
     * call read('../../business-services/pretest/apportionServicePretest.feature@errorApportion')
     * match apportionResponseBody.Errors[0].message == apportionConstants.errorMessages.amountErrorMsg

     @zuul_03 @zuul  @positive @regression  @municipalServices
    Scenario: "Use Counter Employee:Validate Property Create and validate doc verifier"
# Use below qa.yaml details
# host: https://qa.digit.org/
# stateCode: pb
# cityCode: amritsar
# # Super User credentials for login(need to create user manually)
# superUser:
#   userName: EMP-107-000878
#   password: Password@2
#   type: EMPLOYEE
    # Create a property
    * call read('../../municipal-services/pretests/propertyServicesPretest.feature@errorInCreateProperty')
    # Validate response body
    * match propertyServiceResponseBody.Properties[0].id == "#present"
    * match propertyServiceResponseBody.Properties[0].propertyId == "#present"
    * match propertyServiceResponseBody.Properties[0].status == "INWORKFLOW"
    * match propertyServiceResponseBody.Properties[0].tenantId == tenantId
    # * match propertyServiceResponseBody.Errors[0].message == commonConstants.errorMessages.authorizedError
    * match propertyServiceResponseBody.creationReason == commonConstants.errorMessages.authorizedError 

    @zuul_07  @zuul @regression @negative
    Scenario: Create Property invalid tenantId
    # Set request payload variable values
    * def tenantId = 'pb.jalandhar'
    # Create a property
    * call read('../../municipal-services/pretests/propertyServicesPretest.feature@errorInCreateProperty')
    # Validate response body
    * print createPropertyRequest
    * print propertyServiceResponseBody 
    * match propertyServiceResponseBody.Errors[0].message == commonConstants.errorMessages.authorizedError

     