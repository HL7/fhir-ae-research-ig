
Instance: SCHJO
InstanceOf: Patient
Usage: #example
Title: "Use Case 1 - Serious Adverse Event"
Description: "Use Case 1 - SAE Patient SCHJO on Research Study XYZ, Study ID XYZ-123, Subject number XYZ-123-002. "
* name
  * given[0] = "SCHJO"
  //* family = "Clinical Trail"
//* identifier

Instance: ClinicalTrialSubject5
InstanceOf: Patient
Usage: #example
Title: "ClinicalTrialSubject5"
Description: "Use case 7. Clinical Trial subject number 5. Acute Hepatic Failure."
* name
  * given[0] = "Subject 5"
  * family = "Clinical Trail"
* identifier

//Instance:  EveAnyperson
//InstanceOf: http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient
//Title:   "Eve Anyperson"
//Usage:  #example
//* name.given = "Eve"
//* name.family = "Anyperson"
//* birthDate = 1960-04-25
//* extension[us-core-race].extension[ombCategory].valueCoding = RaceAndEthnicityCDC#2106-3 "White"
//* extension[us-core-ethnicity].extension[ombCategory].valueCoding = RaceAndEthnicityCDC#2186-5 "Non Hispanic or Latino"