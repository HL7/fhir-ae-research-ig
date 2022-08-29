Profile: AdverseEventClinicalCare
Parent: AdverseEvent
Id: AdverseEvent-clinical-care
Title: "AdverseEventClinical"
Description: "An example profile of AdverseEvent for Clinical use."
* study 0..0
//* expectedInResearchStudy 0..0

Instance: ClinicalAdverseEventExample
InstanceOf: AdverseEventClinicalCare
Usage: #example
Title: "ClinicalAdverseEventExample"
Description: "example"
* actuality = #actual
* status = #completed
* subject = Reference(PatientExample)
* outcome = http://snomed.info/sct#397882007 "Unnoticed by patient, transient"
* seriousness = http://terminology.hl7.org/CodeSystem/adverse-event-seriousness#non-serious
* resultingCondition = Reference(AEexampleCondition)
//* event = http://snomed.info/sct#1204142001 "Flushing of face caused by spicy food (finding)"
//* event.text = "Gustatory flushing"
* category = http://terminology.hl7.org/CodeSystem/adverse-event-category#wrong-body-site "wrong-body-site"

Instance: AEexampleCondition
InstanceOf: Condition
Usage: #example
Title: "AEexampleCondition"
Description: "example adverse event condition"
* clinicalStatus = #resolved
* subject = Reference(PatientExample)
* severity = http://snomed.info/sct#255604002 "Mild"
* code = http://snomed.info/sct#1204142001 "Flushing of face caused by spicy food (finding)"
* code.text = "Gustatory flushing"

//TO-DO: add use case 8
//https://confluence.hl7.org/pages/viewpage.action?pageId=49646529#AdverseEventUseCases-UseCase8-AdverseEventresultedfromaseparatepriorbreach
