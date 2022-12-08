//https://confluence.hl7.org/pages/viewpage.action?pageId=49646529#AdverseEventUseCases-UseCase6-AdverseReactionreportingviaFDAMedWatchform
//PRE_IC07 Vulcan Accelerator Adverse Event Use Case_BakerWillis_2022-05-03_FINAL

//BROKEN NOT WRITTEN YET

Instance: PatientInitiatedonClinicalTrialMedWatch3500BuseCase6b
InstanceOf: AdverseEvent-clinical-research
Usage: #example
Title: "PatientInitiatedonClinicalTrialMedWatch3500BuseCase6b" 
Description: "BROKEN NOT WRITTEN YET   A patient on a clinical trial reported via MedWatch 3500B"
//* actuality = http://hl7.org/fhir/adverse-event-actuality#actual 
* status = #completed
* subject = Reference(ClinicalTrialSubject5)
* outcome = http://snomed.info/sct#405532008 "Adverse incident resulting in potentially permanent disabling damage"
//* seriousness = http://terminology.hl7.org/CodeSystem/adverse-event-seriousness#serious
* resultingCondition[0] = Reference(AEHepaticFailureUseCase7)
* resultingCondition[1] = Reference(AEHepaticFailureUseCase7complication)
* category = http://terminology.hl7.org/CodeSystem/adverse-event-category#medication-mishap "medication-mishap"
* study.display = "NCT1010101"
* suspectEntity[0].instanceCodeableConcept.text = "Aspirin"
* suspectEntity[=].causality.entityRelatedness = http://terminology.hl7.org/CodeSystem/adverse-event-causality-assess#certain "Certain"
* suspectEntity[+].instanceCodeableConcept.text = "Study Medication Use Case 7"
* suspectEntity[=].causality.entityRelatedness = http://terminology.hl7.org/CodeSystem/adverse-event-causality-assess#certain "Certain"
//* suspectEntity[=].study-information
//* suspectEntity[=].extension.url
//.extension[studyAssociatedWithAE].display = "NCT1010101"
//.extension[StudyAssociatedWithAE].display = "NCT1010101"
//* suspectEntity[=].extension[StudyInfoassociatedWithAE].ResearchSubjectAssociatedWithAE.display = "NCT1010101 subject 5"
//* suspectEntity[=].extension.ExpectedInResearchStudy = true
//* suspectEntity[=].extension.AEcausedStudyDiscontinuation = true
* recorder.display = "Clinical Research Associate"
* detected = "1905-08-23"
* recordedDate = "1905-08-24"
* code = http://snomed.info/sct#370901008 "Serious reportable event associated with product or device"

* extension[seriousness-criteria][0].extension[criterionPresent].valueBoolean = true
* extension[seriousness-criteria][=].extension[criterionCode].valueCodeableConcept = #requiresPreventImpairment "required intervention to prevent permanent damage"
* extension[seriousness-criteria][+].extension[criterionPresent].valueBoolean = true
* extension[seriousness-criteria][=].extension[criterionCode].valueCodeableConcept = #resultsinHospitalization
* extension[seriousness-criteria][+].extension[criterionPresent].valueBoolean = false
* extension[seriousness-criteria][=].extension[criterionCode].valueCodeableConcept = #resultsInDeath

* seriousness = http://terminology.hl7.org/CodeSystem/adverse-event-seriousness#serious