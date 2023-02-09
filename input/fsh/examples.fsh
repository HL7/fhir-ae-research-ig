
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


Instance: ClinicalResearchAdverseEventexample1
InstanceOf: AdverseEvent-clinical-research
Usage: #example
Title: "ClinicalResearchAdverseEventexample1"
Description: "example"
//* actuality = http://hl7.org/fhir/adverse-event-actuality#actual 
* status = #completed
* subject = Reference(ClinicalTrialSubject5)
* outcome = http://snomed.info/sct#405532008 "Adverse incident resulting in potentially permanent disabling damage"
//* seriousness = http://terminology.hl7.org/CodeSystem/adverse-event-seriousness#serious
* resultingEffect[0] = Reference(AEHepaticFailureUseCase7) "condition caused"
* resultingEffect[1] = Reference(AEHepaticFailureUseCase7complication)
* category = http://terminology.hl7.org/CodeSystem/adverse-event-category#medication-mishap "medication-mishap"
* study.display = "NCT1010101"

* suspectEntity[0].instanceCodeableConcept.text = "Aspirin"
* suspectEntity[=].causality.entityRelatedness = http://terminology.hl7.org/CodeSystem/adverse-event-causality-assess#certain "Certain"
* suspectEntity[=].causality.entityRelatedness = http://terminology.hl7.org/CodeSystem/adverse-event-causality-assess#certain "Certain"

* suspectEntity[+].instanceCodeableConcept.text = "Study Medication Use Case 7"
* suspectEntity[=].causality.entityRelatedness = http://terminology.hl7.org/CodeSystem/adverse-event-causality-assess#certain "Certain"
* suspectEntity[=].causality.entityRelatedness = http://terminology.hl7.org/CodeSystem/adverse-event-causality-assess#certain "Certain"

//* suspectEntity[=].study-information
//* suspectEntity[=].extension.url
//.extension[studyAssociatedWithAE].display = "NCT1010101"
//.extension[StudyAssociatedWithAE].display = "NCT1010101"
* seriousness = http://terminology.hl7.org/CodeSystem/adverse-event-seriousness#serious

* recorder.display = "Clinical Research Associate"
* detected = "1905-08-23"
* recordedDate = "1905-08-24"
* code = http://snomed.info/sct#370901008 "Serious reportable event associated with product or device"
* extension[seriousness-criteria].extension[criterionPresent].valueBoolean = true
//* extension[seriousness].extension[seriousnessCriteria].valueCodeableConcept = seriousness-criteria-cs#requiresPreventImpairment "required intervention to prevent permanent damage"
* extension[seriousness-criteria].extension[criterionCode].valueCodeableConcept = #requiresPreventImpairment "required intervention to prevent permanent damage"
* extension[severity-or-grade].valueCodeableConcept = http://hl7.org/fhir/R4/valueset-adverse-event-severity.html#severe "Severe"



//https://confluence.hl7.org/pages/viewpage.action?pageId=49646529#AdverseEventUseCases-UseCase7-Clinicaltrial:significantadverseevent
Instance: ClinicalResearchAdverseEventUseCase7
InstanceOf: AdverseEvent-clinical-research
Usage: #example
Title: "ClinicalResearchAdverseEventUseCase7"
Description: "example"
//* actuality = http://hl7.org/fhir/adverse-event-actuality#actual 
* status = #completed
* subject = Reference(ClinicalTrialSubject5)
* outcome = http://snomed.info/sct#405532008 "Adverse incident resulting in potentially permanent disabling damage"
//* seriousness = http://terminology.hl7.org/CodeSystem/adverse-event-seriousness#serious
* resultingEffect[0] = Reference(AEHepaticFailureUseCase7)
* resultingEffect[1] = Reference(AEHepaticFailureUseCase7complication)
* category = http://terminology.hl7.org/CodeSystem/adverse-event-category#medication-mishap "medication-mishap"
* study.display = "NCT1010101"

* suspectEntity[0].instanceCodeableConcept.text = "Aspirin"
* suspectEntity[=].causality.entityRelatedness = http://terminology.hl7.org/CodeSystem/adverse-event-causality-assess#certain "Certain"
* suspectEntity[=].causality.entityRelatedness = http://terminology.hl7.org/CodeSystem/adverse-event-causality-assess#certain "Certain"

* suspectEntity[+].instanceCodeableConcept.text = "Study Medication Use Case 7"
* suspectEntity[=].causality.entityRelatedness = http://terminology.hl7.org/CodeSystem/adverse-event-causality-assess#certain "Certain"
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

Instance: AEHepaticFailureUseCase7
InstanceOf: Condition
Usage: #example
Title: "AEHepaticFailureUseCase7"
Description: "The fifth subject enrolled in the trial develops severe hepatic failure complicated by encephalopathy one month after starting the study. The study sponsors determined that is an unanticipated problem that must be reported because although the risk of mild liver injury was foreseen, severe liver injury resulting in hepatic failure was unexpected in severity; possibly related to participation in the research; and serious."
* subject = Reference(ClinicalTrialSubject5)
* severity = http://snomed.info/sct#24484000 "Severe"
* code =  http://snomed.info/sct#197270009 "Acute Hepatic Failure"
* clinicalStatus = #active

Instance: AEHepaticFailureUseCase7complication
InstanceOf: Condition
Usage: #example
Title: "AEHepaticFailureUseCase7complication"
Description: "The fifth subject enrolled in the trial develops severe hepatic failure complicated by encephalopathy one month after starting the study. The study sponsors determined that is an unanticipated problem that must be reported because although the risk of mild liver injury was foreseen, severe liver injury resulting in hepatic failure was unexpected in severity; possibly related to participation in the research; and serious."
* subject = Reference(ClinicalTrialSubject5)
* severity = http://snomed.info/sct#24484000 "Severe"
* code =  http://snomed.info/sct#13920009 "Hepatic encephalopathy"
* clinicalStatus = #active
