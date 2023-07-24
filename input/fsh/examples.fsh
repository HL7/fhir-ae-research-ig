Instance: SCHJO
InstanceOf: Patient
Usage: #example
Title: "Serious Adverse Event"
Description: "SAE Patient SCHJO on Research Study XYZ, Study ID XYZ-123, Subject number XYZ-123-002. "
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
//* identifier.display = "number 5"


//https://confluence.hl7.org/pages/viewpage.action?pageId=49646529#AdverseEventUseCases-UseCase7-Clinicaltrial:significantadverseevent
Instance: ClinicalResearchAdverseEventUseCase7
InstanceOf: AdverseEvent-clinical-research
Usage: #example
Title: "ClinicalResearchAdverseEventUseCase7"
Description: "example"
//* actuality = http://hl7.org/fhir/adverse-event-actuality#actual 
* status = http://hl7.org/fhir/event-status#completed
* subject = Reference(ClinicalTrialSubject5)
* outcome = http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#C49496  "Recovering/Resolving"

//* resultingCondition[0] = Reference(AEHepaticFailureUseCase7)
* resultingEffect[0] = Reference(AEHepaticFailureUseCase7)
//* resultingCondition[1] = Reference(AEHepaticFailureUseCase7complication)
* resultingEffect[+] = Reference(AEHepaticFailureUseCase7complication)

//* category = http://terminology.hl7.org/CodeSystem/adverse-event-category#medication-mishap "Medication Mishap"

* study.display = "NCT1010101"

//https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4435341/
//* suspectEntity[0].instanceReference.display = "Aspirin"
//* suspectEntity[=].causality.entityRelatedness = http://terminology.hl7.org/CodeSystem/adverse-event-causality-assess#certain "Certain"

* suspectEntity[+].instanceReference = Reference(medadmin0301) "Study Medication Use Case 7"
* suspectEntity[=].causality.entityRelatedness = http://terminology.hl7.org/CodeSystem/adverse-event-causality-assess#certain "Certain"


* recorder.display = "Clinical Research Associate"
* detected = "1905-08-23"
* recordedDate = "1905-08-24"
* code = http://snomed.info/sct#370901008 "Serious reportable event associated with product or device"

* extension[seriousness-criteria][0].extension[criterionCode].valueCodeableConcept = http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#C11338	"Results In Persistent Or Significant Disability"
* extension[seriousness-criteria][=].extension[criterionPresent].valueBoolean = false
* extension[seriousness-criteria][+].extension[criterionCode].valueCodeableConcept = http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#C83052	"Requires Inpatient Hospitalization"
* extension[seriousness-criteria][=].extension[criterionPresent].valueBoolean = true
* extension[seriousness-criteria][+].extension[criterionCode].valueCodeableConcept = http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#C48275	"Results In Death"
* extension[seriousness-criteria][=].extension[criterionPresent].valueBoolean = false
* extension[seriousness-criteria][+].extension[criterionCode].valueCodeableConcept = http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#C84266	"Is Life Threatening"
* extension[seriousness-criteria][=].extension[criterionPresent].valueBoolean = true
* extension[seriousness-criteria][+].extension[criterionCode].valueCodeableConcept = http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#C83117	"Congenital Anomaly or Birth Defect"
* extension[seriousness-criteria][=].extension[criterionPresent].valueBoolean = false
* extension[seriousness-criteria][+].extension[criterionCode].valueCodeableConcept = http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#C82521	"Other Medically Important Condition"
* extension[seriousness-criteria][=].extension[criterionPresent].valueBoolean = false
* extension[seriousness-criteria][+].extension[criterionCode].valueCodeableConcept = $fda-add-seriousness-criteria-cs#requiresPreventImpairment "Required Intervention to Prevent Permanent Impairment or Damage (Devices)"
* extension[seriousness-criteria][=].extension[criterionPresent].valueBoolean = true

* seriousness = http://terminology.hl7.org/CodeSystem/adverse-event-seriousness#serious
* extension[severity-or-grade].valueCodeableConcept = $ae-severity-or-grade-cs#4 "Life Threatening or Disabling"
* mitigatingAction[+].itemReference = Reference(medicationrequest0301-discontinue)
* mitigatingAction[=].itemReference.display = "Medication Request where study drug prescription was discontinued"


//Here we indicate medication discontinued with stopped status
Instance: medicationrequest0301-discontinue
InstanceOf: MedicationRequest
Usage: #example
Title: "Medication Request for discontinued clinical trial medication 0301"
Description: "Study medication info Medication Request for clinical trial medication 0301 - discontinued"
* contained[0] = med0301
* status = #stopped "Stopped"
* intent = #order
* identifier.use = #official
* identifier.system = "http://www.bmc.nl/portal/medstatements"
* identifier.value = "med0301-studyDrug" 
* medication.reference = Reference(med0301) 
* medication.reference.display = "study medication"
* subject = Reference(ClinicalTrialSubject5)
* authoredOn = "1905-08-23"
* requester.display = "Could be reference to inline contained profile such as Reference(practitioner-1) Ronald Bone, MD"
* reason.concept = http://snomed.info/sct#9014002 "Psoriasis"
* dosageInstruction.text = "500mg IV q6h x 3 days"
* dosageInstruction.route = http://snomed.info/sct#47625008 "Intravenous route (qualifier value)"
* dosageInstruction.method.text = "IV Push"



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
* status = #completed
* medication.reference = Reference(med0301)
* subject.display = "Reference(Patient/pat1) Donald Duck"
* subject.identifier.system = "http://hospital.org/"
* subject.identifier.value = "pat1"
* encounter.identifier.system = "http://hospital.org/"
* encounter.identifier.value = "f001"
* encounter.display = "Reference(Encounter/f001) encounter who leads to this prescription"
* occurencePeriod.start = "1905-07-20T14:30:00+01:00"
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
//"Vancomycin Hydrochloride (VANCOMYCIN HYDROCHLORIDE)"
//* code = http://hl7.org/fhir/sid/ndc#0069-2587-10 
* code.text = "Study Medication for psoriasis"


Instance: signature
InstanceOf: Provenance
Usage: #inline
* target.identifier.system = "http://hospital.org/"
* target.identifier.value = "physiotherapy"
* target.display = "Reference(ServiceRequest/physiotherapy)"
* recorded = "1905-07-20T14:30:00+01:00"
* agent.role = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#AUT
* agent.who.display = "Reference(Practitioner/example) Dr Adam Careful"
* signature.type = urn:iso-astm:E1762-95:2013#1.2.840.10065.1.12.1.1 "Author's Signature"
* signature.when = "1905-07-20T14:30:00+01:00"
* signature.who.display = "Practitioner/example Dr Adam Careful"
* signature.targetFormat = #application/fhir+xml
* signature.sigFormat = #application/signature+xml
* signature.data = "dGhpcyBibG9iIGlzIHNuaXBwZWQ="