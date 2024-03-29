Instance: patient-moumic
InstanceOf: Patient
Title: "Patient MOUMIC"
Description: "Patient MOUMIC on Research Study DISNEY"
* name.family = "Example"
* name.given[0] = "MOUMIC"

Instance: research-study-DISNEY
InstanceOf: ResearchStudy
Description: "Research Study DISNEY"
* title = "Research Study DISNEY"
* identifier.value = "DUCK-828"
* status =  http://hl7.org/fhir/research-study-status#active "Active"

// Study Medication 20 mg subcutaneously daily every morning for diabetes
Instance: study-medication-MMD
InstanceOf: Medication
Description: "Example study medication MMD"
* code = http://www.nlm.nih.gov/research/umls/rxnorm#1991302
* code.text = "semaglutide"

Instance: study-medication-administration-MMD
InstanceOf: MedicationAdministration
Description: "Example for clinical trial medication MMD"
* status = #in-progress "In Progress"
* medication.reference = Reference(study-medication-MMD)
* subject = Reference(patient-moumic)
* occurenceDateTime = "2022-01-21"
* dosage.dose = 20 'mg' "mg"
* dosage.route = http://snomed.info/sct#263887005 "Subcutaneous"

// Tylenol for mitigating action
Instance: medication-tylenol
InstanceOf: Medication
Description: "Example medication for Tylenol"
* code = http://www.nlm.nih.gov/research/umls/rxnorm#202433
* code.text = "Tylenol"

Instance: medication-administration-tylenol
InstanceOf: MedicationAdministration
Description: "Example of Tylenol"
* status = #in-progress "In Progress"
* medication.reference = Reference(medication-tylenol)
* subject = Reference(patient-moumic)
* occurenceDateTime = "2022-02-01"
* dosage.dose = 325 'mg' "mg"
* dosage.route = http://snomed.info/sct#26643006 "Oral use"

Instance: AEHeadache
InstanceOf: Condition
Usage: #example
Title: "AEHeadache"
Description: "Headaches are mild, occur once a week and resolved with Tylenol, but still ongoing. Action taken with the study is dose not changed."
* subject = Reference(patient-moumic)
* severity = http://snomed.info/sct#255604002 "Mild"
* code =  http://snomed.info/sct#25064002 "Headache"
* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active

Instance: NonSeriousAdverseEventResearchStudyMed
InstanceOf: AdverseEvent-clinical-research
Title: "NonSeriousAdverseEventResearchStudyMed"
Description: "Non-Serious Adverse Event Research Study Medication Example"
* status = #completed //http://hl7.org/fhir/event-status#completed
* subject = Reference(patient-moumic)

* code = https://www.meddra.org#10019211 "Headache"

* resultingEffect[0] = Reference(AEHeadache)
* resultingEffect[0].display = "Mild Headache"

* outcome = http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#C49494	"Not recovering/not resolved"
* extension[ae-severity].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/adverse-event-severity#mild "Mild"

* study = Reference(research-study-DISNEY)
* suspectEntity[0].instanceReference = Reference(study-medication-administration-MMD)
* suspectEntity[=].causality.entityRelatedness = http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#C53257 "Unlikely Related"
* occurrencePeriod.start = "2022-02-01"

* seriousness = http://terminology.hl7.org/CodeSystem/adverse-event-seriousness#non-serious "Non-serious"
* mitigatingAction[+].itemReference = Reference(medication-administration-tylenol)
//* mitigatingAction[+].itemCodeableConcept.text = "study drug dose not changed"

//* supportingInfo[+].itemCodeableConcept = https://www.meddra.org#10019211 "Headache"

* extension[caused-subject-to-discontinue-study].valueBoolean = false	
* expectedInResearchStudy = true
* note[0].text = "Headaches are mild, occur once a week and resolved with Tylenol, but still ongoing. Action taken with the study is dose not changed."
