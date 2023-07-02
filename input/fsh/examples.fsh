
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
* status = #completed //http://hl7.org/fhir/event-status#completed
* subject = Reference(ClinicalTrialSubject5)
* outcome = urn:oid:2.16.840.1.113883.3.989.2.1.1.19#notrecoveredorresolved "Not recovering/not resolved"
//http://snomed.info/sct#405532008 "Adverse incident resulting in potentially permanent disabling damage"
//* seriousness = http://terminology.hl7.org/CodeSystem/adverse-event-seriousness#serious
//* resultingCondition[0] = Reference(AEHepaticFailureUseCase7) "condition caused"
* resultingEffect[0] = Reference(AEHepaticFailureUseCase7) 
//* e"condition caused"
//* resultingCondition[1] = Reference(AEHepaticFailureUseCase7complication)
* resultingEffect[1] = Reference(AEHepaticFailureUseCase7complication)
* category = http://terminology.hl7.org/CodeSystem/adverse-event-category#medication-mishap "Medication Mishap"
* study.display = "NCT1010101"
* suspectEntity[0].instanceReference.display = "Aspirin"
//* suspectEntity[=].instance.display = "see instance-codeable-concept"
//* suspectEntity[=].causality.entityRelatedness = http://terminology.hl7.org/CodeSystem/adverse-event-causality-assess#certain "Certain"
* suspectEntity[=].causality.entityRelatedness = http://terminology.hl7.org/CodeSystem/adverse-event-causality-assess#certain "Certain"
* suspectEntity[+].instanceReference.display = "Study Medication Use Case 7"
//* suspectEntity[=].instance.display = "see instance-codeable-concept"
//* suspectEntity[=].causality.entityRelatedness = http://terminology.hl7.org/CodeSystem/adverse-event-causality-assess#certain "Certain"
* suspectEntity[=].causality.entityRelatedness = http://terminology.hl7.org/CodeSystem/adverse-event-causality-assess#certain "Certain"

* suspectEntity[+].instanceReference = Reference(medadmin0301)
//* suspectEntity[=].causality.entityRelatedness = http://terminology.hl7.org/CodeSystem/adverse-event-causality-assess#certain "Certain"
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
* extension[seriousness-criteria].extension[criterionCode].valueCodeableConcept = $fda-add-seriousness-criteria-cs#requiresPreventImpairment "Required Intervention to Prevent Permanent Impairment or Damage (Devices)"
//#requiresPreventImpairment "required intervention to prevent permanent damage"
* extension[severity-or-grade].valueCodeableConcept = $ae-severity-or-grade-cs#3 "Severe"



//https://confluence.hl7.org/pages/viewpage.action?pageId=49646529#AdverseEventUseCases-UseCase7-Clinicaltrial:significantadverseevent
Instance: ClinicalResearchAdverseEventUseCase7
InstanceOf: AdverseEvent-clinical-research
Usage: #example
Title: "ClinicalResearchAdverseEventUseCase7"
Description: "example"
//* actuality = http://hl7.org/fhir/adverse-event-actuality#actual 
* status = http://hl7.org/fhir/event-status#completed
* subject = Reference(ClinicalTrialSubject5)
* outcome = urn:oid:2.16.840.1.113883.3.989.2.1.1.19#roveringorresolving "Recovering/Resolving"
//* seriousness = http://terminology.hl7.org/CodeSystem/adverse-event-seriousness#serious
//* resultingCondition[0] = Reference(AEHepaticFailureUseCase7)
* resultingEffect[0] = Reference(AEHepaticFailureUseCase7)
//* resultingCondition[1] = Reference(AEHepaticFailureUseCase7complication)
* resultingEffect[1] = Reference(AEHepaticFailureUseCase7complication)
* category = http://terminology.hl7.org/CodeSystem/adverse-event-category#medication-mishap "Medication Mishap"
* study.display = "NCT1010101"
* suspectEntity[0].instanceReference.display = "Aspirin"
//* suspectEntity[0].instance.display = "see instance-codeable-concept"
//* suspectEntity[=].causality.entityRelatedness = http://terminology.hl7.org/CodeSystem/adverse-event-causality-assess#certain "Certain"
* suspectEntity[=].causality.entityRelatedness = http://terminology.hl7.org/CodeSystem/adverse-event-causality-assess#certain "Certain"
* suspectEntity[+].instanceReference.display = "Study Medication Use Case 7"
//* suspectEntity[=].instance.display = "see instance-codeable-concept"
//* suspectEntity[=].causality.entityRelatedness = http://terminology.hl7.org/CodeSystem/adverse-event-causality-assess#certain "Certain"
* suspectEntity[=].causality.entityRelatedness = http://terminology.hl7.org/CodeSystem/adverse-event-causality-assess#certain "Certain"

* suspectEntity[+].instanceReference = Reference(medadmin0301)
//* suspectEntity[=].causality.entityRelatedness = http://terminology.hl7.org/CodeSystem/adverse-event-causality-assess#certain "Certain"
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
* extension[seriousness-criteria][=].extension[criterionCode].valueCodeableConcept = $fda-add-seriousness-criteria-cs#requiresPreventImpairment "Required Intervention to Prevent Permanent Impairment or Damage (Devices)"
//#requiresPreventImpairment "required intervention to prevent permanent damage"
* extension[seriousness-criteria][+].extension[criterionPresent].valueBoolean = true
* extension[seriousness-criteria][=].extension[criterionCode].valueCodeableConcept = urn:oid:2.16.840.1.113883.3.989.2.1.1.19#33 "resultsinHospitalization"
* extension[seriousness-criteria][+].extension[criterionPresent].valueBoolean = false
* extension[seriousness-criteria][=].extension[criterionCode].valueCodeableConcept = urn:oid:2.16.840.1.113883.3.989.2.1.1.19#34 "resultsInDeath"

* seriousness = http://terminology.hl7.org/CodeSystem/adverse-event-seriousness#serious
* extension[severity-or-grade].valueCodeableConcept = $ae-severity-or-grade-cs#4 "Life Threatening or Disabling"


Instance: AEHepaticFailureUseCase7
InstanceOf: Condition
Usage: #example
Title: "AEHepaticFailureUseCase7"
Description: "The fifth subject enrolled in the trial develops severe hepatic failure complicated by encephalopathy one month after starting the study. The study sponsors determined that is an unanticipated problem that must be reported because although the risk of mild liver injury was foreseen, severe liver injury resulting in hepatic failure was unexpected in severity; possibly related to participation in the research; and serious."
* subject = Reference(ClinicalTrialSubject5)
* severity = http://snomed.info/sct#24484000 "Severe"
* code =  http://snomed.info/sct#197270009 "Acute Hepatic Failure"
* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active

Instance: AEHepaticFailureUseCase7complication
InstanceOf: Condition
Usage: #example
Title: "AEHepaticFailureUseCase7complication"
Description: "The fifth subject enrolled in the trial develops severe hepatic failure complicated by encephalopathy one month after starting the study. The study sponsors determined that is an unanticipated problem that must be reported because although the risk of mild liver injury was foreseen, severe liver injury resulting in hepatic failure was unexpected in severity; possibly related to participation in the research; and serious."
* subject = Reference(ClinicalTrialSubject5)
* severity = http://snomed.info/sct#24484000 "Severe"
* code =  http://snomed.info/sct#13920009 "Hepatic encephalopathy"
* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active

Instance: medadmin0301
InstanceOf: MedicationAdministration
Usage: #example
Title: "Medication Administration of Med0301"
Description: "Medication administration example"
* contained[0] = med0301
* contained[+] = signature
* status = #in-progress
* medication.reference = Reference(med0301)
* subject.display = "Reference(Patient/pat1) Donald Duck"
* subject.identifier.system = "http://hospital.org/"
* subject.identifier.value = "pat1"
* encounter.identifier.system = "http://hospital.org/"
* encounter.identifier.value = "f001"
* encounter.display = "Reference(Encounter/f001) encounter who leads to this prescription"
* occurencePeriod.start = "2015-01-15T14:30:00+01:00"
* performer.actor.reference.identifier.system = "http://hospital.org/"
* performer.actor.reference.identifier.value = "f007"
* performer.actor.reference.display = "Reference(Practitioner/f007) Patrick Pump"
* reason.concept = http://terminology.hl7.org/CodeSystem/reason-medication-given#b "Given as Ordered"
* request.identifier.system = "http://hospital.org/"
* request.identifier.value = "medrx0318"
* request.display = "Reference(MedicationRequest/medrx0318)"
* dosage.text = "500mg IV q6h x 3 days"
* dosage.route = http://snomed.info/sct#47625008 "Intravenous route (qualifier value)"
* dosage.method.text = "IV Push"
* dosage.dose = 500 'mg' "mg"
* eventHistory = Reference(signature) "Author's Signature"

Instance: med0301
InstanceOf: Medication
Usage: #inline
* code = http://hl7.org/fhir/sid/ndc#0069-2587-10 
* code.text = "Vancomycin"
//"Vancomycin Hydrochloride (VANCOMYCIN HYDROCHLORIDE)"

Instance: signature
InstanceOf: Provenance
Usage: #inline
* target.identifier.system = "http://hospital.org/"
* target.identifier.value = "physiotherapy"
* target.display = "Reference(ServiceRequest/physiotherapy)"
* recorded = "2017-02-01T17:23:07Z"
* agent.role = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#AUT
* agent.who.display = "Reference(Practitioner/example) Dr Adam Careful"
* signature.type = urn:iso-astm:E1762-95:2013#1.2.840.10065.1.12.1.1 "Author's Signature"
* signature.when = "2017-02-01T17:23:07Z"
* signature.who.display = "Practitioner/example Dr Adam Careful"
* signature.targetFormat = #application/fhir+xml
* signature.sigFormat = #application/signature+xml
* signature.data = "dGhpcyBibG9iIGlzIHNuaXBwZWQ="